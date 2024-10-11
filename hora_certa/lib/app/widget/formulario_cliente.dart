import 'package:flutter/material.dart';
import 'package:hora_certa/app/widget/lista_cliente.dart';

class FormularioCliente extends StatelessWidget {
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
                      decoration: InputDecoration(label: Text("Nome")),
                    ),
                    TextFormField(
                      decoration: InputDecoration(label: Text("Cpf")),
                    ),
                    TextFormField(
                      decoration: InputDecoration(label: Text("Telefone")),
                    ),
                    TextFormField(
                      decoration: InputDecoration(label: Text("Senha")),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {}, child: const Text("Cadastrar")),
                    SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListaCliente()),
                        );
                      },
                      child: const Text("Listar")
                    ),
                    Divider(),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: const Text("Ainda não tem uma conta? Cadastre-se")
                    // )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
