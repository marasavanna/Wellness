import 'package:intl/intl.dart';
import 'package:wellness/enum/enum_tod.dart';

formattedDay() {
  final DateTime now = DateTime.now().toLocal();
  String formattedDate = DateFormat('dd MMM').format(now);
  return formattedDate;
}

TODEnum handleTimeOfDay() {
  final DateTime now = DateTime.now().toLocal();
  if (now.hour < 12) {
    return TODEnum.MORNING;
  } else if (now.hour >= 12 && now.hour < 19) {
    return TODEnum.AFTERNOON;
  } else {
    return TODEnum.EVENING;
  }
}

String getCurrentTodName() {
  return handleTimeOfDay().name.toLowerCase();
}
