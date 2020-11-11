import 'package:flutter_svg/flutter_svg.dart';

class PryzTimeIcons {
  PryzTimeIcons._();

  static const _alarmPath = 'assets/icons/time/alarm.svg';
  static const _alarmCheckedPath = 'assets/icons/time/alarm-checked.svg';
  static const _alarmMinusPath = 'assets/icons/time/alarm-minus.svg';
  static const _alarmNoPath = 'assets/icons/time/alarm-no.svg';
  static const _alarmPlusPath = 'assets/icons/time/alarm-plus.svg';
  static const _alarmSnoozePath = 'assets/icons/time/alarm-snooze.svg';
  static const _calendarPath = 'assets/icons/time/calendar.svg';
  static const _stopwatchPath = 'assets/icons/time/stopwatch.svg';
  static const _timePath = 'assets/icons/time/time.svg';
  static const _timeHistoryPath = 'assets/icons/time/time-history.svg';
  static const _timerPath = 'assets/icons/time/timer.svg';

  static final alarm = SvgPicture.asset(_alarmPath);
  static final alarmChecked = SvgPicture.asset(_alarmCheckedPath);
  static final alarmMinus = SvgPicture.asset(_alarmMinusPath);
  static final alarmNo = SvgPicture.asset(_alarmNoPath);
  static final alarmPlus = SvgPicture.asset(_alarmPlusPath);
  static final alarmSnooze = SvgPicture.asset(_alarmSnoozePath);
  static final calendar = SvgPicture.asset(_calendarPath);
  static final stopwatch = SvgPicture.asset(_stopwatchPath);
  static final time = SvgPicture.asset(_timePath);
  static final timeHistory = SvgPicture.asset(_timeHistoryPath);
  static final timer = SvgPicture.asset(_timerPath);
}
