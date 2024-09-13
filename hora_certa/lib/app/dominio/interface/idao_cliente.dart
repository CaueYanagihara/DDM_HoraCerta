import '../dto/dto_cliente.dart';

abstract class IDAOCliente {
  Future<DTOCliente> salvar(DTOCliente dto);
  Future<DTOCliente> excluir(DTOCliente dto);
  Future<DTOCliente> alterar(DTOCliente dto);
  Future<List<DTOCliente>> consultar();
  Future<bool> alterarStatus(dynamic id);
  Future<DTOCliente> consultarPorId(dynamic id);
}
