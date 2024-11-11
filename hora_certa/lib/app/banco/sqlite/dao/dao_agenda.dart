import 'package:hora_certa/app/dominio/dto/dto_agenda.dart';
import 'package:hora_certa/app/dominio/interface/idao_agenda.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hora_certa/app/banco/sqlite/conexao.dart';

class DAOAgenda implements IDAOAgenda {
  late Database _db;

  final sqlInserir = '''
    INSERT INTO agenda (clienteId, servicoId, atendenteId, dataHoraInicio, dataHoraFim, status, observacao)
    VALUES (?,?,?,?,?,?,?)
  ''';
  final sqlAlterar = '''
    UPDATE agenda 
    SET clienteId=?, servicoId=?, atendenteId=?, dataHoraInicio=?, dataHoraFim=?, status=?, observacao=?
    WHERE id = ?
  ''';
  final sqlAlterarStatus = '''
    UPDATE agenda 
    SET status='F'
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * 
    FROM agenda 
    WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * 
    FROM agenda;
  ''';

  @override
  Future<DTOAgenda> salvar(DTOAgenda dto) async {
    _db = await Conexao.abrir();
    int id = await _db.rawInsert(sqlInserir,
      [dto.clienteId, 
      dto.servicoId, 
      dto.atendenteId, 
      dto.dataHoraInicio, 
      dto.dataHoraFim, 
      dto.status, 
      dto.observacao]
    );
    dto.id = id;
    return dto;
  }

  @override
  Future<DTOAgenda> alterar(DTOAgenda dto) async {
    _db = await Conexao.abrir();
    await _db.rawUpdate(sqlAlterar, 
      [dto.clienteId, 
      dto.servicoId, 
      dto.atendenteId, 
      dto.dataHoraInicio, 
      dto.dataHoraFim, 
      dto.status, 
      dto.observacao,
      dto.id]
    );
    return dto;
  }

  @override
  Future<bool> alterarStatus(dynamic id) async {
    _db = await Conexao.abrir();
    await _db.rawUpdate(sqlAlterarStatus, [id]);
    return true;
  }

  @override
  Future<List<DTOAgenda>> consultar() async {
    _db = await Conexao.abrir();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOAgenda> agendas = List.generate(
      resultado.length, (i) {
        var linha = resultado[i];
        return DTOAgenda(
          id: linha['id'],
          clienteId: linha['clienteId']?.toString() ?? '',
          servicoId: linha['servicoId']?.toString() ?? '',
          atendenteId: linha['atendenteId']?.toString() ?? '',
          dataHoraInicio: DateTime.parse(linha['dataHoraInicio'].toString()),
          dataHoraFim: DateTime.parse(linha['dataHoraFim'].toString()),
          preco: int.parse(linha['preco'].toString()),  
          status: linha['status'].toString(),
          observacao: linha['observacao']?.toString() ?? ''
        );
      }
    );
    return agendas;
  }

  //clienteId, servicoId, atendenteId, dataHoraInicio, dataHoraFim, status, observacao

  @override
  Future<DTOAgenda> consultarPorId(dynamic id) async {
    _db = await Conexao.abrir();

    var resultado = await _db.rawQuery(sqlConsultarPorId, [id]);

    if (resultado.isEmpty) {
      throw Exception('Agenda não encontrado');
    }

    var linha = resultado.first;

    DTOAgenda agenda = DTOAgenda(
      id: linha['id'],
      clienteId: linha['clienteId']?.toString() ?? '',
      servicoId: linha['servicoId']?.toString() ?? '',
      atendenteId: linha['atendenteId']?.toString() ?? '',
      dataHoraInicio: DateTime.parse(linha['dataHoraInicio'].toString()),
      dataHoraFim: DateTime.parse(linha['dataHoraFim'].toString()),
      preco: int.parse(linha['preco'].toString()),
      status: linha['status'].toString(),
      observacao: linha['observacao']?.toString() ?? ''
    );

    return agenda;
  }

  @override
  Future<DTOAgenda> excluir(DTOAgenda dto) async {
    _db = await Conexao.abrir();
    await _db.rawDelete('DELETE FROM agenda WHERE id = ?', [dto.id]);
    return dto;
  }
}
