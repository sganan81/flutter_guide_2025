import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/widgets/drawer_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _counter = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Hola mundo'),
        backgroundColor: Colors.blueAccent,
        leadingWidth: 50,
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 123, 209, 238),
          width: 300,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            'Cantidad de clicks: $_counter',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add),
          onPressed: () {
            _counter++;
            print('click $_counter');
            setState(() {});
          },
        ),
      ),
    );
  }
}
