import 'common/exceptions/validation_exception.dart';

class Agenda {
  late dynamic id;
  late String clienteId;
  late String servicoId;
  late DateTime dataHoraInicio;
  late DateTime dataHoraFim;
  late String atendenteId;
  late String status;

  Agenda({
    required this.id,
    required this.clienteId,
    required this.servicoId,
    required this.dataHoraInicio,
    required this.dataHoraFim,
    required this.atendenteId,
    this.status = 'Pendente',
  }) {
    validarDataHora(dataHoraInicio, dataHoraFim);
  }

  void validarDataHora(DateTime dataHoraInicio, DateTime dataHoraFim) {
    if (dataHoraFim.isBefore(dataHoraInicio)){
      throw Exception('Data e hora de fim não pode ser anterior a de início!');
    }

    if (DateTime.now().isBefore(dataHoraFim)) {
      throw ValidationException('Data e hora não são futuras!');
      //QUANDO MONTAR A TELA, GERAR UM ALERT COM ESSE EXCEPTION
    }
  }
}
