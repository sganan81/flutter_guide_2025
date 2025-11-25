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
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final empleado_future = Provider.of<EmpleadosProvider>(context);

    /*  print(size); */
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: FutureBuilder(
        future: empleado_future.getEmpleadoById(args['id']),
        builder: (context, AsyncSnapshot<Empleado?> snapshot) {
          if (snapshot.hasData) {
            final Empleado empleado = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  ProfileHeaderEmpleado(size: size),
                  ProfileBodyEmpleado(empleado: empleado),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ProfileBodyEmpleado extends StatefulWidget {
  final Empleado empleado;
  const ProfileBodyEmpleado({super.key, required this.empleado});

  @override
  State<ProfileBodyEmpleado> createState() => _ProfileBodyEmpleadoState();
}

class _ProfileBodyEmpleadoState extends State<ProfileBodyEmpleado> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue:
              '${widget.empleado.firstname} ${widget.empleado.lastname}',
          decoration: InputDecoration(labelText: 'Nombre Completo'),
          onChanged: (value) {
            Preferences.name = value;
          },
          style: TextStyle(fontSize: 18),
        ),
        TextFormField(
          initialValue: widget.empleado.email, //TODO: Setear el email
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
          initialValue: widget.empleado.company, //TODO: Setear el email
          decoration: InputDecoration(
            labelText: 'Company',
            hintText: '',
            prefixIcon: Icon(Icons.home_work),
          ),
          onChanged: (value) {
            print(value);
          },
          style: TextStyle(fontSize: 18),
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
