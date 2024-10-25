import 'package:flutter/material.dart';
import 'package:hora_certa/app/aplicacao/ap_atendente.dart';
import 'package:hora_certa/app/dominio/dto/dto_atendente.dart';

class ListaAtendente extends StatelessWidget {
  Future<List<DTOAtendente>> consultar() async {
    var aplicacao = APAtendente();
    
    return await aplicacao.consultar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lista Atendente'),
      ),
      body: FutureBuilder(
        future: consultar(),
        builder:
            (BuildContext context, AsyncSnapshot<List<DTOAtendente>> consulta) {
          var dados = consulta.data;
          if (dados == null) {
            return Text('dados não encontrados');
          } else {
            List<DTOAtendente> lista = dados;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                var atendente = lista[index];
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(atendente.nome),
                  subtitle: Text(atendente.cpf),
                );
              }
            );
          }
        }
      ),
    );
  }
}
