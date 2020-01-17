import 'package:app_flutter_preferencias/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserPreference {
  static final UserPreference _instancia = new UserPreference._internal();

  factory UserPreference() {
    return _instancia;
  }

  UserPreference._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //Ninguna de estas se usa
  /*bool _colorSecundario;
  int _genero;
  String _nombre;*/

  //GET & SET'S
  get genero {
    return _prefs.getInt('currentGenero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('currentGenero', value);
  }

  get colorSecundario {
    return _prefs.getBool('currentColor') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('currentColor', value);
  }

  get nombre {
    return _prefs.getString('currentNombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('currentNombre', value);
  }

  get ultimaPagina {
    return _prefs.getString('currentPage') ?? HomePage.routeName;
  }

  set ultimaPagina(String value) {
    _prefs.setString('currentPage', value);
  }

}