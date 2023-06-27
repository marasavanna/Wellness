

import 'package:intl/intl.dart';

formattedDay() {
  final DateTime now = DateTime.now().toLocal();
  String formattedDate = DateFormat('dd MMM').format(now);
  return formattedDate;
}