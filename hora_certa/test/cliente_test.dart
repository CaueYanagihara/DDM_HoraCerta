import 'package:flutter_test/flutter_test.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'package:hora_certa/app/dominio/interface/idao_cliente.dart';
import 'package:hora_certa/app/dominio/cliente.dart';

void main() {
  DAOClienteFake dao = DAOClienteFake();
  DTOCliente dtoValido = DTOCliente(
    nome: 'Caue',
    cpf: '070.304.390-07',
    telefone: '123456789',
    senha: 'senha123',
    telefoneEhWhatsapp: true,
    estaAtivo: true);
  
  DTOCliente dtoSemNome = DTOCliente(
    nome: '',
    cpf: '070.304.390-07',
    telefone: '123456789',
    senha: 'senha123',
    telefoneEhWhatsapp: true,
    estaAtivo: true);

  DTOCliente dtoSemCPF = DTOCliente(
    nome: 'Caue',
    cpf: '',
    telefone: '123456789',
    senha: 'senha123',
    telefoneEhWhatsapp: true,
    estaAtivo: true);

  group('Entidade Cliente', () {
    test('Deve criar um cliente com dados válidos', () {
      dto.cpf = '1'; // Agora dto é acessível aqui

      expect(
        () => Cliente(dao),
        returnsNormally,
      );
    });

    test('Deve lançar uma exceção se o telefone for vazio', () {
      expect(
        () => Cliente(
            id: '1',
            nome: 'Cliente Teste',
            cpf: '070.304.390-07',
            telefone: '',
            senha: 'senha123',
            telefoneEhWhatsapp: true,
            estaAtivo: true,
            observacao: ''),
        throwsException,
      );
    });

    test('Deve lançar uma exceção se a senha for menor que 6 caracteres', () {
      expect(
        () => Cliente(
            id: '1',
            nome: 'Cliente Teste',
            cpf: '070.304.390-07',
            telefone: '123456789',
            senha: '123',
            telefoneEhWhatsapp: true,
            estaAtivo: true,
            observacao: ''),
        throwsException,
      );
    });

    test('Deve criar um cliente com telefoneEhWhatsapp padrão como false', () {
      final cliente = Cliente(
          id: '1',
          nome: 'Cliente Teste',
          cpf: '070.304.390-07',
          telefone: '123456789',
          senha: 'senha123',
          telefoneEhWhatsapp: false,
          estaAtivo: true,
          observacao: 'Divida de 100 reais');
      expect(cliente.telefoneEhWhatsapp, isFalse);
    });
  });
}

class DAOClienteFake implements IDAOCliente {
  @override
  Future<DTOCliente> alterar(DTOCliente dto) {
    // TODO: implement alterar
    throw UnimplementedError();
  }

  @override
  Future<bool> alterarStatus(id) {
    // TODO: implement alterarStatus
    throw UnimplementedError();
  }

  @override
  Future<List<DTOCliente>> consultar() {
    // TODO: implement consultar
    throw UnimplementedError();
  }

  @override
  Future<DTOCliente> consultarPorId(id) {
    // TODO: implement consultarPorId
    throw UnimplementedError();
  }

  @override
  Future<DTOCliente> excluir(DTOCliente dto) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  Future<DTOCliente> salvar(DTOCliente dto) {
    dto.id = 1;
    return dto;
  }
}
