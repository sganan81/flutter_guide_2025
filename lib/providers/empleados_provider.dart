import 'dart:convert' as converter;

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_guide_2025/models/empleado_model.dart';
import 'package:flutter_guide_2025/models/lista_empleados_models.dart';
import 'package:http/http.dart' as http;

class EmpleadosProvider extends ChangeNotifier {
  List<Empleado> listEmpleado = [];
  int currentPage = 1;
  bool isLoading = false;
  String url_api = dotenv.env['URL_API'] ?? 'localhost:3000';

  EmpleadosProvider() {
    print('EmpleadosProvider...');
    this.getEmpleado(20);
  }

  getEmpleado([int limit = 10]) async {
    try {
      isLoading = true;
      //TODO: Reemplazar localhost por una variable de entorno
      final url = Uri.http(url_api, '/api/v1/empleados', {
        'page': '$currentPage',
        'limit': '$limit',
      });
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('ok...');
        /* this.listEmpleado = converter.jsonDecode(response.body)['data']; */
        this.listEmpleado = listaEmpleadosFromJson(response.body).data;
      } else {
        print('error...: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al realizar la el request: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  getEmpleadoProd([int limit = 10]) async {
    try {
      isLoading = true;
      /* Utilizamos el método https para el dominio productivo */
      final url = Uri.https(
        '66c78f59732bf1b79fa6e8c7.mockapi.io',
        '/api/v1/empleados',
        {'page': '$currentPage', 'limit': '$limit'},
      );
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('ok...');
        this.listEmpleado = listaEmpleadosFromJson(response.body).data;
      } else {
        print('error...: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al realizar el request: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Empleado?> getEmpleadoById(String id) async {
    try {
      isLoading = true;
      final url = Uri.http(url_api, '/api/v1/empleados/$id');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('Id Empleado $id ok ...');
        final json = converter.jsonDecode(response.body);
        return Empleado.fromJson(json['data']);
      } else {
        throw Exception('Error al realizar el request');
      }
    } catch (e) {
      print('getEmpleadoById - Error al realizar el request: $e');
    } finally {
      isLoading = false;
    }
  }
}
