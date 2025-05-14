import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre Nós')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Visão'
          '\nSer referência nacional em soluções tecnológicas voltadas à segurança pessoal feminina, contribuindo para um cotidiano mais tranquilo e confiável.'
          '\n '
          '\nMissão'
          '\nOferecer um aplicativo simples, eficaz e acessível que auxilie mulheres em situações de risco, conectando recursos inteligentes com suporte rápido e confiável.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
