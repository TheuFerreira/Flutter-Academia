import 'package:flutter_academia/model/connection.dart';
import 'package:flutter_academia/model/dayTraining_model.dart';
import 'package:flutter_academia/model/day_model.dart';
import 'package:sqflite/sqflite.dart';

class DAODayTraining {
  Future<List<DayTrainingModel>> getAllOfDay(DayModel day) async {
    Database db = await Connection.db.database;

    List<Map<String, Object?>> result = await db.rawQuery(
        'SELECT dt.id, dt.data, t.id AS idTreino, t.nome AS treinoNome '
        'FROM Dia_Treino AS dt '
        'INNER JOIN Treino AS t ON t.id = dt.idTreino '
        'WHERE dt.IdDia = ? '
        'ORDER BY dt.id DESC',
        [day.id]);

    List<DayTrainingModel> dayTrainings = [];
    for (Map<String, Object?> map in result) {
      DayTrainingModel dayTrainingModel =
          new DayTrainingModel.fromJson(map, day);
      dayTrainings.add(dayTrainingModel);
    }

    return dayTrainings;
  }

  Future<void> insert(DayTrainingModel dayTraining) async {
    Database db = await Connection.db.database;

    await db.rawInsert(
      'INSERT INTO Dia_Treino(data, idTreino, idDia) '
      'VALUES (?, ?, ?)',
      [
        dayTraining.date!.millisecondsSinceEpoch,
        dayTraining.training!.id,
        dayTraining.day!.id,
      ],
    );
  }
}
