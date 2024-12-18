import 'package:flutter/material.dart';
import 'package:hora_certa/app/widget/home_agenda.dart';
import 'package:hora_certa/app/widget/lista_atendente.dart';
import 'package:hora_certa/app/dominio/dto/dto_atendente.dart';
import 'package:hora_certa/app/aplicacao/ap_atendente.dart';

class FormularioAtendente extends StatefulWidget {
  @override
  _FormularioAtendenteState createState() => _FormularioAtendenteState();
}

class _FormularioAtendenteState extends State<FormularioAtendente> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _cadastrarAtendente() async {
    if (_formKey.currentState!.validate()) {
      var aplicacao = APAtendente();

      var novoAtendente = DTOAtendente(
        nome: _nomeController.text,
        cpf: _cpfController.text,
        senha: _senhaController.text,
        estaAtivo: true,
      );

      var atendenteSalvo = await aplicacao.salvar(novoAtendente);

      if (atendenteSalvo != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Atendente cadastrado com sucesso!')));
        _limparFormulario();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao cadastrar o atendente!')));
      }
    }
  }

  void _limparFormulario() {
    _nomeController.clear();
    _cpfController.clear();
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
                      "Novo Atendente",
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
                        onPressed: _cadastrarAtendente,
                        child: const Text("Cadastrar")),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListaAtendente()),
                          );
                        },
                        child: const Text("Listar Atendentes")),
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
                    Divider(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
