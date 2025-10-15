import 'package:flutter/material.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseño de ejemplo'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1444927714506-8492d94b4e3d?q=80&w=1476&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Título de prueba'),
                        Text('SubTítulo de prueba'),
                      ],
                    ),
                    Icon(Icons.star),
                    Text('31'),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [Icon(Icons.phone), Text('Call')]),
                  Column(children: [Icon(Icons.phone), Text('Call')]),
                  Column(children: [Icon(Icons.phone), Text('Call')]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Commodo do aute minim qui id irure irure. Magna ipsum eiusmod adipisicing deserunt labore consequat eiusmod id commodo veniam qui. Eu eu do ad in id proident consequat. In deserunt aliqua anim Lorem Lorem. Reprehenderit officia aliqua reprehenderit cillum Lorem commodo dolor pariatur eiusmod voluptate adipisicing culpa. Amet consectetur occaecat velit ipsum velit do exercitation nostrud quis.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Commodo do aute minim qui id irure irure. Magna ipsum eiusmod adipisicing deserunt labore consequat eiusmod id commodo veniam qui. Eu eu do ad in id proident consequat. In deserunt aliqua anim Lorem Lorem. Reprehenderit officia aliqua reprehenderit cillum Lorem commodo dolor pariatur eiusmod voluptate adipisicing culpa. Amet consectetur occaecat velit ipsum velit do exercitation nostrud quis.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
