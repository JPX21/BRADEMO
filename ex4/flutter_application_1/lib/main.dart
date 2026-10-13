
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
      title: 'Flutter Form Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: false,
      ),
      home: const FormularioPage(),
    );
  }
}

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() =>
      _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController =
      TextEditingController();
  final TextEditingController _telefoneController =
      TextEditingController();
  final TextEditingController _dataController =
      TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  Future<void> _selecionarData() async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Selecione sua data de nascimento',
    );

    if (dataSelecionada != null) {
      setState(() {
        _dataController.text =
            '${dataSelecionada.day.toString().padLeft(2, '0')}/'
            '${dataSelecionada.month.toString().padLeft(2, '0')}/'
            '${dataSelecionada.year}';
      });
    }
  }

  void _enviarFormulario() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final String nome = _nomeController.text.trim();
    final String telefone = _telefoneController.text.trim();
    final String data = _dataController.text.trim();

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Nome: $nome\n'
          'Telefone: $telefone\n'
          'Data de nascimento: $data',
        ),
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Form Demo',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Campo Nome
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 28,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _nomeController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          border: UnderlineInputBorder(),
                        ),
                        textCapitalization:
                            TextCapitalization.words,
                        validator: (valor) {
                          if (valor == null ||
                              valor.trim().isEmpty) {
                            return 'Informe seu nome';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Campo Telefone
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 28,
                      child: Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _telefoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Phone',
                          border: UnderlineInputBorder(),
                        ),
                        validator: (valor) {
                          if (valor == null ||
                              valor.trim().isEmpty) {
                            return 'Informe seu telefone';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Campo Data de nascimento
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 28,
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _dataController,
                        readOnly: true,
                        onTap: _selecionarData,
                        decoration: const InputDecoration(
                          hintText: 'DOB',
                          border: UnderlineInputBorder(),
                        ),
                        validator: (valor) {
                          if (valor == null ||
                              valor.trim().isEmpty) {
                            return 'Selecione sua data de nascimento';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Botão Submit
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _enviarFormulario,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
