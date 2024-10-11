import 'package:flutter/material.dart';
import 'package:hora_certa/app/aplicacao/ap_cliente.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';

class ListaCliente extends StatelessWidget {
  Future<List<DTOCliente>> consultar() async {
    return [
      DTOCliente(
        nome: 'Caue',
        cpf: '111.111.111-11',
        telefone: '(11) 1111-1111',
        senha: 'Teste123',
        telefoneEhWhatsapp: true,
        estaAtivo: true,
      ),
      DTOCliente(
        nome: 'Joao',
        cpf: '222.222.222-22',
        telefone: '(22) 2222-2222',
        senha: 'Teste321',
        telefoneEhWhatsapp: true,
        estaAtivo: true,
      ),
      DTOCliente(
        nome: 'Carlos Santos',
        cpf: '333.333.333-33',
        telefone: '(33) 3333-3333',
        senha: 'Teste213',
        telefoneEhWhatsapp: true,
        estaAtivo: true,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var aplicacao = APCliente();

    return Scaffold(
      appBar: AppBar(
        title: Text('lista Cliente'),
      ),
      body: FutureBuilder(
          future: aplicacao.consultar(),
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
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(cliente.nome),
                      subtitle: Text(cliente.cpf),
                    );
                  });
            }
          }),
    );
  }
}
