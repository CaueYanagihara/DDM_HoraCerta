import 'package:hora_certa/app/banco/script.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Conexao {
  static late Database _db;
  static bool conexaoCriada = false;

  static Future<Database> abrir() async {
    if (!conexaoCriada) {
      var path = join(await getDatabasesPath(), 'banco.db');
      _db = await openDatabase(
        path, 
        version: 1, 
        onCreate: (db, version) {
          criarTabelas.forEach(db.execute);
          inserirRegistros.forEach(db.execute);
        }
      );
      conexaoCriada = true;
    }
    return _db;
  }
}
