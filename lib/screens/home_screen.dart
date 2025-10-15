import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Hola mundo'),
        backgroundColor: Colors.blueAccent,
        leading: GestureDetector(
          child: Icon(Icons.menu),
          onTap: () => print('click menu'),
        ),
        leadingWidth: 50,
        centerTitle: true,
        toolbarHeight: 70,
        actions: [
          Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Cantidad de clicks: $_counter',
                style: TextStyle(color: Colors.black),
              ),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
              Text('Cantidad de clicks: $_counter'),
            ],
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
