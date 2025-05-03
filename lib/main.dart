import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme.dart';
import 'core/constants.dart';
import 'features/auth/login_screen.dart';
import 'features/navigation/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: EmaApp()));
}

class EmaApp extends StatelessWidget {
  const EmaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: appTheme,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
