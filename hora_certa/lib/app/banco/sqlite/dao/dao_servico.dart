import 'package:hora_certa/app/dominio/dto/dto_servico.dart';
import 'package:hora_certa/app/dominio/interface/idao_servico.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hora_certa/app/banco/sqlite/conexao.dart';

class DAOServico implements IDAOServico {
  late Database _db;

  final sqlCriarTabela = '''
    CREATE TABLE IF NOT EXISTS servico (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      preco REAL,
      tempo TEXT,
      estaAtivo INTEGER,
      observacao TEXT
    )
  ''';

  final sqlInserir = '''
    INSERT INTO servico (nome, preco, tempo, estaAtivo, observacao)
    VALUES (?, ?, ?, ?, ?)
  ''';
  final sqlAlterar = '''
    UPDATE servico SET nome=?, preco=?, tempo=?, estaAtivo=true, observacao=''
    WHERE id = ?
  ''';
  final sqlAlterarStatus = '''
    UPDATE servico SET estaAtivo='N'
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM servico WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM servico;
  ''';

  Future<void> _criarTabela() async {
    _db = await Conexao.abrir();
    await _db.execute(sqlCriarTabela);
  }

  @override
  Future<DTOServico> salvar(DTOServico dto) async {
    await _criarTabela();
    int id = await _db.insert(
      'servico',
      {
        'nome': dto.nome,
        'preco': dto.preco,
        'tempo': dto.tempo,
        'estaAtivo': dto.estaAtivo ? 1 : 0,
        'observacao': dto.observacao ?? ''
      }
    );
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOServico> alterar(DTOServico dto) async {
    _db = await Conexao.abrir();
    await _db.rawUpdate(sqlAlterar, [
      dto.nome,
      dto.preco,
      dto.tempo,
      dto.estaAtivo ? 1 : 0,
      dto.observacao ?? '',
      dto.id
    ]);
    return dto;
  }

  @override
  Future<bool> alterarStatus(dynamic id) async {
    _db = await Conexao.abrir();
    await _db.rawUpdate(sqlAlterarStatus, [id]);
    return true;
  }

  @override
  Future<List<DTOServico>> consultar() async {
    _db = await Conexao.abrir();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOServico> servicos = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOServico(
          id: linha['id'],
          nome: linha['nome'].toString(),
          preco: linha['preco'] as int,
          tempo: linha['tempo'].toString(),
          estaAtivo: linha['estaAtivo'] == 1,
          observacao: linha['observacao'].toString());
    });
    return servicos;
  }

  @override
  Future<DTOServico> consultarPorId(dynamic id) async {
    _db = await Conexao.abrir();

    var resultado = await _db.rawQuery(sqlConsultarPorId, [id]);

    if (resultado.isEmpty) {
      throw Exception('Servico não encontrado');
    }

    var linha = resultado.first;

    DTOServico servico = DTOServico(
        id: linha['id'],
        nome: linha['nome'].toString(),
        preco: int.parse(linha['preco'].toString()),
        tempo: linha['tempo'].toString(),
        estaAtivo: linha['estaAtivo'] == 1,
        observacao: linha['observacao']?.toString() ?? '');

    return servico;
  }

  @override
  Future<DTOServico> excluir(DTOServico dto) async {
    _db = await Conexao.abrir();
    await _db.rawDelete('DELETE FROM servico WHERE id = ?', [dto.id]);
    return dto;
  }
}
