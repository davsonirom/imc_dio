import 'package:imc_dio/model/historico_model.dart';
import 'package:imc_dio/services/database_sqlite.dart';
import 'package:sqflite/sqflite.dart';

class ImcRepository {
  //? pegar os registros
  Future<List<HistoricoModel>> obterDados() async {
    List<HistoricoModel> historicos = [];
    Database db = await DatabaseSqlite().getDatabase();
    List<Map<String, Object?>> registros =
        await db.rawQuery('SELECT * FROM imcs');
    for (var registro in registros) {
      historicos.add(
        HistoricoModel(
          int.parse(registro['id'].toString()),
          double.parse(registro['altura'].toString()),
          double.parse(registro['peso'].toString()),
          registro['data'].toString(),
          double.parse(registro['imc'].toString()),
        ),
      );
    }
    return historicos;
  }

  Future<void> salvar(HistoricoModel historico) async {
    Database db = await DatabaseSqlite().getDatabase();
    await db.rawInsert(
      'INSERT INTO imcs (altura, peso, data, imc) values(?,?,?,?)',
      [
        historico.altura,
        historico.peso,
        historico.data,
        historico.imc,
      ],
    );
  }
}
