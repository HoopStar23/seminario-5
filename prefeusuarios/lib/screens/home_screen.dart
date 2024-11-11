import 'package:flutter/material.dart';
import 'package:prefeusuarios/screens/settings_screen.dart';
import 'package:prefeusuarios/widget/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),
      body: Column(
        children: [
          Text("Color secundario"),
          Divider(),
          Text("Género"),
          Divider(),
          Text("Nombre usuario"),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      drawer: DrawerMenu(),
    );
  }
}