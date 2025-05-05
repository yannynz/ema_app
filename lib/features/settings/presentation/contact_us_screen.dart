import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fale Conosco')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Dúvidas ou sugestões? Entre em contato pelo email: suporte@emaapp.com',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
