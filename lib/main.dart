import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme.dart';
import 'core/constants.dart';
import 'features/sos/presentation/sos_screen.dart';
import 'features/navigation/home_screen.dart';  

void main() {
  runApp(const ProviderScope(child: EmaApp()));
}

class EmaApp extends StatelessWidget {
  const EmaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
