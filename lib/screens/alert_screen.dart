import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('tap kIsWeb:${kIsWeb}');
            if (kIsWeb) {
              alertaWeb(context);
              //alertaIOS(context);
            } else if (Platform.isAndroid) {
              alertaWeb(context);
            } else if (Platform.isIOS) {
              alertaIOS(context);
            } else {
              alertaAndroid(context);
            }
          },
          child: Text('Mostrar Alerta'),
        ),
      ),
    );
  }

  alertaAndroid(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta Android'),
          content: Text('Contenido de la alerta'),
        );
      },
    );
  }

  alertaWeb(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta Web'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Contenido de la alerta'),
              SizedBox(height: 20),
              FlutterLogo(size: 50),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  alertaIOS(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Alerta IOS'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Contenido de la alerta'),
              SizedBox(height: 20),
              FlutterLogo(size: 50),
              SizedBox(height: 20),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Aceptar'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
