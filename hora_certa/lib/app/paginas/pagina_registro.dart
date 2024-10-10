import 'package:flutter/material.dart';

class PaginaRegistro extends StatefulWidget {
  const PaginaRegistro({super.key});

  @override
  State<PaginaRegistro> createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
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
                colors: [
                  Colors.blueAccent,
                  Colors.blueGrey
                ],
              )
            ),
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
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}