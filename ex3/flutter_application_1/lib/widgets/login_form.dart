
import 'package:flutter/material.dart';
import '../models/login.dart';

class LoginForm extends StatefulWidget {
  final ValueChanged<Login> onSubmit;

  const LoginForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _ocultarSenha = true;

  @override
  void dispose() {
    _usuarioController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _enviarFormulario() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final login = Login(
      usuario: _usuarioController.text.trim(),
      senha: _senhaController.text,
    );

    widget.onSubmit(login);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _usuarioController,
            decoration: const InputDecoration(
              labelText: 'Usuário',
              hintText: 'Digite admin',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            validator: (valor) {
              if (valor == null || valor.trim().isEmpty) {
                return 'Informe o usuário';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: _senhaController,
            obscureText: _ocultarSenha,
            decoration: InputDecoration(
              labelText: 'Senha',
              hintText: 'Digite sua senha',
              prefixIcon: const Icon(Icons.lock),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _ocultarSenha
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _ocultarSenha = !_ocultarSenha;
                  });
                },
              ),
            ),
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return 'Informe a senha';
              }
              return null;
            },
            onFieldSubmitted: (_) => _enviarFormulario(),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: _enviarFormulario,
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
