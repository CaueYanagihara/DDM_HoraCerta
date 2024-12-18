import 'package:hora_certa/app/dominio/atendente.dart';
import 'package:hora_certa/app/dominio/dto/dto_atendente.dart';
import 'package:hora_certa/app/dominio/interface/idao_atendente.dart';
import 'package:hora_certa/app/banco/sqlite/dao/dao_atendente.dart';

class APAtendente {
  late DTOAtendente dto;
  late IDAOAtendente dao;
  late Atendente atendente;

  APAtendente() {
    dao = DAOAtendente();
    atendente = Atendente(dao: dao);
  }

  void validarAtendente() {
    atendente = Atendente(dao: dao);
  }

  Future<DTOAtendente> salvar(DTOAtendente dto) async {
    validarAtendente();
    await atendente.salvar(dto);

    var atendentes = await atendente.consultar(); 
    var atendenteSalvo = atendentes.firstWhere(
      (a) => a.cpf == atendente.cpf, 
      orElse: () {
        throw Exception('Erro: Atendente não encontrado no banco de dados.');
      }
    );
    
    return atendenteSalvo;
  }

  Future<DTOAtendente> alterar(dynamic id) async {
    validarAtendente();
    return await atendente.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await atendente.excluir(id);
    return true;
  }

  Future<List<DTOAtendente>> consultar() async {
    return await atendente.consultar();
  }

  Future<DTOAtendente> alterarStatus(dynamic id) async {
    validarAtendente();
    return await atendente.alterar(id);
  }
}
