import 'package:hora_certa/app/dominio/dto/dto_atendente.dart';
import 'package:hora_certa/app/dominio/interface/idao_atendente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hora_certa/app/banco/conexao.dart';

class DAOAtendente implements IDAOAtendente {
  late Database _db;
  final sqlInserir = '''
    INSERT INTO atendente (nome, cpf, telefone, senha, telefoneEhWhatsapp, estaAtivo)
    VALUES (?,?,?,?,?,?)
  ''';
  final sqlAlterar = '''
    UPDATE atendente SET nome=?, cpf=?, telefone=?, senha=?, telefoneEhWhatsapp=?, estaAtivo=?
    WHERE id = ?
  ''';
  final sqlAlterarStatus = '''
    UPDATE atendente SET estaAtivo='N'
    WHERE id = ?
  ''';
  final sqlConsultarPorId = '''
    SELECT * FROM atendente WHERE id = ?;
  ''';
  final sqlConsultar = '''
    SELECT * FROM atendente;
  ''';

  @override
  Future<DTOAtendente> salvar(DTOAtendente dto) async {
    _db = await Conexao.abrir();
    int id = await _db.rawInsert(
        sqlInserir,
        [
          dto.nome,
          dto.cpf,
          dto.senha,
          dto.estaAtivo,
          dto.observacao
        ]);
    dto.id = id;
    return dto;
  }
  
  @override
  Future<DTOAtendente> alterar(DTOAtendente dto) async {
    _db = await Conexao.abrir();
    await _db.rawUpdate(sqlAlterar,
        [
      dto.nome,
      dto.cpf,
      dto.senha,
      dto.estaAtivo,
      dto.observacao,
      dto.id
      ]);
    return dto;
  }
  
  @override
  Future<bool> alterarStatus(dynamic id) async {
    _db = await Conexao.abrir();
    await _db.rawUpdate(sqlAlterarStatus, [id]);
    return true;
  }

  @override
  Future<List<DTOAtendente>> consultar() async {
    _db = await Conexao.abrir();
    var resultado = await _db.rawQuery(sqlConsultar);
    List<DTOAtendente> atendentes = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return DTOAtendente(
        id: linha['id'],
        nome: linha['nome'].toString(),
        cpf: linha['cpf'].toString(),
        senha: linha['senha'].toString(),
        estaAtivo: linha['estaAtivo'] == 1,
        observacao: linha['observacao'].toString()
      );
    });
    return atendentes;
  }
  
  @override
  Future<DTOAtendente> consultarPorId(dynamic id) async {
    _db = await Conexao.abrir();
    var resultado = (await _db.rawQuery(sqlConsultarPorId, [id])).first;
    DTOAtendente atendente = DTOAtendente(
      id: resultado['id'],
      nome: resultado['nome'].toString(),
      cpf: resultado['cpf'].toString(),
      senha: resultado['senha'].toString(),
      estaAtivo: resultado['estaAtivo'] == 1,
        observacao: resultado['observacao'].toString()
    );
    return atendente;
  }
  
  @override
  Future<DTOAtendente> excluir(DTOAtendente dto) async {
    _db = await Conexao.abrir();
    await _db.rawDelete(
        'DELETE * FROM atendente WHERE id = (?),',
        [dto.id]);
    return dto; //VERIFICAR SE ISSO NAO VAI DAR ERRO
  }
}
