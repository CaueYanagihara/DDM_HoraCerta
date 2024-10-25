import 'package:hora_certa/app/dominio/dto/dto_atendente.dart';

import 'cpf.dart';
import 'package:hora_certa/app/dominio/interface/idao_atendente.dart';

class Atendente {
  dynamic _id;
  String? _nome;
  String? _cpf;
  String? _senha;
  bool _estaAtivo = false;
  String? _observacao;

  late IDAOAtendente dao;

  Atendente({required this.dao});

  validarDTO({required DTOAtendente dto}) {
    validarNome(dto);
    CPF(dto.cpf);
    validarSenha(dto);

    this._id = dto.id;
    this._nome = dto.nome;
    this._cpf = dto.cpf;
    this._senha = dto.senha;
    this._estaAtivo = dto.estaAtivo;
    this._observacao = dto.observacao;
  }

  validarDAO(IDAOAtendente dao) {
    if (dao == null) {
      throw Exception('Dao não pode ser nulo!');
    }
  }

  void validarNome(DTOAtendente dto) {
    
    if (dto.nome.isEmpty) {
      throw Exception('Nome não pode ser vazio');
    }
  }

  void validarSenha(DTOAtendente dto) {
    if (dto.senha == null) {
      throw Exception('A senha não pode ser nula!');
    }
    if (dto.senha.length < 6) {
      throw Exception('A senha deve ter no mínimo 6 caracteres!');
    }
  }

  Future<DTOAtendente> salvar(DTOAtendente dto) async {
    validarDTO(dto: dto);
    validarDAO(dao);
    return await dao.salvar(dto);
  }

  Future<DTOAtendente> alterar(dynamic id) async {
    validarDAO(dao);
    return await dao.alterar(_id);
  }

  Future<bool> excluir(dynamic id) async {
    validarDAO(dao);
    await dao.alterarStatus(_id);
    return true;
  }

  Future<List<DTOAtendente>> consultar() async {
    validarDAO(dao);
    return await dao.consultar();
  }

  String? get nome => _nome;
  String? get cpf => _cpf;
  String? get senha => _senha;
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

  set observacao(String? observacao) {
    _observacao = observacao;
  }
}
