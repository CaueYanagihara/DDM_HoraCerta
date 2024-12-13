import 'package:flutter/material.dart';
import 'package:hora_certa/app/dominio/atendente.dart' as dominio;
import 'package:hora_certa/app/banco/sqlite/dao/dao_atendente.dart';
import 'package:hora_certa/app/aplicacao/ap_atendente.dart';
import 'package:hora_certa/app/aplicacao/ap_agenda.dart';
import 'package:hora_certa/app/dominio/dto/dto_agenda.dart';
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
  List<dominio.Atendente> atendentes = [];
  List<DTOAgenda> agendas = [];

  @override
  void initState() {
    super.initState();
    _fetchAtendentes();
    _fetchAgendas();
  }

  void _fetchAtendentes() async {
    final apAtendente = APAtendente();
    final fetchedAtendentes = await apAtendente.consultar();

    setState(() {
      atendentes = fetchedAtendentes.map((dto) => dominio.Atendente(
        dao: DAOAtendente(),
      )).toList();
    });
  }

  void _fetchAgendas() async {
    final apAgenda = APAgenda();
    final fetchedAgendas = await apAgenda.consultar();

    setState(() {
      agendas = fetchedAgendas.where((agenda) {
        final now = DateTime.now();
        return agenda.dataHoraInicio.year == now.year &&
               agenda.dataHoraInicio.month == now.month &&
               agenda.dataHoraInicio.day == now.day;
      }).toList();
    });
  }

  void _adicionarAgenda(DTOAgenda agenda) {
    setState(() {
      agendas.add(agenda);
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
        child: atendentes.isEmpty
            ? Center(
                child: Text(
                  'Para iniciar, cadastre o(s) atendente(s)',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: atendentes.take(3).map((atendente) {
                  final atendenteAgendas = agendas.where((agenda) => agenda.atendenteNome == atendente.nome).toList();
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 118, 214),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              atendente.nome ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ...atendenteAgendas.map((agenda) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return DetalheAgenda(tarefa: Tarefa(
                                        agenda.servicoNome,
                                        agenda.clienteNome,
                                        agenda.dataHoraInicio,
                                        agenda.dataHoraFim,
                                        agenda.preco,
                                        agenda.observacao,
                                      ));
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
                                          agenda.servicoNome,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          'Cliente: ${agenda.clienteNome}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          'Início: ${agenda.dataHoraInicio.hour}:${agenda.dataHoraInicio.minute.toString().padLeft(2, '0')}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          'Fim: ${agenda.dataHoraFim.hour}:${agenda.dataHoraFim.minute.toString().padLeft(2, '0')}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          'Preço: R\$${agenda.preco}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        if (agenda.observacao != null && agenda.observacao!.isNotEmpty)
                                          Text(
                                            'Observação: ${agenda.observacao}',
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
            MaterialPageRoute(builder: (context) => FormularioAgenda(clientes: [], servicos: [], atendentes: atendentes)),
          );
          if (result != null && result is Map<String, dynamic>) {
            _adicionarAgenda(result['agenda']);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }
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
