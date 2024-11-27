import 'package:flutter/material.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';

class DetalheCliente extends StatelessWidget {
  final DTOCliente cliente;

  DetalheCliente({required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe do Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${cliente.nome}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('CPF: ${cliente.cpf}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Telefone: ${cliente.telefone}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Senha: ${cliente.senha}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Telefone é WhatsApp: ${cliente.telefoneEhWhatsapp ? "Sim" : "Não"}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Está Ativo: ${cliente.estaAtivo ? "Sim" : "Não"}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            if (cliente.observacao != null && cliente.observacao!.isNotEmpty)
              Text('Observação: ${cliente.observacao}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
