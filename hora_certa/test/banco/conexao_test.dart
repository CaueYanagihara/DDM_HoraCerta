import 'package:flutter_test/flutter_test.dart';
import 'package:hora_certa/app/banco/conexao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() async {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  test('Teste classe conexao', () async {
    var db = await Conexao.abrir();
    expect(db.isOpen, true);
    await db.close();
  });
}
