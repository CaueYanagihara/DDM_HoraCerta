import 'package:flutter/material.dart';
import 'package:hora_certa/app/widget/lista_servico.dart';
import 'package:hora_certa/app/widget/home_agenda.dart';
import 'package:hora_certa/app/dominio/dto/dto_servico.dart';
import 'package:hora_certa/app/aplicacao/ap_servico.dart';

class FormularioServico extends StatefulWidget {
  @override
  _FormularioServicoState createState() => _FormularioServicoState();
}

class _FormularioServicoState extends State<FormularioServico> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _tempoController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _cadastrarServico() async {
    if (_formKey.currentState!.validate()) {
      var aplicacao = APServico();

      int? preco = int.tryParse(_precoController.text) ?? 0;

      var novoServico = DTOServico(
        nome: _nomeController.text,
        preco: preco,
        tempo: _tempoController.text,
        estaAtivo: true,
      );

      var servicoSalvo = await aplicacao.salvar(novoServico);

      if (servicoSalvo != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Servico cadastrado com sucesso!')));
        _limparFormulario();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao cadastrar o servico!')));
      }
    }
  }

  void _limparFormulario() {
    _nomeController.clear();
    _precoController.clear();
    _tempoController.clear();
    _senhaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.white],
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Novo Servico",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      controller: _nomeController,
                      decoration: InputDecoration(label: Text("Nome")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o nome';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _precoController,
                      decoration: InputDecoration(label: Text("Preço")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o preço';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _tempoController,
                      decoration: InputDecoration(label: Text("Tempo de Duração")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o tempo de duração';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: _cadastrarServico,
                        child: const Text("Cadastrar")),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListaServico()),
                        );
                      },
                      child: const Text("Listar servicos"),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeAgenda()),
                          );
                        },
                        child: const Text("Voltar")),
                    SizedBox(
                      height: 25,
                    ),
                    Divider(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
