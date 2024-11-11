class DTOAgenda {
  late dynamic id;
  late dynamic clienteId;
  late dynamic servicoId;
  late dynamic atendenteId;
  late DateTime dataHoraInicio;
  late DateTime dataHoraFim;
  late int preco;
  late String status;
  String? observacao;

  DTOAgenda(
      {this.id,
      required this.clienteId,
      required this.servicoId,
      required this.atendenteId,
      required this.dataHoraInicio,
      required this.dataHoraFim,
      required this.preco,
      required this.status,
      this.observacao});
}
