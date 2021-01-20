import 'package:flutter/material.dart';

enum SingingCharacter { masculino, femenino }

class RadioWidget extends StatefulWidget {
  RadioWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<RadioWidget> {
  SingingCharacter _character = SingingCharacter.masculino;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Masculino'),
          leading: Radio(
            value: SingingCharacter.masculino,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Femenino'),
          leading: Radio(
            value: SingingCharacter.femenino,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
