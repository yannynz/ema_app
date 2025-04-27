import 'dart:convert';
import 'package:flutter/services.dart';

import './models/tip.dart';

class TipsRepository {
  Future<List<Tip>> fetchTips() async {
    final data = await rootBundle.loadString('assets/json/safety_tips.json');
    final list = jsonDecode(data) as List<dynamic>;
    return list.map((e) => Tip.fromJson(e)).toList();
  }
}
