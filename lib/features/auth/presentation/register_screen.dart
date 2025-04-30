    import 'package:flutter/material.dart';
import '../data/user.dart';
import '../data/user_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final repo = UsersRepository();
    final users = await repo.loadUsers();
    users.add(User(
      name: _nameCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      password: _passCtrl.text.trim(),
    ));
    await repo.saveUsers(users);
    setState(() => _loading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro realizado com sucesso!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (v) => v!.isEmpty ? 'Informe seu nome' : null,
              ),
              TextFormField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'E-mail'),
                validator: (v) => v!.contains('@') ? null : 'E-mail inválido',
              ),
              TextFormField(
                controller: _passCtrl,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (v) => v!.length<4 ? 'Senha muito curta' : null,
              ),
              const SizedBox(height: 20),
              _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _register,
                    child: const Text('Cadastrar'),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
