class DTOServico {
  dynamic id;
  late String nome;
  late int preco;
  late String tempo;
  late bool estaAtivo;
  String? observacao;

  DTOServico(
    {this.id, 
    required this.nome,
    required this.preco,
    required this.tempo, 
    required this.estaAtivo, 
    this.observacao});
}
