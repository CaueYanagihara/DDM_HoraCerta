import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'formulario_cliente.dart';
import 'formulario_atendente.dart';
import 'formulario_servico.dart';
import 'lista_cliente.dart';
import 'lista_atendente.dart';
import 'lista_servico.dart';
import 'formulario_agenda.dart';
import 'detalhe_agenda.dart';

class HomeAgenda extends StatefulWidget {
  @override
  _HomeAgendaState createState() => _HomeAgendaState();
}

class _HomeAgendaState extends State<HomeAgenda> {
  List<Atendente> atendentes = [
    Atendente(
      nome: 'Atendente 1',
      tarefas: [
        Tarefa('Consulta 1', 'Cliente 1', DateTime(2024, 11, 21, 9, 0),
            DateTime(2024, 11, 21, 11, 0), 100, 'Observação 1'),
        Tarefa('Consulta 2', 'Cliente 2', DateTime(2024, 11, 21, 14, 0),
            DateTime(2024, 11, 21, 16, 0), 200, 'Observação 2'),
      ],
      cor: Colors.blueAccent,
      fundoCor: Colors.blue.shade50,
    ),
    Atendente(
      nome: 'Atendente 2',
      tarefas: [
        Tarefa('Consulta 3', 'Cliente 3', DateTime(2024, 11, 21, 10, 0),
            DateTime(2024, 11, 21, 12, 0), 150, 'Observação 3'),
        Tarefa('Consulta 4', 'Cliente 4', DateTime(2024, 11, 21, 13, 0),
            DateTime(2024, 11, 21, 15, 0), 250, 'Observação 4'),
      ],
      cor: Colors.greenAccent,
      fundoCor: Colors.green.shade50,
    ),
    Atendente(
      nome: 'Atendente 3',
      tarefas: [
        Tarefa('Consulta 5', 'Cliente 5', DateTime(2024, 11, 21, 11, 0),
            DateTime(2024, 11, 21, 13, 0), 300, 'Observação 5'),
        Tarefa('Consulta 6', 'Cliente 6', DateTime(2024, 11, 21, 15, 0),
            DateTime(2024, 11, 21, 17, 0), 350, 'Observação 6'),
      ],
      cor: Colors.orangeAccent,
      fundoCor: Colors.orange.shade50,
    ),
  ];

  void _adicionarAgenda(Tarefa tarefa, String atendenteNome) {
    setState(() {
      final atendente = atendentes.firstWhere((atendente) => atendente.nome == atendenteNome);
      atendente.tarefas.add(tarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kanban de Atendimentos"),
        backgroundColor: Colors.indigo,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case 'Cadastrar Cliente':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormularioCliente()),
                  );
                  break;
                case 'Cadastrar Atendente':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormularioAtendente()),
                  );
                  break;
                case 'Cadastrar Serviço':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormularioServico()),
                  );
                  break;
                case 'Listar Clientes':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaCliente()),
                  );
                  break;
                case 'Listar Atendentes':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaAtendente()),
                  );
                  break;
                case 'Listar Serviços':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaServico()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Cadastrar Cliente',
                child: Text('Cadastrar Cliente'),
              ),
              const PopupMenuItem<String>(
                value: 'Cadastrar Atendente',
                child: Text('Cadastrar Atendente'),
              ),
              const PopupMenuItem<String>(
                value: 'Cadastrar Serviço',
                child: Text('Cadastrar Serviço'),
              ),
              const PopupMenuItem<String>(
                value: 'Listar Clientes',
                child: Text('Listar Clientes'),
              ),
              const PopupMenuItem<String>(
                value: 'Listar Atendentes',
                child: Text('Listar Atendentes'),
              ),
              const PopupMenuItem<String>(
                value: 'Listar Serviços',
                child: Text('Listar Serviços'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: atendentes.map((atendente) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: atendente.fundoCor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: atendente.cor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        atendente.nome,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ...atendente.tarefas.map((tarefa) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DetalheAgenda(tarefa: tarefa);
                              },
                            );
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: Colors.white,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tarefa.nome,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    'Cliente: ${tarefa.cliente}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    'Início: ${tarefa.horaInicio.hour}:${tarefa.horaInicio.minute.toString().padLeft(2, '0')}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'Fim: ${tarefa.horaFim.hour}:${tarefa.horaFim.minute.toString().padLeft(2, '0')}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    'Preço: R\$${tarefa.preco}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormularioAgenda()),
          );
          if (result != null && result is Map<String, dynamic>) {
            _adicionarAgenda(result['tarefa'], result['atendenteNome']);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}

class Atendente {
  final String nome;
  final List<Tarefa> tarefas;
  final Color cor;
  final Color fundoCor;

  Atendente(
      {required this.nome,
      required this.tarefas,
      required this.cor,
      required this.fundoCor});
}

class Tarefa {
  final String nome;
  final String cliente;
  final DateTime horaInicio;
  final DateTime horaFim;
  final int preco;
  final String? observacao;

  Tarefa(this.nome, this.cliente, this.horaInicio, this.horaFim, this.preco, [this.observacao]);
}
