import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme.dart';
import 'core/constants.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/register_screen.dart';
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
      initialRoute: '/login',
      routes: {
        '/login': (c) => const LoginScreen(),
        '/register': (c) => const RegisterScreen(),
        '/home': (c) => const HomeScreen(),
      },
    );
  }
}
