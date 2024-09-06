import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'package:hora_certa/app/dominio/interface/idao_cliente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hora_certa/app/banco/conexao.dart';

class DaoCliente implements IDAOCliente {
  late Database _db;

  Future<DTOCliente> alterarStatus(DTOCliente dto) {
    throw UnimplementedError();
  }

  @override
  Future<DTOCliente> salvar(DTOCliente dto) async {
    _db = await Conexao.abrir();
    int id = await _db.rawInsert(
        'INSERT INTO cliente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo) VALUES (?,?,?,?,?,?),',
        [
          dto.nome,
          dto.cpf,
          dto.telefone,
          dto.senha,
          dto.telefoneEhWhatsapp,
          dto.estaAtivo
        ]);
    dto.id = id;
    return dto;
  }
  
  @override
  Future<DTOCliente> alterar(DTOCliente dto) async {
    // TODO: implement alterar
    throw UnimplementedError();
  }
  
  @override
  Future<DTOCliente> consultar(DTOCliente dto) async {
    // TODO: implement consultar
    throw UnimplementedError();
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
