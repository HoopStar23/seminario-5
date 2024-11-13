import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal(); 

  factory UserPreferences(){
    return _instance;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs()async{
    this._prefs = await SharedPreferences.getInstance();
  }

  String get lastPage{
    return _prefs.getString('lastPage') ?? '';
  }

  set lastPage(String value){
    _prefs.setString('lastPage', value);
  }

  int get genero{
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }

  bool get colorSecundario { 
    // Si no existe el colorSecundario, devolverá un false 
    return _prefs.getBool('colorSecundario') ?? false; 
  } 
 
  set colorSecundario(bool value) { 
    _prefs.setBool('colorSecundario', value); 
  } 
 
  String get nombre { 
    // Si no existe el nombreUsuario, devolverá una cadena vacía 
    return _prefs.getString('nombre') ?? ''; 
  } 
 
  set nombre(String value) { 
    _prefs.setString('nombre', value); 
  } 
}