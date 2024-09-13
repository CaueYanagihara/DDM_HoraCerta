import 'package:hora_certa/app/dominio/cliente.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'package:hora_certa/app/dominio/interface/idao_cliente.dart';
import 'package:hora_certa/app/banco/sqlite/dao/dao_cliente.dart';

class APCliente {
  late IDAOCliente dao;
  late Cliente dominio;

  APCliente() {
    dao = DAOCliente();
    dominio = Cliente(dao: dao);
  }

  Future<DTOCliente> salvar(DTOCliente dto) async {
    return await dominio.salvar(dto);
  }

  Future<DTOCliente> alterar(dynamic id) async {
    return await dominio.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await dominio
      .excluir(id);
    return true;
  }

  Future<List<DTOCliente>> consultar() async {
    return await dominio.consultar();
  }

  Future<DTOCliente> alterarStatus(dynamic id) async {
    return await dominio.alterar(id);
  }
}
