import 'package:flutter/material.dart';
import 'home_agenda.dart';
import 'package:hora_certa/app/dominio/cliente.dart';
import 'package:hora_certa/app/dominio/servico.dart';
import 'package:hora_certa/app/dominio/atendente.dart';
import 'package:hora_certa/app/dominio/dto/dto_agenda.dart';

class FormularioAgenda extends StatefulWidget {
  final List<Cliente> clientes;
  final List<Servico> servicos;
  final List<Atendente> atendentes;

  FormularioAgenda({required this.clientes, required this.servicos, required this.atendentes});

  @override
  _FormularioAgendaState createState() => _FormularioAgendaState();
}

class _FormularioAgendaState extends State<FormularioAgenda> {
  final _formKey = GlobalKey<FormState>();
  String? _atendente;
  String? _cliente;
  String? _servico;
  int? _preco;
  DateTime? _data;
  TimeOfDay? _horaInicio;
  TimeOfDay? _horaFim;
  String? _observacao;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Agenda'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Atendente'),
                items: widget.atendentes
                    .map((atendente) => DropdownMenuItem<String>(
                          value: atendente.nome ?? '',
                          child: Text(atendente.nome ?? ''),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _atendente = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione um atendente';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Cliente'),
                items: widget.clientes
                    .map((cliente) => DropdownMenuItem<String>(
                          value: cliente.nome ?? '',
                          child: Text(cliente.nome ?? ''),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _cliente = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione um cliente';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Serviço'),
                items: widget.servicos
                    .map((servico) => DropdownMenuItem<String>(
                          value: servico.nome ?? '',
                          child: Text(servico.nome ?? ''),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _servico = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione um serviço';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço Total'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _preco = int.tryParse(value);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço total';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Data'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _data = pickedDate;
                    });
                  }
                },
                validator: (value) {
                  if (_data == null) {
                    return 'Por favor, selecione uma data';
                  }
                  return null;
                },
                controller: TextEditingController(
                  text: _data == null ? '' : _data!.toLocal().toString().split(' ')[0],
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hora de Início'),
                readOnly: true,
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _horaInicio = pickedTime;
                    });
                  }
                },
                validator: (value) {
                  if (_horaInicio == null) {
                    return 'Por favor, selecione a hora de início';
                  }
                  return null;
                },
                controller: TextEditingController(
                  text: _horaInicio == null ? '' : _horaInicio!.format(context),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hora de Fim'),
                readOnly: true,
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _horaFim = pickedTime;
                    });
                  }
                },
                validator: (value) {
                  if (_horaFim == null) {
                    return 'Por favor, selecione a hora de fim';
                  }
                  return null;
                },
                controller: TextEditingController(
                  text: _horaFim == null ? '' : _horaFim!.format(context),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Observação'),
                onChanged: (value) {
                  setState(() {
                    _observacao = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final agenda = DTOAgenda(
                      clienteId: widget.clientes.firstWhere((cliente) => cliente.nome == _cliente).id.toString(),
                      servicoId: widget.servicos.firstWhere((servico) => servico.nome == _servico).id.toString(),
                      atendenteId: widget.atendentes.firstWhere((atendente) => atendente.nome == _atendente).id.toString(),
                      atendenteNome: _atendente ?? '',
                      clienteNome: _cliente ?? '',
                      servicoNome: _servico ?? '',
                      dataHoraInicio: DateTime(_data!.year, _data!.month, _data!.day, _horaInicio!.hour, _horaInicio!.minute),
                      dataHoraFim: DateTime(_data!.year, _data!.month, _data!.day, _horaFim!.hour, _horaFim!.minute),
                      preco: _preco!,
                      status: 'P',
                      observacao: _observacao,
                    );
                    Navigator.pop(context, {'agenda': agenda});
                  }
                },
                child: Text('Salvar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
