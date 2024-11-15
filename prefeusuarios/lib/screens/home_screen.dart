import 'package:flutter/material.dart';
import 'package:prefeusuarios/shared_prefs/user_preferences.dart';
import 'package:prefeusuarios/widget/drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final prefs = UserPreferences();

  bool _colorSecundario = false;
  String _genero = '1';
  String _nombre = '';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _colorSecundario = (await prefs.getColorSecundario()) == 'true';
    _genero = await prefs.getGenero() ?? '1';
    _nombre = await prefs.getNombre() ?? '';

    await prefs.setLastPage(HomeScreen.routeName);

    print(prefs.getLastPage());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: _colorSecundario ? Colors.teal : Colors.blue,
      ),
      body: Column(
        children: [
          Text(
              "Color secundario: ${_colorSecundario ? 'Activado' : 'Desactivado'}"),
          Divider(),
          Text('Género: ${_genero == '1' ? 'Masculino' : 'Femenino'}'),
          Divider(),
          Text("Nombre usuario: $_nombre"),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      drawer: DrawerMenu(),
    );
  }
}
