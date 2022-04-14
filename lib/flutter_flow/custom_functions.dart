import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String openPercentage(
  int closedCount,
  int openCount,
) {
  int value;
  value = ((openCount / (openCount + closedCount)) * 100).round();
  return '$value%';
}
