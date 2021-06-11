import 'package:flutter_academia/model/connection.dart';
import 'package:flutter_academia/model/training_model.dart';
import 'package:sqflite/sqflite.dart';

class DAOTraining {
  Future<List<TrainingModel>> getAllTraining() async {
    Database db = await Connection.db.database;

    List<Map<String, Object?>> result =
        await db.rawQuery('SELECT id, nome FROM Treino');

    List<TrainingModel> trainings = [];
    for (Map<String, Object?> map in result) {
      TrainingModel trainingModel = new TrainingModel.fromJson(map);
      trainings.add(trainingModel);
    }

    return trainings;
  }
}
