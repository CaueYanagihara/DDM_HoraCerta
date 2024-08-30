class Agenda {
  late String id;
  late String clienteId;
  late String servicoId;
  late DateTime dataHora;
  late String atendenteId;
  late String status;

  Agenda({
    required this.id,
    required this.clienteId,
    required this.servicoId,
    required this.dataHora,
    required this.atendenteId,
    this.status = 'Pendente',
  }) {
    validarDataHora();
  }

  void validarDataHora() {
    if (dataHora.isBefore(DateTime.now())) {
      throw Exception('A data e hora do agendamento devem ser futuras!');
    }
  }
}
