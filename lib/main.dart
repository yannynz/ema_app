import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme.dart';
import 'core/constants.dart';
import 'features/auth/login_screen.dart';
import 'features/navigation/home_screen.dart';
import 'features/settings/presentation/about_screen.dart';
import 'features/settings/presentation/profile_screen.dart';
import 'features/settings/presentation/contact_us_screen.dart';

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
        '/about': (_) => const AboutScreen(),
        '/profile': (_) => const ProfileScreen(),
        '/contact': (_) => const ContactUsScreen(),
      },
    );
  }
}
