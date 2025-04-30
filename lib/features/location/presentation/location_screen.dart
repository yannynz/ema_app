import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  void _simulateShare(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Localização simulada enviada para contatos favoritos!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Localização')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.send),
          label: const Text('Simular compartilhamento'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () => _simulateShare(context),
        ),
      ),
    );
  }
}
