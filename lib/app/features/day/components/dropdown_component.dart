import 'package:flutter/material.dart';
import 'package:flutter_academia/model/training_model.dart';
import 'package:provider/provider.dart';

import '../day_controller.dart';

class DropdownComponent extends StatelessWidget {
  const DropdownComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DayController>();

    return new DropdownButton<TrainingModel>(
      value: controller.selectedTraining,
      onChanged: controller.changeSelectedTraining,
      style: new TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      items: controller.trainings
          .map<DropdownMenuItem<TrainingModel>>(
            (e) => DropdownMenuItem(
              value: e,
              child: new Text(e.name!),
            ),
          )
          .toList(),
    );
  }
}
