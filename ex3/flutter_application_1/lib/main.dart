
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
      title: 'Flutter Constraints',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const TelaConstraints(),
    );
  }
}

class TelaConstraints extends StatelessWidget {
  const TelaConstraints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restrições de Layout'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Como funcionam as Constraints',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Irei mostrar como o flutter define o tamanho/posicao dos widgets',
          ),

          // EXEMPLO 1
          _titulo('1. Container com tamanho definido'),
          Container(
            width: 150,
            height: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              '150 x 100',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Text(
            'O Container solicita 150 x 100, respeitando '
            'as restrições impostas pelo pai.',
          ),

          // EXEMPLO 2
          _titulo('2. Center e tamanho do filho'),
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Center(
              child: Container(
                width: 120,
                height: 80,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(
                  'Filho',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Text(
            'O Center ocupa o espaço disponível e posiciona '
            'o filho no centro.',
          ),

          // EXEMPLO 3
          _titulo('3. ConstrainedBox'),
          Container(
            color: Colors.orange.shade100,
            width: double.infinity,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 100,
                maxWidth: 250,
                minHeight: 60,
                maxHeight: 100,
              ),
              child: Container(
                color: Colors.orange,
                alignment: Alignment.center,
                child: const Text(
                  'Limites de tamanho',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Text(
            'ConstrainedBox adiciona limites mínimos e máximos. '
            'O tamanho final também depende das restrições '
            'recebidas do widget pai.',
          ),

          // EXEMPLO 4
          _titulo('4. UnconstrainedBox'),
          Container(
            width: double.infinity,
            color: Colors.purple.shade50,
            child: UnconstrainedBox(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 220,
                height: 60,
                color: Colors.purple,
                alignment: Alignment.center,
                child: const Text(
                  'Filho com 220 px',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Text(
            'UnconstrainedBox remove algumas restrições de '
            'tamanho do eixo correspondente para seu filho. '
            'Ele pode ultrapassar o espaço disponível.',
          ),

          // EXEMPLO 5
          _titulo('5. Expanded dentro de Row'),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text(
                    'Flex 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 80,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text(
                    'Flex 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Expanded divide o espaço restante. O segundo '
            'widget recebe duas vezes a proporção do primeiro.',
          ),

          // EXEMPLO 6
          _titulo('6. LayoutBuilder: tamanho disponível'),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Colors.teal.shade100,
                child: Text(
                  'Largura disponível: '
                  '${constraints.maxWidth.toStringAsFixed(0)} px\n'
                  'Altura máxima: '
                  '${constraints.maxHeight.isFinite ? constraints.maxHeight.toStringAsFixed(0) : "ilimitada"} px',
                ),
              );
            },
          ),
          const Text(
            'LayoutBuilder permite consultar as restrições '
            'disponíveis naquele ponto da árvore de widgets.',
          ),

          const SizedBox(height: 24),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Basicamente:\n\n'
                '1. O pai transmite as restrições ao filho.\n'
                '2. O filho escolhe um tamanho permitido.\n'
                '3. O pai posiciona o filho.\n\n',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _titulo(String texto) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 12,
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
