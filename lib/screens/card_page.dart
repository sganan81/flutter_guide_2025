import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final String url;
  final String title;
  final String? body;

  const CardPage({
    super.key,
    required this.url,
    required this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueAccent,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(this.url),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              this.title,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              this.body ?? '',
              style: TextStyle(fontSize: 12),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  print('click');
                },
                child: Text('Cancelar', style: TextStyle(fontSize: 12)),
              ),
              ElevatedButton(
                onPressed: () {
                  print('click');
                },
                child: Text('Aceptar', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
