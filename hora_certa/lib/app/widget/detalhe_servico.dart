import 'package:flutter/material.dart';
import 'package:hora_certa/app/dominio/dto/dto_servico.dart';

class DetalheServico extends StatelessWidget {
  final DTOServico servico;

  DetalheServico({required this.servico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe do Serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${servico.nome}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Preço: R\$ ${servico.preco}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Tempo: ${servico.tempo}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            if (servico.observacao != null && servico.observacao!.isNotEmpty)
              Text('Observação: ${servico.observacao}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
