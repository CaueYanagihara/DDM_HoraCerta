import 'package:flutter/material.dart';
import 'package:hora_certa/app/aplicacao/ap_cliente.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'detalhe_cliente.dart';

class ListaCliente extends StatefulWidget {
  @override
  _ListaClienteState createState() => _ListaClienteState();
}

class _ListaClienteState extends State<ListaCliente> {
  late APCliente _aplicacao;

  @override
  void initState() {
    super.initState();
    _aplicacao = APCliente();
  }

  Future<List<DTOCliente>> consultar() async {
    return await _aplicacao.consultar();
  }

  void _excluirCliente(DTOCliente cliente) async {
    await _aplicacao.excluir(cliente.id);
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cliente excluído com sucesso!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Clientes'),
      ),
      body: FutureBuilder<List<DTOCliente>>(
        future: consultar(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar dados'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum cliente encontrado'));
          } else {
            var dados = snapshot.data!;
            return ListView.builder(
              itemCount: dados.length,
              itemBuilder: (context, index) {
                var cliente = dados[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.blue),
                    title: Text(cliente.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CPF: ${cliente.cpf}', style: TextStyle(color: Colors.grey)),
                        Text('Telefone: ${cliente.telefone}', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            bool? result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalheCliente(cliente: cliente),
                              ),
                            );
                            if (result == true) {
                              setState(() {});
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _excluirCliente(cliente),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
