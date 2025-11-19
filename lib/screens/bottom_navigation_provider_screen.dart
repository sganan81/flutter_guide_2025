import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

class BottomNavigationProviderScreen extends StatelessWidget {
  BottomNavigationProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _handlerPage(),
      child: Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(title: const Text('BottomNavigationProviderScreen')),
        body: BodyContentProvider(),
        bottomNavigationBar: BottomNavigationProvider(),
      ),
    );
  }
}

class BottomNavigationProvider extends StatelessWidget {
  const BottomNavigationProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<_handlerPage>(context, listen: true);
    return BottomNavigationBar(
      currentIndex: page.paginaActual,
      elevation: 10,
      onTap: (value) {
        page.paginaActual = value;
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          activeIcon: Icon(Icons.search_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          activeIcon: Icon(Icons.person_outline),
        ),
      ],
    );
  }
}

class BodyContentProvider extends StatelessWidget {
  final List<Widget> _screens = [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
  ];

  BodyContentProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<_handlerPage>(context, listen: true);
    return _screens[page.paginaActual];
  }
}

class _handlerPage extends ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => _paginaActual;

  set paginaActual(int value) {
    _paginaActual = value;
    notifyListeners();
  }
}
