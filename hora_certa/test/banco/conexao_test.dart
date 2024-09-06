import 'package:flutter_test/flutter_test.dart';
import 'package:hora_certa/app/banco/conexao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() async {
  Database db;
  setUpAll() {
    databaseFactory = databaseFactoryFfi;
    sqfliteFfiInit();
    db = await Conexao.abrir();
  }

  test('Teste conexao BD', () async {
    var list = await db.rawQuery('SELECT * FROM cliente');
    expect(list.length, 3);
  });
}
