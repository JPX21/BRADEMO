
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
      title: 'GridView Flutter',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}

class Lugar {
  final String nome;
  final String imagem;

  const Lugar({
    required this.nome,
    required this.imagem,
  });
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  final List<Lugar> lugares = const [
    Lugar(
      nome: 'Campo Florido\nCampo florido',
      imagem:
          'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=600',
    ),
    Lugar(
      nome: 'Obra em Bronze\nObra em bronze',
      imagem:
          'https://images.unsplash.com/photo-1577083552431-6e5fd01aa342?w=600',
    ),
    Lugar(
      nome: 'Mercado\nMercado',
      imagem:
          'https://images.unsplash.com/photo-1542838132-92c53300491e?w=600',
    ),
    Lugar(
      nome: 'Escultura\nEscultura',
      imagem:
          'https://images.unsplash.com/photo-1606293926075-69a00dbfde81?w=600',
    ),
    Lugar(
      nome: 'Templo\nTemplo',
      imagem:
          'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=600',
    ),
    Lugar(
      nome: 'Mar\nMar',
      imagem:
          'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares para se conhecer'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: lugares.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final lugar = lugares[index];

            return ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    lugar.imagem,
                    fit: BoxFit.cover,
                    loadingBuilder:
                        (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 40,
                          ),
                        ),
                      );
                    },
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                        stops: [0.45, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    right: 8,
                    bottom: 8,
                    child: Text(
                      lugar.nome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
