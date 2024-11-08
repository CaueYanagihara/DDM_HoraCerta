import 'package:flutter/material.dart';
import 'package:hora_certa/app/dominio/servico.dart';
import 'package:hora_certa/app/dominio/dto/dto_servico.dart';
import 'package:hora_certa/app/dominio/interface/idao_servico.dart';
import 'package:hora_certa/app/banco/sqlite/dao/dao_servico.dart';

class APServico {
  late DTOServico dto;
  late IDAOServico dao;
  late Servico servico;

  APServico() {
    dao = DAOServico();
    servico = Servico(dao: dao);
  }

  void validarServico() {
    servico = Servico(dao: dao);
  }

  Future<DTOServico> salvar(DTOServico dto) async {
    validarServico();

    await servico.salvar(dto);

    return dto; 
  }

  Future<DTOServico> alterar(dynamic id) async {
    validarServico();
    return await servico.alterar(id);
  }

  Future<bool> excluir(dynamic id) async {
    await servico.excluir(id);
    return true;
  }

  Future<List<DTOServico>> consultar() async {
    return await servico.consultar();
  }

  Future<DTOServico> alterarStatus(dynamic id) async {
    validarServico();
    return await servico.alterar(id);
  }
}
