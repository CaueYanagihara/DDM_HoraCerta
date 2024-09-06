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

  void validarDataHora(DateTime dataHoraInicio, DateTime datadataHoraFim) {
    if (dataHoraInicio.isBefore(datadataHoraFim)){
      throw Exception('Data e hora de início não pode ser posterior a de fim!');
    }

    if (datadataHoraFim.isBefore(DateTime.now())) {
      throw ValidationException('Data e hora não são futuras!');
      //QUANDO MONTAR A TELA, GERAR UM ALERT COM ESSE EXCEPTION
    }
  }
}
