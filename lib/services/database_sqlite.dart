import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

//! tabela do bando de dados
Map<int, String> script = {
  1: '''
        CREATE TABLE imcs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          altura REAL,
          peso REAL,
          data TEXT,
          imc REAL
        );
     '''
};

class DatabaseSqlite {
  static Database? db;

  Future<Database> getDatabase() async {
    if (db == null) {
      return await iniciarBancoDeDados();
    } else {
      return db!;
    }
  }

  Future<Database> iniciarBancoDeDados() async {
    var db = await openDatabase(
        path.join(await getDatabasesPath(), 'database.db'),
        version: script.length, onCreate: (Database db, int version) async {
      for (int i = 1; i <= script.length; i++) {
        await db.execute(script[i]!);
      }
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (int i = oldVersion + 1; i <= script.length; i++) {
        await db.execute(script[i]!);
      }
    });

    return db;
  }
}
