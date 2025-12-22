import 'dart:convert' as converter;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_guide_2025/models/empleado_model.dart';
import 'package:flutter_guide_2025/models/lista_empleados_models.dart';
import 'package:http/http.dart' as http;

List<Empleado> listaEmpleados = [];
String url_api = dotenv.env['URL_API'] ?? 'localhost:3000';

Future<Empleado?> getEmpleadoById(String id) async {
  try {
    final url = Uri.http(url_api, '/api/v1/empleados/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('Id Empleado $id ok ...');
      final json = converter.jsonDecode(response.body);
      return Empleado.fromJson(json['data']);
    } else {
      throw Exception('Error al realizar el request ${response.statusCode}');
    }
  } catch (e) {
    print('getEmpleadoById - Error al realizar el request: $e');
    throw Exception('Error al realizar el request: $e');
  }
}

Future<List<Empleado>> getListaEmpleados([
  int currentPage = 1,
  int limit = 20,
]) async {
  try {
    final url = Uri.http(url_api, '/api/v1/empleados', {
      'page': '$currentPage',
      'limit': '$limit',
    });
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('Lista Empleados ok ...');
      listaEmpleados = listaEmpleadosFromJson(response.body).data;
      return listaEmpleados;
    } else {
      throw Exception('Error al realizar el request ${response.statusCode}');
    }
  } catch (e) {
    print('getEmpleados - Error al realizar el request: $e');
    throw Exception('Error al realizar el request: $e');
  }
}
