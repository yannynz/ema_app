import 'package:flutter/material.dart';
import '../data/user.dart';
import '../data/user_repository.dart';
import './register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  Future<void> _login() async {
    setState(() => _loading = true);
    final repo = UsersRepository();
    final users = await repo.loadUsers();
    final match = users.where((u) =>
      u.email == _emailCtrl.text.trim() &&
      u.password == _passCtrl.text.trim());
    if (match.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail ou senha incorretos')),);
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: _passCtrl,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _loading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
            TextButton(
              onPressed: ()=> Navigator.pushNamed(context, '/register'),
              child: const Text('Criar nova conta'),
            ),
          ],
        ),
      ),
    );
  }
}
