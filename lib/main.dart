import 'package:flutter/material.dart';
import 'package:flutter_guide_2025/helpers/preferences.dart';
import 'package:flutter_guide_2025/providers/empleados_provider.dart';
import 'package:flutter_guide_2025/providers/theme_provider.dart';
import 'package:flutter_guide_2025/screens/screens.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_guide_2025/themes/default_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Preferences.initShared();
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.darkmode),
        ),
        ChangeNotifierProvider(create: (_) => EmpleadosProvider(), lazy: false),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<ThemeProvider>(context, listen: true);

    return MaterialApp(
      title: 'Mi primera APP',
      theme: tema.temaActual,
      routes: {
        'home': (BuildContext context) => HomePage(),
        'design': (BuildContext context) => DesignScreen(),
        'counter': (BuildContext context) => CounterScreen(),
        'flexbox': (BuildContext context) => FlexboxScreen(),
        'animated': (BuildContext context) => AnimatedContainerScreen(),
        'material': (BuildContext context) => MaterialScreen(),
        'listview': (BuildContext context) => ListViewBuilderScreen(),
        'custom_list': (BuildContext context) => CustomListScreen(),
        'lista_empleados': (BuildContext context) => ListaEmpleadosScreen(),
        'detalle_empleado': (BuildContext context) => EmpleadoScreen(),
        'listview_cards': (BuildContext context) => ListViewCardScreen(),
        'bottom_navigation': (BuildContext context) => BottomNavigationScreen(),
        'bottom_navigation_provider': (BuildContext context) =>
            BottomNavigationProviderScreen(),
        'alert': (BuildContext context) => AlertScreen(),
        'item': (BuildContext context) => ListItemScreen(),
        'profile': (BuildContext context) => ProfileScreen(),
      },
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
    );
  }
}
