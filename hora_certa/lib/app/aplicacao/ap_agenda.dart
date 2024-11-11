import 'package:hora_certa/app/dominio/agenda.dart';
import 'package:hora_certa/app/dominio/dto/dto_agenda.dart';
import 'package:hora_certa/app/dominio/interface/idao_agenda.dart';
import 'package:hora_certa/app/banco/sqlite/dao/dao_agenda.dart';

class APAgenda {
  late DTOAgenda dto;
  late IDAOAgenda dao;
  late Agenda agenda;

  APAgenda() {
    dao = DAOAgenda();
    agenda = Agenda(dao: dao);
  }

  void validarAgenda() {
    agenda = Agenda(dao: dao);
  }

  Future<DTOAgenda> salvar(DTOAgenda dto) async {
    validarAgenda();
    await agenda.salvar(dto);

    var agendas = await agenda.consultar(); 
    var agendaSalva = agendas.firstWhere(
      (a) => a.id == agenda.id, 
      orElse: () {
        throw Exception('Erro: Agenda não encontrado no banco de dados.');
      }
    );
    
    return agendaSalva;
  }

  Future<DTOAgenda> alterar(dynamic id) async {
    validarAgenda();
    return await agenda.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await agenda.excluir(id);
    return true;
  }

  Future<List<DTOAgenda>> consultar() async {
    return await agenda.consultar();
  }

  Future<DTOAgenda> alterarStatus(dynamic id) async {
    validarAgenda();
    return await agenda.alterar(id);
  }
}
