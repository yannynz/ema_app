import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'generated/injector.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configureDependencies() => $initGetIt(getIt);

{
  "eventId": "1",
  "ownerUid": "user_01",
  "startedAt": "2025-04-27T17:30:00Z",
  "status": "open",
  "contactIds": ["c1","c2"]
}
