import 'package:flutter/material.dart';
import 'home_agenda.dart';

class DetalheAgenda extends StatelessWidget {
  final Tarefa tarefa;

  DetalheAgenda({required this.tarefa});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(tarefa.nome),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cliente: ${tarefa.cliente}'),
          Text('Data: ${tarefa.horaInicio.toLocal().toString().split(' ')[0]}'),
          Text('Início: ${tarefa.horaInicio.hour}:${tarefa.horaInicio.minute.toString().padLeft(2, '0')}'),
          Text('Fim: ${tarefa.horaFim.hour}:${tarefa.horaFim.minute.toString().padLeft(2, '0')}'),
          Text('Preço: R\$${tarefa.preco}'),
          if (tarefa.observacao != null && tarefa.observacao!.isNotEmpty)
            Text('Observação: ${tarefa.observacao}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Fechar'),
        ),
      ],
    );
  }
}
