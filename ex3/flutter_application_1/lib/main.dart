import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stack & Positioned Widget'),
          backgroundColor: Colors.blue,
        ),

        body: Center(
          child: SizedBox(
            width: 350,
            height: 450,

            child: Stack(
              children: [

                // Container verde
                Positioned(
                  left: 20,
                  top: 30,
                  child: Container(
                    width: 220,
                    height: 140,
                    color: Colors.green,
                    child: const Text(
                      'Green',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                // Container vermelho
                Positioned(
                  left: 50,
                  top: 60,
                  child: Container(
                    width: 220,
                    height: 140,
                    color: Colors.red,
                    child: const Text(
                      'Red',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                // Container roxo
                Positioned(
                  left: 80,
                  top: 90,
                  child: Container(
                    width: 220,
                    height: 140,
                    color: Colors.purple,
                    child: const Text(
                      'Purple',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}