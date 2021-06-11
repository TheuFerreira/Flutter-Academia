import 'package:flutter_academia/model/day_model.dart';
import 'package:flutter_academia/model/training_model.dart';

class DayTrainingModel {
  int? id;
  DateTime? date;
  TrainingModel? training;
  DayModel? day;

  DayTrainingModel({this.id, this.date, this.training, this.day});

  DayTrainingModel.fromJson(Map<String, Object?> map, DayModel dayModel) {
    id = map['id'] as int;
    date = DateTime.fromMillisecondsSinceEpoch(map['data'] as int);

    int idTraining = map['idTreino'] as int;
    String nameTraining = map['treinoNome'] as String;
    training = new TrainingModel(idTraining, nameTraining);

    day = dayModel;
  }
}
