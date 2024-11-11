import 'package:flutter_test/flutter_test.dart';
import 'package:hora_certa/app/dominio/dto/dto_agenda.dart';
import 'package:hora_certa/app/dominio/interface/idao_agenda.dart';
import '../lib/app/dominio/agenda.dart';

void main() {
  var dao = DAOAgendaFake();

  group('Entidade Agenda', () {
    test('Deve criar uma agenda com dados válidos', () {
      expect(() => Agenda(dao: dao),
        returnsNormally,
      );
    });

    test(
        'Deve lançar uma exceção se a dataHoraInicio for posterior a dataHoraFim',
        () {
      expect(
        //dataHoraInicio: DateTime.now().add(Duration(hours: 1)),
        //dataHoraFim: DateTime.now(),
        () => Agenda(dao: dao),
        throwsException,
      );
    });

    test('Deve lançar uma ValidationException se a dataHoraFim não for futura',
      () { expect(
        //dataHoraInicio: DateTime.now().subtract(Duration(days: 1)),
        //dataHoraFim: DateTime.now().subtract(Duration(days: 1)),
        () => Agenda(dao: dao),
        throwsException,
      );
    });
  });  
}

class DAOAgendaFake implements IDAOAgenda {
  @override
  Future<DTOAgenda> salvar(DTOAgenda dto) async {
    return dto;
  }

  @override
  Future<DTOAgenda> alterar(DTOAgenda dto) async {
    return dto;
  }

  @override
  Future<bool> alterarStatus(id) async {
    return true;
  }

  @override
  Future<List<DTOAgenda>> consultar() async {
    return [
      DTOAgenda(
        id: '1',
        clienteId: '1',
        servicoId: '1',
        atendenteId: '1',
        dataHoraInicio: DateTime.now(),
        dataHoraFim: DateTime.now().add(Duration(hours: 2)),
        preco: 50,
        status: 'P',
        observacao: ''
      ),
    ];
  }

  @override
  Future<DTOAgenda> consultarPorId(id) async {
    return DTOAgenda(
      id: '1',
      clienteId: '1',
      servicoId: '1',
      atendenteId: '1',
      dataHoraInicio: DateTime.now(),
      dataHoraFim: DateTime.now().add(Duration(hours: 2)),
      preco: 50,
      status: 'P',
      observacao: ''
    );
  }

  @override
  Future<DTOAgenda> excluir(DTOAgenda dto) async {
    return DTOAgenda(
      id: '1',
      clienteId: '1',
      servicoId: '1',
      atendenteId: '1',
      dataHoraInicio: DateTime.now(),
      dataHoraFim: DateTime.now().add(Duration(hours: 2)),
      preco: 50,
      status: 'P',
      observacao: ''
    );
  }
}
