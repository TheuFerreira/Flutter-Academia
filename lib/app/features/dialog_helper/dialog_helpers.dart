import 'package:flutter/material.dart';

import 'dialog/calendar_dialog.dart';

class DialogHelpers {
  static showCalendar(BuildContext context, DateTime selectedDate) async =>
      await showDialog(
        context: context,
        builder: (builder) {
          return new CalendarDialog(selectedDate: selectedDate);
        },
      );
}
