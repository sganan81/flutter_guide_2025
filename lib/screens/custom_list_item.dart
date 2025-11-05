import 'package:flutter/material.dart';

class ListItemScreen extends StatelessWidget {
  const ListItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    print('args $args');

    /*  print(size); */
    return Scaffold(
      appBar: AppBar(title: Text('List Item Screen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListItemHeader(size: size, args: args),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListItemBody(args: args),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemBody extends StatefulWidget {
  final Map<String, dynamic> args;
  const ListItemBody({super.key, required this.args});

  @override
  State<ListItemBody> createState() => _ListItemBodyState();
}

class _ListItemBodyState extends State<ListItemBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: widget.args['name'],
          decoration: InputDecoration(labelText: 'Nombre Completo'),
          onChanged: (value) {
            print(value);
          },
          style: TextStyle(fontSize: 18),
        ),
        TextFormField(
          initialValue: '', //TODO: Setear el email
          keyboardType: TextInputType.emailAddress,
          decoration: decorationInput(
            helperText: 'name@domain.com',
            prefixIcon: Icon(Icons.email),
          ),
          onChanged: (value) {
            print(value);
          },
          style: TextStyle(fontSize: 18),
        ),
        TextFormField(
          initialValue: '', //TODO: Setear el email
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'Teléfono',
            hintText: '(291)-4123123',
            prefixIcon: Icon(Icons.phone),
          ),
          onChanged: (value) {
            print(value);
          },
          style: TextStyle(fontSize: 18),
        ),
        SwitchListTile.adaptive(
          title: const Text('Favorito'),
          value: widget.args['favorite'] ?? false,
          onChanged: (bool value) {
            setState(() {
              widget.args['favorite'] = !widget.args['favorite'];
              print(value);
            });
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= widget.args['stars']; i++)
              Icon(Icons.star, color: Colors.yellow, size: 35),
          ],
        ),
      ],
    );
  }

  InputDecoration decorationInput({
    String? labelText,
    Color? fillColor,
    String? hintText,
    String? helperText,
    Icon? prefixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      fillColor: fillColor,
      hintText: hintText,
      helperText: helperText,
      helperStyle: TextStyle(fontSize: 12),
      prefixIcon: prefixIcon,
    );
  }
}

class ListItemHeader extends StatelessWidget {
  final Size size;
  final Map<String, dynamic> args;

  const ListItemHeader({super.key, required this.size, required this.args});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      color: Colors.blueAccent,
      child: Center(
        child: CircleAvatar(
          radius: 95,
          child: Image.asset('assets/avatars/${args['avatar']}.png'),
        ),
      ),
    );
  }
}
