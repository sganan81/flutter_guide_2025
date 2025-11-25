// To parse this JSON data, do
//
//     final listaEmpleados = listaEmpleadosFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_guide_2025/models/empleado_model.dart';

ListaEmpleados listaEmpleadosFromJson(String str) =>
    ListaEmpleados.fromJson(json.decode(str));

class ListaEmpleados {
  String msg;
  int code;
  List<Empleado> data;

  ListaEmpleados({required this.msg, required this.code, required this.data});

  factory ListaEmpleados.fromJson(Map<String, dynamic> json) => ListaEmpleados(
    msg: json["msg"],
    code: json["code"],
    data: List<Empleado>.from(json["data"].map((x) => Empleado.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "code": code,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
