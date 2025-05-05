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
          'E.M.A é um aplicativo dedicado à segurança feminina...'
          '\n\nMissão: Reduzir o tempo entre o alerta e a ajuda.'
          '\nVisão: Oferecer um canal discreto e confiável.'
          '\nValores: Privacidade, Confiabilidade, Empoderamento.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
