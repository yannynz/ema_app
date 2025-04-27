import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './../data/tips_repository.dart';
import './../data/models/tip.dart';

final tipsProvider = FutureProvider<List<Tip>>((ref) {
  final repo = TipsRepository();
  return repo.fetchTips();
});

class TipsScreen extends ConsumerWidget {
  const TipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTips = ref.watch(tipsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Dicas de Segurança')),
      body: asyncTips.when(
        data: (tips) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: tips.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, i) {
            final tip = tips[i];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tip.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tip.body,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro ao carregar dicas: \$e')),
      ),
    );
  }
}
