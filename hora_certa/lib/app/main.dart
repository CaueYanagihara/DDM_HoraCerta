import 'package:flutter/material.dart';
import 'package:hora_certa/app/paginas/pagina_inicio.dart';
import 'package:hora_certa/app/paginas/pagina_registro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(_) => PaginaRegistro(),
        '/Inicio':(_) => PaginaInicio(),
      },
    );
  }
}
