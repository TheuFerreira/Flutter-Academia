import 'package:flutter_academia/model/connection.dart';
import 'package:flutter_academia/model/day_model.dart';
import 'package:sqflite/sqflite.dart';

class DAODay {
  Future<List<DayModel>> getAllDays() async {
    Database db = await Connection.db.database;
    List<Map<String, Object?>> result =
        await db.rawQuery('SELECT d.id, d.nome, d.cor, dt.sub_name, MAX(dt.id) '
            'FROM Dia AS d '
            'LEFT JOIN ( '
            'SELECT dt.id, dt.IdDia, t.nome AS "sub_name" '
            'FROM Dia_Treino AS dt '
            'INNER JOIN Treino AS t ON dt.idTreino = t.Id '
            ') AS dt ON d.id = dt.idDia '
            'GROUP BY d.id;');

    List<DayModel> days = [];
    for (Map<String, Object?> map in result) {
      DayModel day = DayModel.fromJson(map);
      days.add(day);
    }

    return days;
  }
}
