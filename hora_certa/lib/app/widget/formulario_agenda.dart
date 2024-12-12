import 'package:flutter/material.dart';
import 'home_agenda.dart';

class FormularioAgenda extends StatefulWidget {
  @override
  _FormularioAgendaState createState() => _FormularioAgendaState();
}

class _FormularioAgendaState extends State<FormularioAgenda> {
  final _formKey = GlobalKey<FormState>();
  String? _atendente;
  String? _cliente;
  String? _servico;
  int? _precoTotal;
  DateTime? _data;
  TimeOfDay? _horaInicio;
  TimeOfDay? _horaFim;
  int? _preco;
  String? _observacao;

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
                items: ['Atendente 1', 'Atendente 2', 'Atendente 3']
                    .map((atendente) => DropdownMenuItem(
                          value: atendente,
                          child: Text(atendente),
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
                items: ['Cliente 1', 'Cliente 2', 'Cliente 3']
                    .map((cliente) => DropdownMenuItem(
                          value: cliente,
                          child: Text(cliente),
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
                items: ['Serviço 1', 'Serviço 2', 'Serviço 3']
                    .map((servico) => DropdownMenuItem(
                          value: servico,
                          child: Text(servico),
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
                    _precoTotal = int.tryParse(value);
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
                    final tarefa = Tarefa(
                      _servico!,
                      _cliente!,
                      DateTime(_data!.year, _data!.month, _data!.day, _horaInicio!.hour, _horaInicio!.minute),
                      DateTime(_data!.year, _data!.month, _data!.day, _horaFim!.hour, _horaFim!.minute),
                      _preco!,
                      _observacao,
                    );
                    Navigator.pop(context, {'tarefa': tarefa, 'atendenteNome': _atendente});
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
