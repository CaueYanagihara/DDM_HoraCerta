import '../dto/dto_atendente.dart';

abstract class IDAOAtendente {
  Future<DTOAtendente> salvar(DTOAtendente dto);
  Future<DTOAtendente> excluir(DTOAtendente dto);
  Future<DTOAtendente> alterar(DTOAtendente dto);
  Future<List<DTOAtendente>> consultar();
  Future<bool> alterarStatus(dynamic id);
  Future<DTOAtendente> consultarPorId(dynamic id);
}
