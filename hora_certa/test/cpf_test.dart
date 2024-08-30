import 'package:flutter_test/flutter_test.dart';
import '../dominio/cpf.dart';

main(List<String> args) {
  group('Entidade CPF', () {
    test('Teste com CPF valido', () {
      expect(() => CPF('070.304.390-07'), returnsNormally);
    });
    test('Teste para CPF vazio', () {
      expect(() => CPF(''), throwsException);
    });
  });
  group('Entidade CPF deve possuir 11 números', () {
    test('Teste com CPF de 11 números', () {
      expect(() => CPF('070.304.390-07').eOnzeNumeros(), returnsNormally);
    });
    test('Teste com CPF maior que 11 números', () {
      expect(() => CPF('070.304.390-077').eOnzeNumeros(), throwsException);
    });
    test('Teste com CPF menor que 11 números', () {
      expect(() => CPF('0').eOnzeNumeros(), throwsException);
    });
  });
}
