import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi primera APP',
      theme: ThemeData.light(),
      routes: {
        'home': (BuildContext context) => HomePage(),
        'design': (BuildContext context) => DesignScreen(),
        'flexbox': (BuildContext context) => FlexboxScreen(),
        'animated': (BuildContext context) => AnimatedContainerScreen(),
        'material': (BuildContext context) => MaterialScreen(),
      },
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
    );
  }
}
