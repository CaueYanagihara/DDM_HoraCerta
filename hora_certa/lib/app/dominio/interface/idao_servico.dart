import 'package:hora_certa/app/dominio/dto/dto_servico.dart';

abstract class IDAOServico {
  Future<DTOServico> salvar(DTOServico dto);
  Future<DTOServico> excluir(DTOServico dto);
  Future<DTOServico> alterar(DTOServico dto);
  Future<List<DTOServico>> consultar();
  Future<bool> alterarStatus(dynamic id);
  Future<DTOServico> consultarPorId(dynamic id);
}
