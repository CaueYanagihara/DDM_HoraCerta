import 'package:flutter/material.dart';
import 'package:hora_certa/app/widget/formulario_atendente.dart';
import 'package:hora_certa/app/widget/lista_cliente.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'package:hora_certa/app/aplicacao/ap_cliente.dart';

class FormularioCliente extends StatefulWidget {
  @override
  _FormularioClienteState createState() => _FormularioClienteState();
}

class _FormularioClienteState extends State<FormularioCliente> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _cadastrarCliente() async {
    if (_formKey.currentState!.validate()) {
      var aplicacao = APCliente();

      var novoCliente = DTOCliente(
        nome: _nomeController.text,
        cpf: _cpfController.text,
        telefone: _telefoneController.text,
        senha: _senhaController.text,
        telefoneEhWhatsapp: false,
        estaAtivo: true,
      );

      var clienteSalvo = await aplicacao.salvar(novoCliente);

      if (clienteSalvo != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cliente cadastrado com sucesso!')));
        _limparFormulario();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao cadastrar o cliente!')));
      }
    }
  }

  void _limparFormulario() {
    _nomeController.clear();
    _cpfController.clear();
    _telefoneController.clear();
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
                      "App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 48,
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
                      controller: _cpfController,
                      decoration: InputDecoration(label: Text("CPF")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o CPF';
                        }
                        // Adicione validação de CPF aqui se necessário
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _telefoneController,
                      decoration: InputDecoration(label: Text("Telefone")),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o telefone';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _senhaController,
                      decoration: InputDecoration(label: Text("Senha")),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter no mínimo 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        onPressed: _cadastrarCliente,
                        child: const Text("Cadastrar")),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListaCliente()),
                          );
                        },
                        child: const Text("Listar")),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormularioAtendente()),
                          );
                        },
                        child: const Text("Cadastrar um Atendente")),
                    Divider(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
