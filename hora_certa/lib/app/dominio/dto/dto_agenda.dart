class DTOAgenda {
  late dynamic id;
  late dynamic clienteId;
  late dynamic servicoId;
  late dynamic atendenteId;
  late DateTime dataHoraInicio;
  late DateTime dataHoraFim;
  late String status;

  DTOAgenda(
      {this.id,
      required this.clienteId,
      required this.servicoId,
      required this.atendenteId,
      required this.dataHoraInicio,
      required this.dataHoraFim,
      required this.status});
}
