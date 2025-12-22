import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/helpers/empleados_service.dart';
import 'package:flutter_guide_2025/models/empleado_model.dart';

class ListaFutureScreen extends StatefulWidget {
  const ListaFutureScreen({super.key});

  @override
  State<ListaFutureScreen> createState() => _ListaFutureScreenState();
}

class _ListaFutureScreenState extends State<ListaFutureScreen> {
  late Future<List<Empleado>?> lista_registros;
  bool isLoading = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    lista_registros = getListaEmpleados(page);
    isLoading = false;
    page++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personas - Page ${page - 1}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              page = 1;
              fetchData();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Empleado>?>(
        future: lista_registros,
        builder:
            (BuildContext context, AsyncSnapshot<List<Empleado>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Stack(
                  children: [
                    if (isLoading) Center(child: CircularProgressIndicator()),
                    DibujarListaRegistros(snapshot.data),
                  ],
                );
              }
            },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }

  ListView DibujarListaRegistros(List<Empleado>? lista) {
    return ListView.builder(
      itemCount: lista?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                '${lista?[index].firstname} ${lista?[index].lastname}',
              ),
              subtitle: Text('${lista?[index].email}'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(color: const Color.fromARGB(159, 78, 67, 67), height: 1),
          ],
        );
      },
    );
  }
}
