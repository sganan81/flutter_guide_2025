import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/helpers/preferences.dart';
import 'package:flutter_guide_2025/screens/screens.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  await Preferences.initShared();
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
        'counter': (BuildContext context) => CounterScreen(),
        'flexbox': (BuildContext context) => FlexboxScreen(),
        'animated': (BuildContext context) => AnimatedContainerScreen(),
        'material': (BuildContext context) => MaterialScreen(),
        'listview': (BuildContext context) => ListViewBuilderScreen(),
        'custom_list': (BuildContext context) => CustomListScreen(),
        'listview_cards': (BuildContext context) => ListViewCardScreen(),
        'bottom_navigation': (BuildContext context) => BottomNavigationScreen(),
        'alert': (BuildContext context) => AlertScreen(),
        'item': (BuildContext context) => ListItemScreen(),
        'profile': (BuildContext context) => ProfileScreen(),
      },
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
    );
  }
}
