import 'package:flutter/material.dart';
import 'package:prefeusuarios/shared_prefs/user_preferences.dart';
import 'package:prefeusuarios/widget/drawer_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = "";
  final prefs = new UserPreferences();

  TextEditingController? _textController = null;

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    prefs.lastPage = SettingsScreen.routeName;
    _textController = new TextEditingController(text: _nombre);
    print(prefs.lastPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: DrawerMenu(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text('Settings',
                  style:
                      TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color secundario'),
                onChanged: (value) {
                  setState(() {
                    _colorSecundario = value;
                  prefs.colorSecundario = value;
                  });                  
                }),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: (value) {
                  setState(() {
                    _genero = value!;
                  prefs.genero = value!;
                  });                  
                }),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: (value) {
                  setState(() {
                    _genero = value!;
                  prefs.genero = value!;
                  });                  
                }),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el telefono'),
                onChanged: (value) {
                  setState(() {
                    _nombre = value;
                  prefs.nombre = value;
                  });
                },
              ),
            )
          ],
        ));
  }
}
