
import 'package:flutter_test/flutter_test.dart';
import '../lib/app/dominio/cliente.dart';

void main() {
  group('Entidade Cliente', () {
    test('Deve criar um cliente com dados válidos', () {
      expect(
        () => Cliente(
          id: '1',
          nome: 'Cliente Teste',
          cpf: '070.304.390-07',
          telefone: '123456789',
          senha: 'senha123',
        ),
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
        ),
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
        ),
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
      );
      expect(cliente.telefoneEhWhatsapp, isFalse);
    });
  });
}
