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

    return new TextButton(
      onPressed: () => controller.save(day!),
      child: new Text(
        'Salvar',
        style: new TextStyle(fontSize: 30),
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: day!.color,
        minimumSize: new Size(200, 60),
      ),
    );
  }
}
