import 'dart:developer';
import 'package:flutter_guide_2025/mocks/people_mock.dart' show elements;
import 'package:flutter/material.dart';

class CustomListScreen extends StatelessWidget {
  CustomListScreen({super.key});

  List _auxiliarElements = elements;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        body: listItemsArea(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Puede utilizar el pop para volver a la pantalla anterior
            // Navigator.of(context).pop()
            Navigator.of(context).pushReplacementNamed('home');
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
    );
  }

  ListView listItemsArea() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: _auxiliarElements.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            //TODO: Agregar Email y Teléfono
            Navigator.pushNamed(
              context,
              'item',
              arguments: <String, dynamic>{
                'avatar': elements[index][0],
                'name': elements[index][1],
                'cargo': elements[index][2],
                'stars': elements[index][3],
                'favorite': elements[index][4],
              },
            );
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onLongPress: () {
            log('onLongPress $index');
          },
          child: Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(74, 136, 165, 185),
                  blurRadius: 0,
                  spreadRadius: 3,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/avatars/${_auxiliarElements[index][0]}.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _auxiliarElements[index][1],
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(_auxiliarElements[index][2]),
                    ],
                  ),
                ),
                Icon(
                  _auxiliarElements[index][4]
                      ? Icons.star
                      : Icons.star_border_outlined,
                ),
                Text(_auxiliarElements[index][3].toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
