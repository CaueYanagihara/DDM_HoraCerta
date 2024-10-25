import 'package:hora_certa/app/dominio/cliente.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'package:hora_certa/app/dominio/interface/idao_cliente.dart';
import 'package:hora_certa/app/banco/sqlite/dao/dao_cliente.dart';

class APCliente {
  late DTOCliente dto;
  late IDAOCliente dao;
  late Cliente cliente;

  APCliente() {
    dao = DAOCliente();
    cliente = Cliente(dao: dao);
  }

  void validarCliente() {
    cliente = Cliente(dao: dao);
  }

  Future<DTOCliente> salvar(DTOCliente dto) async {
    validarCliente();
    await cliente.salvar(dto);

    var clientes = await cliente.consultar();
    var clienteSalvo = clientes.firstWhere(
      (c) => c.cpf == cliente.cpf, 
      orElse: () {
        throw Exception('Erro: Cliente não encontrado no banco de dados.');
      }
    );

    return clienteSalvo;
  }

  Future<DTOCliente> alterar(dynamic id) async {
    validarCliente();
    return await cliente.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await cliente.excluir(id);
    return true;
  }

  Future<List<DTOCliente>> consultar() async {
    return await cliente.consultar();
  }

  Future<DTOCliente> alterarStatus(dynamic id) async {
    validarCliente();
    return await cliente.alterar(id);
  }
}
