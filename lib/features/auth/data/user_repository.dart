import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'user.dart';

class UsersRepository {
  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('\${dir.path}/users.json');
      await file.writeAsString(data);
    }
    final content = await file.readAsString();
    final list = jsonDecode(content) as List<dynamic>;
    return list.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> saveUsers(List<User> users) async {
    final file = await _getFile();
    final data = jsonEncode(users.map((u) => u.toJson()).toList());
    await file.writeAsString(data);
  }
}
