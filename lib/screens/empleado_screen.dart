import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/helpers/preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_guide_2025/models/empleado_model.dart';
import 'package:flutter_guide_2025/providers/empleados_provider.dart';
import 'package:flutter_guide_2025/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class EmpleadoScreen extends StatelessWidget {
  const EmpleadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = '123';
    print(id);
    final empleado_provider = Provider.of<EmpleadosProvider>(context);

    /*  print(size); */
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: FutureBuilder(
        future: empleado_provider.getEmpleadoById(id),
        builder: (context, AsyncSnapshot<Empleado?> snapshot) {
          final emp = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return DibujarBodyScaffold(size, emp);
          }
        },
      ),
    );
  }

  SingleChildScrollView DibujarBodyScaffold(Size size, Empleado? emp) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeaderEmpleado(size: size),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileBodyEmpleado(empleado: emp),
          ),
        ],
      ),
    );
  }
}

class ProfileBodyEmpleado extends StatelessWidget {
  Empleado? empleado;
  ProfileBodyEmpleado({super.key, this.empleado});

  @override
  Widget build(BuildContext context) {
    print(empleado);
    return Column(
      children: [
        TextFormField(
          initialValue:
              '${empleado?.firstname ?? ''} ${empleado?.firstname ?? ''}',
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
          onChanged: (bool value) {},
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

class ProfileHeaderEmpleado extends StatelessWidget {
  final Size size;

  const ProfileHeaderEmpleado({super.key, required this.size});

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
