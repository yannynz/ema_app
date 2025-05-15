import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  final String _aboutText = '''
Visão
Ser referência nacional em soluções tecnológicas voltadas à segurança pessoal feminina, contribuindo para um cotidiano mais tranquilo e confiável.

Missão
Oferecer um aplicativo simples, eficaz e acessível que auxilie mulheres em situações de risco, conectando recursos inteligentes com suporte rápido e confiável.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Sobre Nós'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Text(
            _aboutText,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5, // espaçamento entre linhas para melhor leitura
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}

