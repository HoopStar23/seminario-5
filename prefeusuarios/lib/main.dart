import 'package:flutter/material.dart';
import 'package:prefeusuarios/routes.dart';
import 'package:prefeusuarios/screens/home_screen.dart';
import 'package:prefeusuarios/screens/settings_screen.dart';
import 'package:prefeusuarios/shared_prefs/user_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (BuildContext context) => HomeScreen(),
       SettingsScreen.routeName: (BuildContext context) => SettingsScreen()},
    );
  }
}