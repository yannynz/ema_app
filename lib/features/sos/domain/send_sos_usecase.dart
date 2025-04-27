import '../data/sos_repository.dart';
import '../data/models/sos_event.dart';

class SendSosUseCase {
  final SosRepository repository;
  SendSosUseCase(this.repository);

  Future<SosEvent> call() async {
   
    // aqui logic mock
    return repository.fetchLatestEvent();
  }
}
