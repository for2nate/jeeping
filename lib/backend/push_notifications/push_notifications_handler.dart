import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0xFFF7F7F7),
          child: Image.asset(
            'assets/images/111.jpg',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Home': ParameterData.none(),
  'Guides': ParameterData.none(),
  'Profile': ParameterData.none(),
  'CurrentCategory': (data) async => ParameterData(
        allParams: {
          'category': await getDocumentParameter<CategoriesRecord>(
              data, 'category', CategoriesRecord.fromSnapshot),
        },
      ),
  'CurrentRoute': (data) async => ParameterData(
        allParams: {
          'route': await getDocumentParameter<RoutesRecord>(
              data, 'route', RoutesRecord.fromSnapshot),
        },
      ),
  'EditRoute': (data) async => ParameterData(
        allParams: {
          'route': await getDocumentParameter<RoutesRecord>(
              data, 'route', RoutesRecord.fromSnapshot),
        },
      ),
  'SignIn': ParameterData.none(),
  'LogIn': ParameterData.none(),
  'CurrentGuide': (data) async => ParameterData(
        allParams: {
          'guide': await getDocumentParameter<UsersRecord>(
              data, 'guide', UsersRecord.fromSnapshot),
        },
      ),
  'Onboarding': ParameterData.none(),
  'MyReviews': ParameterData.none(),
  'IssignGuide': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'AddRoute': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'AllChatsPage': ParameterData.none(),
  'AddChat': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.fromSnapshot),
        },
      ),
  'AddHike': ParameterData.none(),
  'EditHike': (data) async => ParameterData(
        allParams: {
          'hike': await getDocumentParameter<HikesRecord>(
              data, 'hike', HikesRecord.fromSnapshot),
        },
      ),
  'Participants': (data) async => ParameterData(
        allParams: {
          'hike': await getDocumentParameter<HikesRecord>(
              data, 'hike', HikesRecord.fromSnapshot),
        },
      ),
  'Orders': ParameterData.none(),
  'CurrentOrder': (data) async => ParameterData(
        allParams: {
          'buying': await getDocumentParameter<OrdersRecord>(
              data, 'buying', OrdersRecord.fromSnapshot),
        },
      ),
  'Payment': (data) async => ParameterData(
        allParams: {
          'order': getParameter<DocumentReference>(data, 'order'),
          'hike': await getDocumentParameter<HikesRecord>(
              data, 'hike', HikesRecord.fromSnapshot),
        },
      ),
  'AddService': ParameterData.none(),
  'EditService': (data) async => ParameterData(
        allParams: {
          'service': await getDocumentParameter<ServicesRecord>(
              data, 'service', ServicesRecord.fromSnapshot),
        },
      ),
  'ManageRoutes': ParameterData.none(),
  'ManageServices': ParameterData.none(),
  'AddCategory': ParameterData.none(),
  'EditCategory': (data) async => ParameterData(
        allParams: {
          'category': await getDocumentParameter<CategoriesRecord>(
              data, 'category', CategoriesRecord.fromSnapshot),
        },
      ),
  'ManageCategories': ParameterData.none(),
  'ForgotPassword': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
