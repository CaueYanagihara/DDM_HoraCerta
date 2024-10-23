import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'package:hora_certa/app/dominio/interface/idao_cliente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hora_certa/app/banco/sqlite/conexao.dart';

class DAOCliente implements IDAOCliente {
  late Database _db;
  final sqlInserir = '''
    INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo)
    VALUES (?,?,?,?,?,?)
  ''';
  final sqlAlterar = '''
    UPDATE cliente SET nome=?, cpf=?, telefone=?, senha=?, telefoneEhWhatsapp=?, estaAtivo=?
    WHERE id = ?
  ''';
  final sqlAlterarStatus = '''
    UPDATE cliente SET estaAtivo='N'
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM cliente WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM cliente;
  ''';

  @override
  Future<DTOCliente> salvar(DTOCliente dto) async {
    _db = await Conexao.abrir();
    int id = await _db.rawInsert(
        sqlInserir,
        [
          dto.nome,
          dto.cpf,
          dto.telefone,
          dto.senha,
          dto.telefoneEhWhatsapp,
          dto.estaAtivo,
          dto.observacao
        ]);
    dto.id = id;
    return dto;
  }
  
  @override
  Future<DTOCliente> alterar(DTOCliente dto) async {
    _db = await Conexao.abrir();
    await _db.rawUpdate(sqlAlterar,
        [
      dto.nome,
      dto.cpf,
      dto.telefone,
      dto.senha,
      dto.telefoneEhWhatsapp,
      dto.estaAtivo,
      dto.observacao,
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
  Future<List<DTOCliente>> consultar() async {
    _db = await Conexao.abrir();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOCliente> clientes = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOCliente(
        id: linha['id'],
        nome: linha['nome'].toString(),
        cpf: linha['cpf'].toString(),
        telefone: linha['telefone'].toString(),
        senha: linha['senha'].toString(),
        telefoneEhWhatsapp: linha['telefoneEhWhatsapp']  == 1,
        estaAtivo: linha['estaAtivo'] == 1,
        observacao: linha['observacao'].toString()
      );
    });
    return clientes;
  }
  
  @override
  Future<DTOCliente> consultarPorId(dynamic id) async {
    _db = await Conexao.abrir();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOCliente cliente = DTOCliente(
      id: resultado['id'],
      nome: resultado['nome'].toString(),
      cpf: resultado['cpf'].toString(),
      telefone: resultado['telefone'].toString(),
      senha: resultado['senha'].toString(),
      telefoneEhWhatsapp: resultado['telefoneEhWhatsapp'] == 1,
      estaAtivo: resultado['estaAtivo'] == 1,
        observacao: resultado['observacao'].toString()
    );
    return cliente;
  }
  
  @override
  Future<DTOCliente> excluir(DTOCliente dto) async {
    _db = await Conexao.abrir();
    await _db.rawDelete(
        'DELETE * FROM cliente WHERE id = (?),',
        [dto.id]);
    return dto; //VERIFICAR SE ISSO NAO VAI DAR ERRO
  }
}
