
import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  // Tema inicial: azul
  ThemeData temaAtual = ThemeData(
    scaffoldBackgroundColor: Colors.blue,
  );

  // Novo tema: amarelo
  final ThemeData temaAmarelo = ThemeData(
    scaffoldBackgroundColor: Colors.yellow,
  );

  bool temaAmareloAtivo = false;

  void alterarTema() {
    setState(() {
      temaAmareloAtivo = !temaAmareloAtivo;

      temaAtual = temaAmareloAtivo
          ? temaAmarelo
          : ThemeData(
              scaffoldBackgroundColor: Colors.blue,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Aplica o tema selecionado
      theme: temaAtual,

      home: MinhaTela(
        temaAmareloAtivo: temaAmareloAtivo,
        alterarTema: alterarTema,
      ),
    );
  }
}

class MinhaTela extends StatelessWidget {
  final bool temaAmareloAtivo;
  final VoidCallback alterarTema;

  const MinhaTela({
    super.key,
    required this.temaAmareloAtivo,
    required this.alterarTema,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 180,
              height: 100,
              color: Colors.lightBlueAccent,
              alignment: Alignment.center,
              child: const Text(
                'Widget',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              temaAmareloAtivo
                  ? 'Tema atual: Amarelo'
                  : 'Tema atual: Azul',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: alterarTema,
              child: const Text('Alterar ThemeData'),
            ),
          ],
        ),
      ),
    );
  }
}
