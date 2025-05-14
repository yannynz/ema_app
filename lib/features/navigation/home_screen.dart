import 'package:flutter/material.dart';
import 'app_drawer.dart';
import '../sos/presentation/sos_screen.dart';
import '../location/presentation/location_screen.dart';
import '../contacts/presentation/contacts_screen.dart';
import '../tips/presentation/tips_screen.dart';
import '../../core/constants.dart';
import '../chat/presentation/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  static const List<Widget> _screens = <Widget>[
    ContactsScreen(),
    SosScreen(),
    LocationScreen(),
    TipsScreen(),
    ChatScreen(),  
  ];

  void _onTap(int idx) => setState(() => _currentIndex = idx);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: Text(appTitle)),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Contatos'),
          BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'SOS'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Localização'),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Dicas'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
        ],
      ),
    );
  }
}
