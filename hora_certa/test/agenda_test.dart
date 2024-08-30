import 'package:flutter_test/flutter_test.dart';
import '../dominio/agenda.dart';
import '../dominio/common/exceptions/validation_exception.dart';

void main() {
  group('Entidade Agenda', () {
    test('Deve criar uma agenda com dados válidos', () {
      expect(
        () => Agenda(
          id: '1',
          clienteId: 'cliente1',
          servicoId: 'servico1',
          dataHoraInicio: DateTime.now().add(Duration(hours: 1)),
          dataHoraFim: DateTime.now().add(Duration(hours: 2)),
          atendenteId: 'atendente1',
        ),
        returnsNormally,
      );
    });

    test(
        'Deve lançar uma exceção se a dataHoraInicio for posterior a dataHoraFim',
        () {
      expect(
        () => Agenda(
          id: '1',
          clienteId: 'cliente1',
          servicoId: 'servico1',
          dataHoraInicio: DateTime.now().add(Duration(hours: 2)),
          dataHoraFim: DateTime.now().add(Duration(hours: 1)),
          atendenteId: 'atendente1',
        ),
        throwsException,
      );
    });

    test('Deve lançar uma ValidationException se a dataHoraFim não for futura',
        () {
      expect(
        () => Agenda(
          id: '1',
          clienteId: 'cliente1',
          servicoId: 'servico1',
          dataHoraInicio: DateTime.now().subtract(Duration(days: 1)),
          dataHoraFim: DateTime.now().subtract(Duration(days: 1)),
          atendenteId: 'atendente1',
        ),
        throwsA(isA<ValidationException>()),
      );
    });
  });
}
