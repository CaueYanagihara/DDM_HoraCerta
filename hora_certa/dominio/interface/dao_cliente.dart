import '../dto/dto_cliente.dart';

abstract class IDAOCliente {
  DTOCliente salvar(DTOCliente dto);
  DTOCliente excluir(DTOCliente dto);
  DTOCliente alterar(DTOCliente dto);
  DTOCliente consultar(DTOCliente dto);
}
