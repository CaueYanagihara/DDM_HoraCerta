import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';

import 'cpf.dart';
import 'package:hora_certa/app/dominio/interface/idao_cliente.dart';

class Cliente {
  dynamic _id;
  String? _nome;
  String? _cpf;
  String? _telefone;
  String? _senha;
  bool _telefoneEhWhatsapp = false;
  bool _estaAtivo = false;
  String? _observacao;

  late IDAOCliente? dao;

  Cliente({required DTOCliente dto, required this.dao}) {
    validar(dto: dto);
    this._id = dto.id;
    this._nome = dto.nome;
    this._cpf = dto.cpf;
    this._telefone = dto.telefone;
    this._senha = dto.senha;
    this._telefoneEhWhatsapp = dto.telefoneEhWhatsapp;
    this._estaAtivo = dto.estaAtivo;
    this._observacao = dto.observacao;
  }

  validar({required DTOCliente dto}) {
    CPF(_cpf!);
    validarTelefone();
    validarSenha();
  }

  void validarTelefone() {
    if (_telefone == null) {
      throw Exception('O Telefone não pode ser nula!');
    }
    if (_telefone!.isEmpty) {
      throw Exception('O Telefone não pode ser vazio!');
    }
  }

  void validarSenha() {
    if (_senha == null) {
      throw Exception('A senha não pode ser nula!');
    }
    if (_senha!.length < 6) {
      throw Exception('A senha deve ter no mínimo 6 caracteres!');
    }
  }

  Future<DTOCliente> salvar(DTOCliente dto) async {
    validar(dto: dto);
    return await dao!.salvar(dto);
  }

  Future<DTOCliente> alterar(dynamic id) async {
    this.id = id;
    return await dao!.alterar(_id);
  }

  Future<bool> excluir(dynamic id) async {
    this.id = id;
    await dao!.alterarStatus(_id);
    return true;
  }

  Future<List<DTOCliente>> consultar() async {
    return await dao!.consultar();
  }

  String? get nome => _nome;
  String? get cpf => _cpf;
  String? get telefone => _telefone;
  String? get senha => _senha;
  bool get telefoneEhWhatsapp => _telefoneEhWhatsapp;
  bool get estaAtivo => _estaAtivo;
  String? get observacao => _observacao;

  set id(int? id) {
    if (id == null) throw Exception('Erro: ID não pode ser nulo');
    if (id < 0) throw Exception('Erro: ID não pode ser negativo');
    _id = id;
  }

  set nome(String? nome) {
    if (nome == null) throw Exception('Erro: Nome não pode ser nulo.');
    if (nome.isEmpty) throw Exception('Erro: Nome não pode ser vazio.');
    _nome = nome;
  }

  set cpf(String? cpf) {
    if (cpf == null) throw Exception('Erro: CPF não pode ser nulo.');
    if (cpf.isEmpty) throw Exception('Erro: CPF não pode ser vazio.');
    _cpf = cpf;
  }

  set senha(String? senha) {
    if (senha == null) throw Exception('Erro: Senha não pode ser nula.');
    if (senha.isEmpty) throw Exception('Erro: Senha não pode ser vazia.');
    _senha = senha;
  }

  set telefone(String? telefone) {
    _telefone = telefone;
  }

  set telefoneEhWhatsapp(bool? telefoneEhWhatsapp) {
    if (telefoneEhWhatsapp == null)
      throw Exception('Status não pode ser nulo.');
    if (telefoneEhWhatsapp != true || telefoneEhWhatsapp != false)
      throw Exception('Erro: "Telefone é WhatsApp?" não pode ser nulo.');
    _telefoneEhWhatsapp = telefoneEhWhatsapp;
  }

  set observacao(String? observacao) {
    _observacao = observacao;
  }
}
