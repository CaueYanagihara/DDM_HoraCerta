import 'package:flutter/material.dart';
import 'package:hora_certa/app/aplicacao/ap_cliente.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'detalhe_cliente.dart';

class ListaCliente extends StatelessWidget {
  Future<List<DTOCliente>> consultar() async {
    var aplicacao = APCliente();
    
    return await aplicacao.consultar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lista Cliente'),
      ),
      body: FutureBuilder(
        future: consultar(),
        builder:
            (BuildContext context, AsyncSnapshot<List<DTOCliente>> consulta) {
          var dados = consulta.data;
          if (dados == null) {
            return Text('dados não encontrados');
          } else {
            List<DTOCliente> lista = dados;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                var cliente = lista[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(cliente.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CPF: ${cliente.cpf}'),
                        Text('Telefone: ${cliente.telefone}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalheCliente(cliente: cliente),
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
