import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/widgets/drawer_menu.dart';

class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(title: const Text('BottomNavigationScreen')),
      body: BodyContent(boton: _index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        elevation: 10,
        onTap: (value) {
          setState(() {
            _index = value;
            print(_index);
          });
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
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  final int boton;
  final List<Widget> _screens = [
    Boton1(),
    Center(child: Text('Search')),
    Center(child: Text('Profile')),
  ];

  BodyContent({super.key, required this.boton});

  @override
  Widget build(BuildContext context) {
    return _screens[this.boton];
  }
}

class Boton1 extends StatelessWidget {
  const Boton1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home'));
  }
}
