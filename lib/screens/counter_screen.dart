import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/widgets/drawer_menu.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterStatePage();
}

class _CounterStatePage extends State<CounterScreen> {
  int _counter = 10;

  void handlerCounter(String operation) {
    setState(() {
      switch (operation) {
        case 'plus':
          _counter++;
          break;

        case 'minus':
          _counter--;
          break;

        case 'reset':
          _counter = 10;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter App 2'),
        elevation: 10,
      ),
      drawer: DrawerMenu(),
      body: BodyCounter(counter: _counter),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonsCounter(handlerCounter),
    );
  }
}

class ButtonsCounter extends StatelessWidget {
  final void Function(String operation) handlerCounter;

  //void Function(String operation)

  const ButtonsCounter(this.handlerCounter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'fab_minus',
            onPressed: () => handlerCounter('minus'),
            child: const Icon(Icons.exposure_minus_1),
          ),
          FloatingActionButton(
            heroTag: 'fab_reset',
            onPressed: () => handlerCounter('reset'),
            child: const Icon(Icons.restore),
          ),
          FloatingActionButton(
            heroTag: 'fab_plus',
            onPressed: () => handlerCounter('plus'),
            child: const Icon(Icons.plus_one_outlined),
          ),
        ],
      ),
    );
  }
}

class BodyCounter extends StatelessWidget {
  const BodyCounter({Key? key, required int counter})
    : _counter = counter,
      super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Usted ha realizado los siguientes clicks:',
            style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
          ),
          Text(
            'Cantidad de clicks: $_counter',
            style: const TextStyle(fontSize: 21),
          ),
        ],
      ),
    );
  }
}
