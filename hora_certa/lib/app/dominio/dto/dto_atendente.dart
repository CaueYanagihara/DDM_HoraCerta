class DTOAtendente {
  dynamic id;
  late String nome;
  late String cpf;
  late String senha;
  late bool estaAtivo;
  String? observacao;

  DTOAtendente(
      {this.id,
      required this.nome,
      required this.cpf,
      required this.senha,
      required this.estaAtivo,
      this.observacao});
}
