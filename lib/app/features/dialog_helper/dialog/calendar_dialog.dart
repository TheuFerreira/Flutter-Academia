import 'package:flutter/material.dart';

class CalendarDialog extends StatelessWidget {
  const CalendarDialog({Key? key, this.selectedDate}) : super(key: key);

  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return new Dialog(
      backgroundColor: Colors.transparent,
      child: new DatePickerDialog(
        initialDate: selectedDate!,
        firstDate: new DateTime(2000, 01, 01),
        lastDate: new DateTime(2050, 01, 01),
      ),
    );
  }
}
