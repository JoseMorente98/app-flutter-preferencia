import 'package:app_flutter_preferencias/src/pages/home_page.dart';
import 'package:app_flutter_preferencias/src/pages/settings_page.dart';
import 'package:app_flutter_preferencias/src/shared/user_preference.dart';
import 'package:flutter/material.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreference();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final prefs = new UserPreference();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingsPage.routeName: (context) => SettingsPage(),
      },
    );
  }
}