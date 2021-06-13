import 'package:flutter/material.dart';
import 'package:flutter_academia/app/features/dialog_helper/dialog/question_dialog.dart';

import 'dialog/calendar_dialog.dart';

class DialogHelpers {
  static showCalendar(BuildContext context, DateTime selectedDate) async =>
      await showDialog(
        context: context,
        builder: (builder) {
          return new CalendarDialog(selectedDate: selectedDate);
        },
      );

  static showQuestion(BuildContext context, String message) async =>
      await showDialog(
        context: context,
        builder: (builder) {
          return new QuestionDialog(message);
        },
      );
}
