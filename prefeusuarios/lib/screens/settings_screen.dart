import 'package:flutter/material.dart';
import 'package:prefeusuarios/shared_prefs/user_preferences.dart';
import 'package:prefeusuarios/widget/drawer_menu.dart';

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
    _loadPreferences();
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
  }

  Future<void> _loadPreferences() async {
    _genero = int.tryParse(await prefs.getGenero() ?? '1') ?? 1;
    _colorSecundario = (await prefs.getColorSecundario()) == 'true';
    _nombre = await prefs.getNombre() ?? '';

    await prefs.setLastPage(SettingsScreen.routeName);

    print(prefs.getLastPage());

    _textController = TextEditingController(text: _nombre);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: _colorSecundario ? Colors.teal : Colors.blue,
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
                onChanged: (value) async {
                  setState(() {
                    _colorSecundario = value;
                  });
                  await prefs.setColorSecundario(value.toString());
                }),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: (value) async {
                  setState(() {
                    _genero = value!;
                  });
                  await prefs.setGenero(value.toString());
                }),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: (value) async {
                  setState(() {
                    _genero = value!;
                  });
                  await prefs.setGenero(value.toString());
                }),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el telefono'),
                onChanged: (value) async {
                  setState(() {
                    _nombre = value;
                  });
                  await prefs.setNombre(value);
                },
              ),
            )
          ],
        ));
  }
}
