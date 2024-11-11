import 'package:hora_certa/app/dominio/common/exceptions/validation_exception.dart';
import 'package:hora_certa/app/dominio/dto/dto_agenda.dart';
import 'package:hora_certa/app/dominio/interface/idao_agenda.dart';

class Agenda {
  dynamic _id;
  dynamic _clienteId;
  dynamic _servicoId;
  dynamic _atendenteId;
  DateTime? _dataHoraInicio;
  DateTime? _dataHoraFim;
  int? _preco;
  String _status = 'P';
  String? _observacao;

  late DTOAgenda dto;
  late IDAOAgenda dao;

  Agenda({required this.dao});

  validarDTO({required DTOAgenda dto}) {
    validarDataHora(dto.dataHoraInicio, dto.dataHoraFim);

    this._id = dto.id;
    this._clienteId = dto.clienteId;
    this._servicoId = dto.servicoId;
    this._atendenteId = dto.atendenteId;
    this._dataHoraInicio = dto.dataHoraInicio;
    this._dataHoraFim = dto.dataHoraFim;
    this._preco = dto.preco;
    this._status = dto.status;
    this._observacao = dto.observacao;
  }

  validarDAO(IDAOAgenda? dao) {
    if (dao == null) {
      throw Exception('Dao não pode ser nulo!');
    }
  }

  void validarDataHora(DateTime dataHoraInicio, DateTime dataHoraFim) {
    if (dataHoraFim.isBefore(dataHoraInicio)){
      throw Exception('Data e hora de fim não pode ser anterior a de início!');
    }

    if (DateTime.now().isBefore(dataHoraFim)) {
      throw ValidationException('Data e hora não são futuras!');
      //QUANDO MONTAR A TELA, GERAR UM ALERT COM ESSE EXCEPTION
    }
  }

  Future<DTOAgenda> salvar(DTOAgenda dto) async {
    validarDTO(dto: dto);
    validarDAO(dao);
    return await dao.salvar(dto);
  }

  Future<DTOAgenda> alterar(DTOAgenda dto) async {
    validarDAO(dao);
    return await dao.alterar(dto);
  }

  Future<bool> excluir(dynamic id) async {
    validarDAO(dao);
    await dao.alterarStatus(id);
    return true;
  }

  Future<List<DTOAgenda>> consultar() async {
    validarDAO(dao);
    return await dao.consultar();
  }

  dynamic get id => _id;
  dynamic get clienteId => _clienteId;
  dynamic get servicoId => _servicoId;
  dynamic get atendenteId => _atendenteId;
  DateTime? get dataHoraInicio => _dataHoraInicio;
  DateTime? get dataHoraFim => _dataHoraFim;
  int? get preco => _preco;
  String get status => _status;
  String? get observacao => _observacao;

  set id(dynamic id) {
    if (id == null) throw Exception('Erro: ID não pode ser nulo');
    if (id < 0) throw Exception('Erro: ID não pode ser negativo');
    _id = id;
  }

  set dataHoraInicio(DateTime? dataHoraInicio) {
    if (dataHoraInicio == null) throw Exception('Erro: Data e hora de inicio não pode ser nula.');
    _dataHoraInicio = dataHoraInicio;
  }

  set dataHoraFim(DateTime? dataHoraFim) {
    if (dataHoraFim == null) throw Exception('Erro: Data e hora de fim não pode ser nula.');
    _dataHoraFim = dataHoraFim;
  }

  set status(String? status) {
    if (status == null) throw Exception('Erro: Status não pode ser nulo.');
    if (status.isEmpty) throw Exception('Erro: Status não pode ser vazio.');
    _status = status;
  }

  set observacao(String? observacao) {
    _observacao = observacao;
  }
}
