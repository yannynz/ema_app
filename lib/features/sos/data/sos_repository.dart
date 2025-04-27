import 'dart:convert';
import 'package:flutter/services.dart';
import 'models/sos_event.dart';

class SosRepository {
  Future<SosEvent> fetchLatestEvent() async {
    final data = await rootBundle.loadString('assets/json/sos_event.json');
    return SosEvent.fromJson(jsonDecode(data));
  }
}
