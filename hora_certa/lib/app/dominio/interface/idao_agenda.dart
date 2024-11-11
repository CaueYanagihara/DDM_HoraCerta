import '../dto/dto_agenda.dart';

abstract class IDAOAgenda {
  Future<DTOAgenda> salvar(DTOAgenda dto);
  Future<DTOAgenda> excluir(DTOAgenda dto);
  Future<DTOAgenda> alterar(DTOAgenda dto);
  Future<List<DTOAgenda>> consultar();
  Future<bool> alterarStatus(dynamic id);
  Future<DTOAgenda> consultarPorId(dynamic id);
}
