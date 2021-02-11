import 'package:flutter/material.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/services/notification_service.dart';
import 'package:moneymanager/core/services/sharedprefs_service.dart';
import 'package:moneymanager/core/viewmodels/base_model.dart';

import '../../locator.dart';

// reminder model
class ReminderModel extends BaseModel {
  final NotificationService _notificationService =
      locator<NotificationService>();

  final SharedPreferencesService _sharedPreferencesService =
      locator<SharedPreferencesService>();

  TimeOfDay selectedTime;

  String timeText = '';

  void scheduleNotification() {
    if (selectedTime == null) return;
    _notificationService.showNotificationDaily(
        1,
        'Farm Budget Tracker',
        'Don\'t forget to record your income and expenses!',
        selectedTime.hour,
        selectedTime.minute);
  }

  pickTime(context) async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      selectedTime = time;
      scheduleNotification();

      storeTime(); // in shared prefs
      timeText = await getTime();

      notifyListeners();
    }
  }

  getTime() async {
    return await _sharedPreferencesService.getTime();
  }

  storeTime() async {
    await _sharedPreferencesService.storeTime(
        selectedTime.hour, selectedTime.minute);
  }

  init() async {
    setState(ViewState.Busy);
    notifyListeners();
    timeText = await getTime();
    setState(ViewState.Idle);
    notifyListeners();
  }
}
