import 'package:flutter_test/flutter_test.dart';
import 'package:hora_certa/app/banco/sqlite/conexao.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

main() async {

  late Database db;

  setUpAll(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await Conexao.abrir();

  try {
      var result = await db.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table' AND name='cliente'");
      if (result.isEmpty) {
        await db.execute('''
    CREATE TABLE cliente(
      id INTEGER NOT NULL PRIMARY KEY
      ,nome VARCHAR(200) NOT NULL
      ,cpf VARCHAR(14) NOT NULL UNIQUE
      ,telefone VARCHAR(20) NOT NULL
      ,senha VARCHAR(200) NOT NULL
      ,telefoneEhWhatsapp CHAR(1) NOT NULL
      ,estaAtivo CHAR(1) NOT NULL
      ,observacao VARCHAR(200)
      )
  ''');
      }
    } catch (e) {
      throw Exception('Erro ao tentar verificar ou criar as tabelas: $e');
    }
  });

  group('Testes de conexão', () {
    test('Teste de criação de tabela', () async {
      var lista = await db.rawQuery('SELECT * FROM cliente');
      expect(lista.length, 0);
    });

    test('Teste de inserção', () async {
      await db.insert('cliente', {
        'id': 1,
        'nome': 'Caue',
        'cpf': '11228422958',
        'telefone': '44997400891',
        'senha': 'Senha123',
        'telefoneEhWhatsapp': 'S',
        'estaAtivo': 'S',
        'observacao': 'Teste'
      });

      var list = await db.rawQuery('SELECT * FROM cliente WHERE id = 1');
      expect(list.length, 1);
      expect(list.first['nome'], 'Caue');
      expect(list.first['cpf'], '11228422958');
      expect(list.first['telefone'], '44997400891');
      expect(list.first['senha'], 'Senha123');
      expect(list.first['telefoneEhWhatsapp'], 'S');
      expect(list.first['estaAtivo'], 'S');
      expect(list.first['observacao'], 'Teste');
    });

    test('Teste de atualização', () async {
      await db.update(
        'cliente',
        {'nome': 'Caue'},
        where: 'id = ?',
        whereArgs: [1],
      );

      var list = await db.rawQuery('SELECT * FROM cliente WHERE id = 1');
      expect(list.length, 1);
      expect(list.first['nome'], 'Caue');
    });

    test('Teste de exclusão', () async {
      await db.delete('cliente', where: 'id = ?', whereArgs: [1]);

      var list = await db.rawQuery('SELECT * FROM cliente WHERE id = 1');
      expect(list.length, 0);
    });
  });
}
