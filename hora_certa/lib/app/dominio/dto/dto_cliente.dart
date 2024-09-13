class DTOCliente {
  late dynamic id;
  late String nome;
  late String cpf;
  late String telefone;
  late String senha;
  late bool telefoneEhWhatsapp;
  late bool estaAtivo;
  late String? observacao;

  DTOCliente(
      {this.id,
      required this.nome,
      required this.cpf,
      required this.telefone,
      required this.senha,
      required this.telefoneEhWhatsapp,
      required this.estaAtivo,
      this.observacao});
}
