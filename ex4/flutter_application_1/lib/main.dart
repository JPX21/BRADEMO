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
          title: const Text('Insert Image Example'),
          backgroundColor: Colors.blue,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [

              // Primeira imagem
              Container(
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                height: 230,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.network(
                    'https://imgs.search.brave.com/o_LTLPrPU_HOmayx5bOS10fWOVGgSR24EyI2jgg_czU/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly93d3cu/aWZzcC5lZHUuYnIv/aW1hZ2VzL01hcmNh/X0lGU1BfMjAxNTAz/MS5wbmc',
                  ),
                ),
              ),

              // Espaço entre as imagens
              const SizedBox(
                height: 120,
              ),

              // Segunda imagem
              Container(
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                height: 230,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.network(
                    'https://imgs.search.brave.com/ngQw7ZKm22QJbaKbECrxRsFvLZlnIpokZgJeIQiryqQ/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9zdGF0/aWMudmVjdGVlenku/Y29tL3RpL2ZvdG9z/LWdyYXRpcy90Mi8x/MTIxNjEzNS1wcm9n/cmFtYWNhby1kZS1s/aW5ndWFnZW0tZGUt/Y29tcHV0YWRvci1j/b2RpZ28tamF2YXNj/cmlwdC1jb21wb25l/bnRlcy1kby1lZGl0/b3ItZGUtdGV4dG8t/ZGEtaW50ZXJuZXQt/bmEtdGVsYS1kZS1l/eGliaWNhby1ncmF0/aXMtZm90by5qcGc',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}