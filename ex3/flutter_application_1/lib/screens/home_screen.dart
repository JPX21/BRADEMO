
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter By Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 220,
          height: 220,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const FlutterLogo(size: 200);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Bem-vindo à página inicial!'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
