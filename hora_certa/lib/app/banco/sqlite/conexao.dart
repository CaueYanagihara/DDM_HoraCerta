import 'package:hora_certa/app/banco/script.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Conexao {
  static late Database _db;
  static bool conexaoCriada = false;

  static Future<Database> abrir() async {
    if (!conexaoCriada) {
      var path = join(await getDatabasesPath(), 'banco.db');
      await deleteDatabase(path);

      _db = await openDatabase(path, version: 1, onCreate: (db, version) {
        db.execute('''
          CREATE TABLE agenda (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            clienteId TEXT,
            servicoId TEXT,
            atendenteId TEXT,
            atendenteNome TEXT,
            clienteNome TEXT,
            servicoNome TEXT,
            dataHoraInicio TEXT,
            dataHoraFim TEXT,
            preco INTEGER,
            status TEXT,
            observacao TEXT
          )
        ''');
        criarTabelas.forEach(db.execute);
        inserirRegistros.forEach(db.execute);
      });
      conexaoCriada = true;
    }
    return _db;
  }

  static Future<void> fechar() async {
    if (conexaoCriada) {
      await _db.close();
      conexaoCriada = false;
    }
  }
}
