import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? body;

  const CustomCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      child: Card(
        shadowColor: Colors.greenAccent,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            FadeInImage(
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(this.imageUrl),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                this.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            if (this.body != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  this.body ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: Text('Tag')),
                SizedBox(width: 20),
                FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      'design',
                      arguments: {
                        'title': this.title,
                        'imageUrl': this.imageUrl,
                        'body': this.body,
                      },
                    );
                  },
                  child: Text('+ Info'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
