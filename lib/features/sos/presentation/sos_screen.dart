import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants.dart';
import '../../sos/data/sos_repository.dart';
import '../../sos/data/models/sos_event.dart';

final sosEventProvider = FutureProvider.autoDispose<SosEvent>((ref) {
  final repo = SosRepository();
  return repo.fetchLatestEvent();
});

class SosScreen extends ConsumerWidget {
  const SosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncEvent = ref.watch(sosEventProvider);
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: Center(
        child: asyncEvent.when(
          data: (event) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('SOS disparado!')));
            },
            child: const Text('Botão SOS'),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text('Erro: \$e'),
        ),
      ),
    );
  }
}
