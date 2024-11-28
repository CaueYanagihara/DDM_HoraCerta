import 'package:flutter/material.dart';
import 'package:hora_certa/app/aplicacao/ap_servico.dart';
import 'package:hora_certa/app/dominio/dto/dto_servico.dart';
import 'detalhe_servico.dart';

class ListaServico extends StatelessWidget {
  Future<List<DTOServico>> consultar() async {
    var aplicacao = APServico();
    
    return await aplicacao.consultar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lista Servico'),
      ),
      body: FutureBuilder(
        future: consultar(),
        builder:
            (BuildContext context, AsyncSnapshot<List<DTOServico>> consulta) {
          var dados = consulta.data;
          if (dados == null) {
            return Text('dados não encontrados');
          } else {
            List<DTOServico> lista = dados;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                var servico = lista[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(servico.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Preço: ${servico.preco}'),
                        Text('Tempo: ${servico.tempo}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalheServico(servico: servico),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            );
          }
        }
      ),
    );
  }
}
