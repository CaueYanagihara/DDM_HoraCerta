import 'package:flutter_test/flutter_test.dart';
import 'package:hora_certa/app/dominio/dto/dto_atendente.dart';
import 'package:hora_certa/app/dominio/interface/idao_atendente.dart';
import 'package:hora_certa/app/dominio/atendente.dart';

void main() {
  var dao = DAOAtendenteFake();

  var dtoValido = DTOAtendente(
      id: 1,
      nome: 'Caue',
      cpf: '070.304.390-07',
      senha: 'senha123',
      estaAtivo: true,
      observacao: '');

  var dtoSemNome = DTOAtendente(
      id: 1,
      nome: '',
      cpf: '070.304.390-07',
      senha: 'senha123',
      estaAtivo: true,
      observacao: '');

  var dtoSemCPF = DTOAtendente(
      id: 1,
      nome: 'Caue',
      cpf: '',
      senha: 'senha123',
      estaAtivo: true,
      observacao: '');

  var dtoSemTelefone = DTOAtendente(
      id: 1,
      nome: 'Caue',
      cpf: '070.304.390-07',
      senha: 'senha123',
      estaAtivo: true,
      observacao: '');

  var dtoSenhaPequena = DTOAtendente(
      id: 1,
      nome: 'Caue',
      cpf: '070.304.390-07',
      senha: 'test',
      estaAtivo: true,
      observacao: '');

  var dtoWhatsappFalse = DTOAtendente(
      id: 1,
      nome: 'Caue',
      cpf: '070.304.390-07',
      senha: 'senha123',
      estaAtivo: true,
      observacao: '');

  group('Entidade Atendente', () {
    test('Deve criar um atendente com dados válidos', () {
      expect(
        () => Atendente(dao: dao),
        returnsNormally,
      );
    });

    test('Deve lançar uma exceção se a senha for menor que 6 caracteres', () {
      expect(
        () => Atendente(dao: dao),
        throwsException,
      );
    });

  });
}

class DAOAtendenteFake implements IDAOAtendente {
  @override
  Future<DTOAtendente> salvar(DTOAtendente dto) async {
    return dto;
  }

  @override
  Future<DTOAtendente> alterar(DTOAtendente dto) async {
    // TODO: implement alterar
    return dto;
  }

  @override
  Future<bool> alterarStatus(id) async {
    // TODO: implement alterar
    return true;
  }

  @override
  Future<List<DTOAtendente>> consultar() async {
    return [
      DTOAtendente(
          id: 1,
          nome: 'Caue',
          cpf: '070.304.390-07',
          senha: 'senha123',
          estaAtivo: true,
          observacao: ''),
    ];
  }

  @override
  Future<DTOAtendente> consultarPorId(id) async {
    // TODO: implement consultarPorId
    return DTOAtendente(
        id: 1,
        nome: 'Caue',
        cpf: '070.304.390-07',
        senha: 'senha123',
        estaAtivo: true,
        observacao: '');
  }

  @override
  Future<DTOAtendente> excluir(DTOAtendente dto) async {
    // TODO: implement excluir
    return DTOAtendente(
        id: 1,
        nome: 'Caue',
        cpf: '070.304.390-07',
        senha: 'senha123',
        estaAtivo: true,
        observacao: '');
  }
}
