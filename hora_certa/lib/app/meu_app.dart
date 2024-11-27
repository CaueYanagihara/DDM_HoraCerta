import 'package:flutter/material.dart';
import 'package:hora_certa/app/dominio/agenda.dart';
import 'package:hora_certa/app/rotas.dart';
import 'package:hora_certa/app/widget/detalhe_cliente.dart';
import 'package:hora_certa/app/widget/formulario_atendente.dart';
import 'package:hora_certa/app/widget/formulario_cliente.dart';
import 'package:hora_certa/app/widget/home_agenda.dart';
import 'package:hora_certa/app/widget/lista_atendente.dart';
import 'package:hora_certa/app/widget/lista_cliente.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HoraCerta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: {
        Rotas.home: (context) => HomeAgenda(),
        Rotas.cadastroCliente: (context) => FormularioCliente(),
        Rotas.clientes: (context) => ListaCliente(),
        Rotas.cadAtendente: (context) => FormularioAtendente(),
        Rotas.atendentes: (context) => ListaAtendente(),
      },
    );
  }
}
