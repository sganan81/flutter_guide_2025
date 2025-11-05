import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/widgets/card_screen.dart';

class ListViewCardScreen extends StatelessWidget {
  const ListViewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cards'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          //CAmbiar a .separated para utilizar el separatorBuilder
          itemCount: 50,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            print(index);
            return CustomCardWidget(
              imageUrl:
                  'https://images.unsplash.com/photo-1444927714506-8492d94b4e3d?q=80&w=1476&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              title:
                  'Mollit amet amet nostrud non cillum do et occaecat. Commodo nulla Lorem veniam officia nisi nulla culpa incididunt officia eiusmod. Dolore sunt ex ea non. Amet eu deserunt qui sunt amet Lorem reprehenderit proident laborum enim consequat. Laboris commodo laboris velit aute duis ad nostrud.',
              body:
                  'In duis irure irure ut non velit enim id ad laborum veniam nostrud. Amet sunt deserunt mollit exercitation velit id velit Lorem. Ipsum elit quis nostrud quis tempor consectetur sunt et sint. Id nulla proident aliqua eiusmod nulla minim laboris.',
            );
          },
        ),
      ),
    );
  }
}
