
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
      title: 'BottomAppBar with FAB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: false,
      ),
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int abaSelecionada = 2;
  bool menuAberto = false;

  final List<String> nomesAbas = const [
    'This',
    'Is',
    'A',
    'Bottom',
    'Bar',
  ];

  final List<IconData> iconesAbas = const [
    Icons.list,
    Icons.layers,
    Icons.add,
    Icons.grid_view,
    Icons.bar_chart,
  ];

  void selecionarAba(int index) {
    setState(() {
      abaSelecionada = index;

      // Fecha as ações ao trocar de aba.
      menuAberto = false;
    });
  }

  void executarAcao(String mensagem) {
    setState(() {
      menuAberto = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget botaoAcao({
    required IconData icone,
    required String descricao,
    required VoidCallback aoPressionar,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: FloatingActionButton.small(
        heroTag: descricao,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 4,
        tooltip: descricao,
        onPressed: aoPressionar,
        child: Icon(icone),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBar with FAB'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Text(
          'TAB: ${abaSelecionada + 1}',
          style: const TextStyle(
            fontSize: 26,
            color: Colors.black87,
          ),
        ),
      ),

      // Menu de ações que aparece acima do FAB.
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (menuAberto) ...[
            botaoAcao(
              icone: Icons.message,
              descricao: 'Mensagem',
              aoPressionar: () =>
                  executarAcao('Opção Mensagem selecionada'),
            ),
            botaoAcao(
              icone: Icons.email,
              descricao: 'E-mail',
              aoPressionar: () =>
                  executarAcao('Opção E-mail selecionada'),
            ),
            botaoAcao(
              icone: Icons.phone,
              descricao: 'Telefone',
              aoPressionar: () =>
                  executarAcao('Opção Telefone selecionada'),
            ),
          ],
          FloatingActionButton(
            heroTag: 'botaoPrincipal',
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onPressed: () {
              setState(() {
                menuAberto = !menuAberto;
              });
            },
            child: Icon(
              menuAberto ? Icons.close : Icons.add,
            ),
          ),
        ],
      ),

      // Posiciona o FAB no centro da barra inferior.
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        color: Colors.white,
        elevation: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            children: List.generate(5, (index) {
              final bool selecionada = abaSelecionada == index;

              return Expanded(
                child: InkWell(
                  onTap: () => selecionarAba(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          iconesAbas[index],
                          size: 20,
                          color: selecionada
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          nomesAbas[index],
                          style: TextStyle(
                            fontSize: 11,
                            color: selecionada
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
