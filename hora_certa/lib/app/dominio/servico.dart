import 'package:hora_certa/app/dominio/dto/dto_servico.dart';
import 'package:hora_certa/app/dominio/interface/idao_servico.dart';

class Servico {
  dynamic _id;
  String? _nome;
  int? _preco;
  String? _tempo;
  bool _estaAtivo = false;
  String? _observacao;

  late DTOServico dto;
  late IDAOServico dao;

  Servico({required this.dao});

  validarDTO({required DTOServico dto}) {
    validarNome(dto);

    this._id = dto.id;
    this._nome = dto.nome;
    this._preco = dto.preco;
    this._tempo = dto.tempo;
    this._estaAtivo = dto.estaAtivo;
    this._observacao = dto.observacao;
  }

  validarDAO(IDAOServico dao) {
    if (dao == null) {
      throw Exception('Dao não pode ser nulo!');
    }
  }

  void validarNome(DTOServico dto) {
    if (dto.nome.isEmpty) {
      throw Exception('Nome não pode ser vazio');
    }
  }

  Future<DTOServico> salvar(DTOServico dto) async {
    validarDTO(dto: dto);
    validarDAO(dao);
    return await dao.salvar(dto);
  }

  Future<DTOServico> alterar(DTOServico dto) async {
    validarDAO(dao);
    return await dao.alterar(dto);
  }

  Future<bool> excluir(dynamic id) async {
    validarDAO(dao);
    await dao.alterarStatus(id);
    return true;
  }

  Future<List<DTOServico>> consultar() async {
    validarDAO(dao);
    return await dao.consultar();
  }

  String? get nome => _nome;
  int? get preco => _preco;
  String? get tempo => _tempo;
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

  set preco(int? preco) {
    if (preco == null) throw Exception('Erro: Preço não pode ser nulo.');
    if (preco < 0) throw Exception('Erro: Preço não pode ser negativo.');
    _preco = preco;
  }

  set tempo(String? tempo) {
    if (tempo == null) throw Exception('Erro: Tempo não pode ser nula.');
    if (tempo.isEmpty) throw Exception('Erro: Tempo não pode ser vazia.');
    _tempo = tempo;
  }

  set observacao(String? observacao) {
    _observacao = observacao;
  }
}
