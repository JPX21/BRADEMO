
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
      title: 'Responsive Layouts',
      theme: ThemeData.dark(),
      home: const TelaResponsiva(),
    );
  }
}

class TelaResponsiva extends StatelessWidget {
  const TelaResponsiva({super.key});

  final List<String> linguagens = const [
    'Dart',
    'JavaScript',
    'PHP',
    'C++',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Responsive Layouts',
          style: TextStyle(fontSize: 12),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        toolbarHeight: 35,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: Colors.white38,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            
            // Tela larga: layout horizontal.
            // Tela estreita: layout vertical.
            final bool horizontal = constraints.maxWidth >= 600;

            if (horizontal) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _painelPrincipal(),
                  ),
                  Expanded(
                    flex: 1,
                    child: _listaLinguagens(),
                  ),
                ],
              );
            }

            return Column(
              children: [
                _painelPrincipal(),
                Expanded(
                  child: _listaLinguagens(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _painelPrincipal() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          const Text(
            'Cheetah Coding',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _botao('BUTTON 1'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _botao('BUTTON 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _botao(String texto) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        onPressed: () {
          // Ação do botão.
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: const RoundedRectangleBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 4),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            texto,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget _listaLinguagens() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: linguagens.length,
      itemBuilder: (context, index) {
        return Container(
          height: 52,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white38,
                width: 1,
              ),
            ),
          ),
          child: Text(
            linguagens[index],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
