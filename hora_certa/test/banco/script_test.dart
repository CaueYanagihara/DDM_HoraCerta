import 'package:flutter_test/flutter_test.dart';
import 'package:hora_certa/app/banco/script.dart';
import 'package:sqflite/sqflite.dart';
import '../banco/script_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() async {
  setUpAll() {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
  }

  test('Teste Script create table', () async {
    var db = await openDatabase(inMemoryDatabasePath, version: 1,
        onCreate: (db, version) {
      deleteDatabase(db.path);
      criarTabelas.forEach(db.execute);
      inserirRegistros.forEach(db.execute);
    });
    var list = await db.rawQuery('SELECT * FROM professor');
    expect(list.length, 3);
  });
}
