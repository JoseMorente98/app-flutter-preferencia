import 'package:app_flutter_preferencias/src/shared/user_preference.dart';
import 'package:app_flutter_preferencias/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secundario;
  int _genero;
  String _nombre;
  final prefs = new UserPreference();


  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    //cargarPreferencia();
    _genero = prefs.genero;
    _secundario = prefs.colorSecundario;
    _nombre = prefs.nombreUsuario;
    prefs.ultimaPagina = SettingsPage.routeName;
    _textEditingController = new TextEditingController(
      text: _nombre
    );
  }

  /*cargarPreferencia() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('currentGenero');
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue

      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: true,
            title: Text('Color Secundario'),
            onChanged: (value){
              setState(() {
                _secundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          //___________________________RADIOS_________________________
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de Persona',
                icon: Icon(Icons.person_add),
              ),
              onChanged: (value){
                prefs.nombreUsuario= value;
              },
            ),
          )
        ],
      )
    );
  }

  void _setSelectedRadio(int value) {
    prefs.genero = value;
    _genero = value;
    setState(() {
    });
  }
}