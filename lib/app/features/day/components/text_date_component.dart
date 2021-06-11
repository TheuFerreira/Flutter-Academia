import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academia/app/features/dialog_helper/dialog_helpers.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../day_controller.dart';

class TextDateComponent extends StatelessWidget {
  const TextDateComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DayController>();
    String date = new DateFormat("dd/MM/yyyy").format(controller.selectedDate);

    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Text(
          'Data: $date',
          style: new TextStyle(fontSize: 20),
        ),
        new IconButton(
          onPressed: () => changeDate(context, controller),
          icon: new Icon(Icons.edit),
        )
      ],
    );
  }

  Future<void> changeDate(
      BuildContext context, DayController controller) async {
    var result =
        await DialogHelpers.showCalendar(context, controller.selectedDate);
    if (result == null) return;

    DateTime _ = DateTime.parse(result.toString());
    controller.changeDate(_);
  }
}
