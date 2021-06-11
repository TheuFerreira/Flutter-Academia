import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../day_controller.dart';

class TextDateComponent extends StatelessWidget {
  const TextDateComponent({Key? key, this.onPressed}) : super(key: key);

  final Function()? onPressed;

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
          onPressed: onPressed,
          icon: new Icon(Icons.edit),
        )
      ],
    );
  }
}
