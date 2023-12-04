import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_guides_reviews_model.dart';
export 'no_guides_reviews_model.dart';

class NoGuidesReviewsWidget extends StatefulWidget {
  const NoGuidesReviewsWidget({Key? key}) : super(key: key);

  @override
  _NoGuidesReviewsWidgetState createState() => _NoGuidesReviewsWidgetState();
}

class _NoGuidesReviewsWidgetState extends State<NoGuidesReviewsWidget> {
  late NoGuidesReviewsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoGuidesReviewsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 400.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'У этого гида пока нет отзывов',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Urbanist',
                            fontSize: 24.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.manage_search_rounded,
              color: FlutterFlowTheme.of(context).success,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
