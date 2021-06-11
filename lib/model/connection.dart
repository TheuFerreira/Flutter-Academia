import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  Connection._();

  static final Connection db = Connection._();

  static Database? _database;

  Future<Database> get database async {
    // ignore: unnecessary_null_comparison
    if (_database != null) return _database!;

    _database = await _initDb();
    return _database!;
  }

  set close(bool value) {
    _database!.close();
    _database = null;
  }

  Future<Database> _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path + "\paulao.db";

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE "Dia" ( ' +
          '"id"	INTEGER NOT NULL, ' +
          '"nome"	VARCHAR(50) NOT NULL, ' +
          '"cor"	INTEGER NOT NULL, ' +
          'PRIMARY KEY("id" AUTOINCREMENT) ' +
          ')');

      await db.execute('INSERT INTO Dia(nome, cor) VALUES ' +
          '("Segunda Feira", 4281906943), ' +
          '("Terça Feira", 4294938957), ' +
          '("Quarta Feira", 4286503255), ' +
          '("Quinta Feira", 4291521766), ' +
          '("Sexta Feira", 4278425758), ' +
          '("Sábado", 4294958681), ' +
          '("Domingo", 4294924119);');

      await db.execute('CREATE TABLE "Treino" ( ' +
          '"id"	INTEGER NOT NULL, ' +
          '"nome"	VARCHAR(50) NOT NULL, ' +
          'PRIMARY KEY("id" AUTOINCREMENT) ' +
          ');');

      await db.execute('INSERT INTO Treino (nome) VALUES '
          '("Bíceps"),'
          '("Tríceps"),'
          '("Peito"),'
          '("Dorsal"),'
          '("Perna"),'
          '("Ombro"),'
          '("Abdominal"),'
          '("Cardio");');

      await db.execute('CREATE TABLE "Dia_Treino" ( '
          '"id"	INTEGER NOT NULL,'
          '"data"	INTEGER NOT NULL,'
          '"idTreino"	INTEGER NOT NULL,'
          '"idDia"	INTEGER NOT NULL,'
          'FOREIGN KEY("IdDia") REFERENCES "Dia"("id"),'
          'PRIMARY KEY("id" AUTOINCREMENT),'
          'FOREIGN KEY("idTreino") REFERENCES "Treino"("id")'
          ')');
    });
  }
}
