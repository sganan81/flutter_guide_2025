import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/models/empleado_model.dart';
import 'package:flutter_guide_2025/providers/empleados_provider.dart';
import 'package:provider/provider.dart';

class ListaEmpleadosScreen extends StatelessWidget {
  const ListaEmpleadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Empleado> lista = Provider.of<EmpleadosProvider>(
      context,
      listen: true,
    ).listEmpleado;

    return Scaffold(
      appBar: AppBar(title: Text('Lita de empleados')),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: lista.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 5),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              'detalle_empleado',
              arguments: <String, dynamic>{'id': lista[index].id},
            ),
            child: ListTile(
              leading: Icon(Icons.check_box),
              title: Text('${lista[index].firstname} ${lista[index].lastname}'),
              subtitle: Text(lista[index].email),
            ),
          );
        },
      ),
    );
  }
}
