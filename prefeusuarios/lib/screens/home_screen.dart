import 'package:flutter/material.dart';
import 'package:prefeusuarios/screens/settings_screen.dart';
import 'package:prefeusuarios/shared_prefs/user_preferences.dart';
import 'package:prefeusuarios/widget/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  void initState() {
    prefs.lastPage = HomeScreen.routeName;
    print(prefs.lastPage);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      body: Column(
        children: [
          Text("Color secundario: ${prefs.colorSecundario}"),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text("Nombre usuario: ${prefs.nombre}"),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      drawer: DrawerMenu(),
    );
  }
}
