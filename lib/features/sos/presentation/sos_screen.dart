import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants.dart';
import '../data/sos_repository.dart';
import '../data/models/sos_event.dart';

final sosEventProvider = FutureProvider.autoDispose<SosEvent>((ref) => SosRepository().fetchLatestEvent());

class SosScreen extends ConsumerWidget {
  const SosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncEvent = ref.watch(sosEventProvider);
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Center(
        child: asyncEvent.when(
          data: (_) => ElevatedButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('SOS disparado!'))),
            style: ElevatedButton.styleFrom(shape: const CircleBorder(), padding: const EdgeInsets.all(128), backgroundColor: Theme.of(context).colorScheme.primary),
            child: const Text('S.O.S', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text('Erro: \$e'),
        ),
      ),
    );
  }
}
