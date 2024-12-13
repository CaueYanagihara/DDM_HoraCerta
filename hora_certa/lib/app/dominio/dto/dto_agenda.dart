class DTOAgenda {
  dynamic id;
  String clienteId;
  String servicoId;
  String atendenteId;
  String atendenteNome;
  String clienteNome;
  String servicoNome;
  DateTime dataHoraInicio;
  DateTime dataHoraFim;
  int preco;
  String status;
  String? observacao;

  DTOAgenda({
    this.id,
    required this.clienteId,
    required this.servicoId,
    required this.atendenteId,
    required this.atendenteNome,
    required this.clienteNome,
    required this.servicoNome,
    required this.dataHoraInicio,
    required this.dataHoraFim,
    required this.preco,
    required this.status,
    this.observacao,
  });
}
