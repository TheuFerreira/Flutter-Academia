import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_academia/app/features/day/day_controller.dart';
import 'package:flutter_academia/app/features/home/models/day_model.dart';
import 'package:provider/provider.dart';

class SaveButtonComponent extends StatelessWidget {
  const SaveButtonComponent({Key? key, this.day}) : super(key: key);

  final DayModel? day;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DayController>();

    return new TextButton.icon(
      onPressed: () => controller.save(day!),
      icon: new Icon(Icons.save),
      label: new Text(
        'Salvar',
        style: new TextStyle(fontSize: 20),
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.blue,
        minimumSize: new Size(250, 40),
      ),
    );
  }
}
