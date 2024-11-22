import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeAgenda extends StatelessWidget {
  final List<Atendente> atendentes = [
    Atendente(
      nome: 'Atendente 1',
      tarefas: [
        Tarefa('Consulta 1', DateTime(2024, 11, 21, 9, 0),
            DateTime(2024, 11, 21, 11, 0)),
        Tarefa('Consulta 2', DateTime(2024, 11, 21, 14, 0),
            DateTime(2024, 11, 21, 16, 0)),
      ],
      cor: Colors.blueAccent,
      fundoCor: Colors.blue.shade50,
    ),
    Atendente(
      nome: 'Atendente 2',
      tarefas: [
        Tarefa('Consulta 3', DateTime(2024, 11, 21, 10, 0),
            DateTime(2024, 11, 21, 12, 0)),
        Tarefa('Consulta 4', DateTime(2024, 11, 21, 13, 0),
            DateTime(2024, 11, 21, 15, 0)),
      ],
      cor: Colors.greenAccent,
      fundoCor: Colors.green.shade50,
    ),
    Atendente(
      nome: 'Atendente 3',
      tarefas: [
        Tarefa('Consulta 5', DateTime(2024, 11, 21, 11, 0),
            DateTime(2024, 11, 21, 13, 0)),
        Tarefa('Consulta 6', DateTime(2024, 11, 21, 15, 0),
            DateTime(2024, 11, 21, 17, 0)),
      ],
      cor: Colors.orangeAccent,
      fundoCor: Colors.orange.shade50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kanban de Atendimentos"),
        backgroundColor: Colors.indigo,
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
                                  'Início: ${tarefa.horaInicio.hour}:${tarefa.horaInicio.minute.toString().padLeft(2, '0')}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Fim: ${tarefa.horaFim.hour}:${tarefa.horaFim.minute.toString().padLeft(2, '0')}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
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
  final DateTime horaInicio;
  final DateTime horaFim;

  Tarefa(this.nome, this.horaInicio, this.horaFim);
}
