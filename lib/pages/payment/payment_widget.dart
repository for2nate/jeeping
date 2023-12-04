import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'payment_model.dart';
export 'payment_model.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({
    Key? key,
    required this.order,
    required this.hike,
  }) : super(key: key);

  final DocumentReference? order;
  final HikesRecord? hike;

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  late PaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultg4c = await InitialPaymentCall.call(
        orderId: widget.order?.id,
      );
      if ((_model.apiResultg4c?.succeeded ?? true)) {
        setState(() {
          _model.paymentUrl = getJsonField(
            (_model.apiResultg4c?.jsonBody ?? ''),
            r'''$.url''',
          ).toString().toString();
        });
      } else {
        setState(() {
          _model.hasError = true;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed('Profile');
            },
          ),
          title: Text(
            'Оплата',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Urbanist',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<OrdersRecord>(
            stream: OrdersRecord.getDocument(widget.order!)
              ..listen((columnOrdersRecord) async {
                if (_model.columnPreviousSnapshot != null &&
                    !OrdersRecordDocumentEquality().equals(
                        columnOrdersRecord, _model.columnPreviousSnapshot)) {
                  _model.checkPayment = await OrdersRecord.getDocumentOnce(
                      columnOrdersRecord.reference);
                  if (columnOrdersRecord.paid == true) {
                    triggerPushNotification(
                      notificationTitle: 'Новый участник похода',
                      notificationText: 'Пользователь ${valueOrDefault<String>(
                        currentUserDisplayName,
                        'Без имени',
                      )} забронировал место в походе с Вами',
                      notificationSound: 'default',
                      userRefs: [widget.hike!.guide!],
                      initialPageName: 'Profile',
                      parameterData: {},
                    );
                    triggerPushNotification(
                      notificationTitle: 'Новый заказ',
                      notificationText:
                          'Пользователь ${currentUserDisplayName} оплатил поход',
                      notificationSound: 'default',
                      userRefs: FFAppState().adminRecipient.toList(),
                      initialPageName: 'Orders',
                      parameterData: {},
                    );

                    await widget.hike!.reference.update({
                      ...mapToFirestore(
                        {
                          'Participants':
                              FieldValue.arrayUnion([currentUserReference]),
                        },
                      ),
                    });

                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'BookedHikes':
                              FieldValue.arrayUnion([widget.hike?.reference]),
                        },
                      ),
                    });
                  }

                  setState(() {});
                }
                _model.columnPreviousSnapshot = columnOrdersRecord;
              }),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).success,
                      ),
                    ),
                  ),
                );
              }
              final columnOrdersRecord = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (functions.showLoading(_model.hasError,
                        _model.paymentUrl, columnOrdersRecord.paid))
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.network(
                                'https://lottie.host/bd58fdec-5f01-40b0-97ed-144c32d35f5c/Ot2fGZha9K.json',
                                width: 150.0,
                                height: 130.0,
                                fit: BoxFit.cover,
                                animate: true,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Загрузка...',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontSize: 18.0,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    if (columnOrdersRecord.paid == true)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.network(
                            'https://lottie.host/3fa934e7-ce98-4116-bf50-7c8a007ec69f/5eo3CZ8jzX.json',
                            width: 150.0,
                            height: 130.0,
                            fit: BoxFit.contain,
                            animate: true,
                          ),
                          Text(
                            'Успешная оплата',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 18.0,
                                ),
                          ),
                        ],
                      ),
                    if (_model.hasError == true)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.network(
                            'https://lottie.host/5951e9ae-076d-413a-b43f-061788fd32d1/deyLIpaZl6.json',
                            width: 150.0,
                            height: 130.0,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                          Text(
                            'Что-то пошло не так',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 18.0,
                                ),
                          ),
                        ],
                      ),
                    if (functions.showWebview(false, _model.paymentUrl, false))
                      FlutterFlowWebView(
                        content: _model.paymentUrl!,
                        bypass: false,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        verticalScroll: false,
                        horizontalScroll: false,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
