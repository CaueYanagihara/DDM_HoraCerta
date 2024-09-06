import 'cpf.dart';

class Cliente {
  late dynamic id;
  late String nome;
  late String cpf;
  late String telefone;
  late String senha;
  late bool telefoneEhWhatsapp;
  late bool estaAtivo;
  late String? observacao;

  Cliente({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.senha,
    this.telefoneEhWhatsapp = false,
    this.estaAtivo = true,
  }) {
    CPF(cpf);
    validarTelefone();
    validarSenha();
  }

  void validarTelefone() {
    if (telefone.isEmpty) {
      throw Exception('Telefone não pode ser vazio!');
    }
  }

  void validarSenha() {
    if (senha.length < 6) {
      throw Exception('A senha deve ter no mínimo 6 caracteres!');
    }
  }
}
