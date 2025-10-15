import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/screens/design_screen.dart';
import 'package:flutter_guide_2025/screens/flexbox_screen.dart';
import 'package:flutter_guide_2025/screens/material_screen.dart';
import 'package:flutter_guide_2025/screens/animated_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primera APP',
      home: AnimatedContainerScreen(),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
