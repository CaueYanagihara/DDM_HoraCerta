import 'package:flutter/material.dart';
import 'package:hora_certa/app/dominio/dto/dto_cliente.dart';
import 'package:hora_certa/app/aplicacao/ap_cliente.dart';

class DetalheCliente extends StatefulWidget {
  final DTOCliente cliente;

  DetalheCliente({required this.cliente});

  @override
  _DetalheClienteState createState() => _DetalheClienteState();
}

class _DetalheClienteState extends State<DetalheCliente> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _cpfController;
  late TextEditingController _telefoneController;
  late TextEditingController _senhaController;
  late APCliente _aplicacao;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.cliente.nome);
    _cpfController = TextEditingController(text: widget.cliente.cpf);
    _telefoneController = TextEditingController(text: widget.cliente.telefone);
    _senhaController = TextEditingController(text: widget.cliente.senha);
    _aplicacao = APCliente(); // Initialize _aplicacao here
  }

  void _salvarAlteracoes() async {
    if (_formKey.currentState!.validate()) {
      var clienteAtualizado = DTOCliente(
        id: widget.cliente.id,
        nome: _nomeController.text,
        cpf: _cpfController.text,
        telefone: _telefoneController.text,
        senha: _senhaController.text,
        telefoneEhWhatsapp: widget.cliente.telefoneEhWhatsapp,
        estaAtivo: widget.cliente.estaAtivo,
        observacao: widget.cliente.observacao,
      );

      var clienteSalvo = await _aplicacao.alterar(clienteAtualizado);

      if (clienteSalvo != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cliente atualizado com sucesso!')));
        Navigator.pop(context, true); // Pass true to indicate success
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao atualizar o cliente!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe do Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(labelText: 'CPF'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o CPF';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o telefone';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(labelText: 'Senha'),
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
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _salvarAlteracoes,
                child: Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
