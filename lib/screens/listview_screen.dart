import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Personas'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        //CAmbiar a .separated para utilizar el separatorBuilder
        itemCount: 100,
        /* separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: const Color.fromARGB(159, 78, 67, 67),
            height: 1,
          );
        }, */
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Person $index"),
                subtitle: Text('subtítulo de prueba'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(color: const Color.fromARGB(159, 78, 67, 67), height: 1),
            ],
          );
        },
      ),
    );
  }
}
