import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  final FlutterSecureStorage storage = FlutterSecureStorage();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  Future<void> setNombre(String value) async {
    await storage.write(key: 'nombre', value: value);
  }

  Future<String?> getNombre() async {
    return await storage.read(key: 'nombre');
  }

  Future<void> setColorSecundario(String value) async {
    await storage.write(key: 'colorSecundario', value: value);
  }

  Future<String?> getColorSecundario() async {
    return await storage.read(key: 'colorSecundario');
  }

  Future<void> setGenero(String value) async {
    await storage.write(key: 'genero', value: value);
  }

  Future<String?> getGenero() async {
    return await storage.read(key: 'genero');
  }

  Future<void> setLastPage(String value) async {
    await storage.write(key: 'lastPage', value: value);
  }

  Future<String?> getLastPage() async {
    return await storage.read(key: 'lastPage');
  }
}
