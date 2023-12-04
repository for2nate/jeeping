import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int bookPostpaid(int price) {
  double postpaid = price * 0.7;
  int roundedPostpaid = postpaid.round();
  return roundedPostpaid;
}

int bookPrepaid(int price) {
  double prepaid = price * 0.3;
  int roundedPrepaid = prepaid.round();
  return roundedPrepaid;
}

bool showLoading(
  bool hasError,
  String? paymentUrl,
  bool paid,
) {
  return hasError == false &&
      (paymentUrl == null || paymentUrl.isEmpty) &&
      paid == false;
}

bool showWebview(
  bool hasError,
  String? paymentUrl,
  bool paid,
) {
  return hasError == false &&
      paymentUrl != null &&
      paymentUrl.isNotEmpty &&
      paid == false;
}
