import 'package:hora_certa/app/dominio/cliente.dart';
import 'package:hora_certa/app/dominio/interface/idao_cliente.dart';

class ACliente {
  Cliente cliente;
  IDAOCliente dao;

  ACliente({required this.cliente, required this.dao}) {}

  salvar() {
    cliente.incluir();
  }
}
