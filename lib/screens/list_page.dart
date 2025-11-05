import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/screens/card_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Page'), backgroundColor: Colors.amber),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return CardPage(
            url:
                'https://images.unsplash.com/photo-1444927714506-8492d94b4e3d?q=80&w=1476&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            title: 'Título de prubea',
            body: 'Cuerpo de prueba',
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: 10,
      ),
    );
  }
}
