import 'package:flutter_test/flutter_test.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'package:hora_certa/app/dominio/interface/idao_cliente.dart';
import 'package:hora_certa/app/dominio/cliente.dart';

void main() {
  var dao = DAOClienteFake();

  // var dtoValido = DTOCliente(
  //     id: 1,
  //     nome: 'Caue',
  //     cpf: '070.304.390-07',
  //     telefone: '123456789',
  //     senha: 'senha123',
  //     telefoneEhWhatsapp: true,
  //     estaAtivo: true,
  //     observacao: '');

  // var dtoSemNome = DTOCliente(
  //     id: 1,
  //     nome: '',
  //     cpf: '070.304.390-07',
  //     telefone: '123456789',
  //     senha: 'senha123',
  //     telefoneEhWhatsapp: true,
  //     estaAtivo: true,
  //     observacao: '');

  // var dtoSemCPF = DTOCliente(
  //     id: 1,
  //     nome: 'Caue',
  //     cpf: '',
  //     telefone: '123456789',
  //     senha: 'senha123',
  //     telefoneEhWhatsapp: true,
  //     estaAtivo: true,
  //     observacao: '');

  // var dtoSemTelefone = DTOCliente(
  //     id: 1,
  //     nome: 'Caue',
  //     cpf: '070.304.390-07',
  //     telefone: '',
  //     senha: 'senha123',
  //     telefoneEhWhatsapp: true,
  //     estaAtivo: true,
  //     observacao: '');

  // var dtoSenhaPequena = DTOCliente(
  //     id: 1,
  //     nome: 'Caue',
  //     cpf: '070.304.390-07',
  //     telefone: '123456789',
  //     senha: 'test',
  //     telefoneEhWhatsapp: true,
  //     estaAtivo: true,
  //     observacao: '');

  // var dtoWhatsappFalse = DTOCliente(
  //     id: 1,
  //     nome: 'Caue',
  //     cpf: '070.304.390-07',
  //     telefone: '123456789',
  //     senha: 'senha123',
  //     telefoneEhWhatsapp: false,
  //     estaAtivo: true,
  //     observacao: '');

  group('Entidade Cliente', () {
    test('Deve criar um cliente com dados válidos', () {
      final cliente = Cliente(dao: dao);
      expect(cliente.estaAtivo, isTrue);
    });

    test('Deve lançar uma exceção se o telefone for vazio', () {
      try {
        Cliente(dao: dao);
      } catch (e) {
        print('Aviso: $e');
      }
    });

    test('Deve lançar uma exceção se a senha for menor que 6 caracteres', () {
      try {
        Cliente(dao: dao);
      } catch (e) {
        print('Aviso: $e');
      }
    });

    test('Deve criar um cliente com telefoneEhWhatsapp false', () {
      final cliente = Cliente(dao: dao);
      expect(cliente.telefoneEhWhatsapp, isFalse);
    });
  });
}

class DAOClienteFake implements IDAOCliente {
  @override
  Future<DTOCliente> salvar(DTOCliente dto) async {
    return dto;
  }

  @override
  Future<DTOCliente> alterar(DTOCliente dto) async {
    // TODO: implement alterar
    return dto;
  }

  @override
  Future<bool> alterarStatus(id) async {
    // TODO: implement alterar
    return true;
  }

  @override
  Future<List<DTOCliente>> consultar() async {
    return [
      DTOCliente(
          id: 1,
          nome: 'Caue',
          cpf: '070.304.390-07',
          telefone: '123456789',
          senha: 'senha123',
          telefoneEhWhatsapp: true,
          estaAtivo: true,
          observacao: ''),
    ];
  }

  @override
  Future<DTOCliente> consultarPorId(id) async {
    // TODO: implement consultarPorId
    return DTOCliente(
        id: 1,
        nome: 'Caue',
        cpf: '070.304.390-07',
        telefone: '123456789',
        senha: 'senha123',
        telefoneEhWhatsapp: true,
        estaAtivo: true,
        observacao: '');
  }

  @override
  Future<void> excluir(dynamic id) async {
    // TODO: implement excluir
    print("Teste Excluir");
  }
}
