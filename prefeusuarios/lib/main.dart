import 'package:flutter/material.dart';
import 'package:prefeusuarios/screens/home_screen.dart';
import 'package:prefeusuarios/screens/settings_screen.dart';
import 'package:prefeusuarios/shared_prefs/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  String? lastPage = await prefs.getLastPage();
  runApp(MyApp(lastPage: lastPage ?? HomeScreen.routeName));
}

class MyApp extends StatelessWidget {
  final String lastPage;
  const MyApp({super.key, required this.lastPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: lastPage,
      routes: {
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        SettingsScreen.routeName: (BuildContext context) => SettingsScreen()
      },
    );
  }
}
