import '../dto/dto_agenda.dart';

abstract class IDAOAgenda {
  DTOAgenda salvar(DTOAgenda dto);
  DTOAgenda excluir(DTOAgenda dto);
  DTOAgenda alterar(DTOAgenda dto);
  DTOAgenda consultar(DTOAgenda dto);
}
