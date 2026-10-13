
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const TelaTarefas(),
    );
  }
}

class Tarefa {
  final int id;
  final String titulo;
  final String data;
  bool concluida;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.data,
    this.concluida = false,
  });
}

class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  bool mostrarConcluidas = false;
  int proximoId = 6;

  final List<Tarefa> tarefas = [
    Tarefa(
      id: 1,
      titulo: 'Task 2022-07-09',
      data: '18:08:31.734244',
    ),
    Tarefa(
      id: 2,
      titulo: 'Task 2022-07-09',
      data: '18:08:32.210300',
    ),
    Tarefa(
      id: 3,
      titulo: 'Task 2022-07-09',
      data: '18:08:32.629026',
    ),
    Tarefa(
      id: 4,
      titulo: 'Task 2022-07-09',
      data: '18:08:33.073472',
    ),
    Tarefa(
      id: 5,
      titulo: 'Task 2022-07-09',
      data: '18:08:33.524172',
    ),
  ];

  List<Tarefa> get tarefasFiltradas {
    if (mostrarConcluidas) {
      return tarefas.where((tarefa) => tarefa.concluida).toList();
    }

    return tarefas.where((tarefa) => !tarefa.concluida).toList();
  }

  void adicionarTarefa() {
    setState(() {
      tarefas.insert(
        0,
        Tarefa(
          id: proximoId++,
          titulo: 'Nova tarefa',
          data: _dataAtual(),
        ),
      );

      mostrarConcluidas = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Nova tarefa adicionada!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String _dataAtual() {
    final agora = DateTime.now();

    String doisDigitos(int valor) =>
        valor.toString().padLeft(2, '0');

    return '${doisDigitos(agora.hour)}:'
        '${doisDigitos(agora.minute)}:'
        '${doisDigitos(agora.second)}';
  }

  void mostrarMensagem() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('App de Notas de Tarefas'),
          content: const Text(
            'Você está no App de Notas de Tarefas',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final quantidadePendentes =
        tarefas.where((tarefa) => !tarefa.concluida).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      mostrarConcluidas = !mostrarConcluidas;
                    });
                  },
                  child: Text(
                    mostrarConcluidas
                        ? 'View Uncompleted Tasks'
                        : 'View Completed Tasks',
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  mostrarConcluidas
                      ? 'You have ${tarefas.where((t) => t.concluida).length} completed tasks'
                      : 'You have $quantidadePendentes uncompleted tasks',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),

            Expanded(
              child: tarefasFiltradas.isEmpty
                  ? Center(
                      child: Text(
                        mostrarConcluidas
                            ? 'Nenhuma tarefa concluída.'
                            : 'Todas as tarefas foram concluídas!',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(
                        12, 0, 12, 80,
                      ),
                      itemCount: tarefasFiltradas.length,
                      itemBuilder: (context, index) {
                        final tarefa = tarefasFiltradas[index];

                        return Card(
                          color: Colors.amber.shade300,
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(
                            vertical: 6,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              top: 4,
                              bottom: 4,
                              right: 4,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tarefa.titulo,
                                        style: TextStyle(
                                          fontSize: 14,
                                          decoration:
                                              tarefa.concluida
                                                  ? TextDecoration
                                                      .lineThrough
                                                  : TextDecoration.none,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        tarefa.data,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Checkbox(
                                  value: tarefa.concluida,
                                  onChanged: (bool? valor) {
                                    setState(() {
                                      tarefa.concluida =
                                          valor ?? false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (context) {
              return SafeArea(
                child: Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add_task),
                      title: const Text('Adicionar tarefa'),
                      onTap: () {
                        Navigator.pop(context);
                        adicionarTarefa();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: const Text('Sobre o aplicativo'),
                      onTap: () {
                        Navigator.pop(context);
                        mostrarMensagem();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
