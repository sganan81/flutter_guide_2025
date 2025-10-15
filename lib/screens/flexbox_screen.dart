import 'package:flutter/material.dart';
import '../../widgets/create_container.dart';

class FlexboxScreen extends StatelessWidget {
  const FlexboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexbox'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () =>
                Navigator.pushReplacementNamed(context, 'material_library'),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(child: Icon(Icons.home)),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.all(2),
            height: 250,
            width: 350,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(65, 0, 0, 0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  CreateContainer(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(1),
                    cajaColor: Colors.greenAccent,
                    child: Text('$i'),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.all(2),
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(65, 0, 0, 0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (int i = 0; i < 3; i++)
                  CreateContainer(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(1),
                    cajaColor: Colors.blueAccent,
                    child: Text('$i'),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.all(2),
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(65, 154, 41, 41),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (int i = 0; i < 3; i++)
                  CreateContainer(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(1),
                    cajaColor: Colors.greenAccent,
                    child: Text('$i'),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.all(2),
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(65, 154, 41, 41),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < 3; i++)
                  CreateContainer(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(1),
                    cajaColor: Colors.greenAccent,
                    child: Text('$i'),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.all(2),
            height: 220,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(65, 154, 41, 41),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < 3; i++)
                  CreateContainer(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(1),
                    cajaColor: Colors.greenAccent,
                    child: Text('$i'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
