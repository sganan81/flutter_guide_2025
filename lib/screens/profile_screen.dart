import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/helpers/preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_guide_2025/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    /*  print(size); */
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(size: size),
            Padding(padding: const EdgeInsets.all(8.0), child: ProfileBody()),
          ],
        ),
      ),
    );
  }
}

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<ThemeProvider>(context, listen: false);
    return Column(
      children: [
        TextFormField(
          initialValue: Preferences.name,
          decoration: InputDecoration(labelText: 'Nombre Completo'),
          onChanged: (value) {
            Preferences.name = value;
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
          title: const Text('Dark Mode'),
          value: Preferences.darkmode,
          onChanged: (bool value) {
            setState(() {
              print('Darkmode $value');
              Preferences.darkmode = value;
              value ? tema.setDark() : tema.setLight();
            });
          },
        ),
        SizedBox(height: 20),
        Text(dotenv.env['VERSION'] ?? '', style: TextStyle(fontSize: 18)),
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

class ProfileHeader extends StatelessWidget {
  final Size size;

  const ProfileHeader({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      color: Colors.blueAccent,
      child: Center(
        child: CircleAvatar(
          radius: 95,
          child: Image.asset('assets/images/avatar.png'),
        ),
      ),
    );
  }
}
