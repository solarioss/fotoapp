import 'package:flutter/material.dart';
import 'package:software1/album.dart';
import 'package:software1/src/UI/customInputField2.dart';
import 'package:software1/src/theme/colors.dart';

import '../../carrito.dart';

Widget imagen(String location, double width, double height) {
  return Image.asset(
    location,
    alignment: Alignment.center,
    height: width,
    width: height,
  );
}

/*Widget input(IconData icon, String text, TextEditingController controller,
    bool obscure) {
  return CustomInputField(
      Icon(
        icon,
        color: Colors.white,
      ),
      text,
      controller,
      obscure);
}*/

Widget input(IconData icon, String text, TextEditingController controller,
    bool obscure) {
  return CustomInputField(
      Icon(
        icon,
        color: Colors.white,
      ),
      text,
      controller,
      obscure);
}

Widget inputForm(BuildContext context, TextEditingController controller,
    String label, double size, bool obscure) {
  return TextFormField(
    obscureText: obscure,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      labelText: ' ' + label,
      contentPadding: new EdgeInsets.symmetric(vertical: size),
    ),
    controller: controller,
    keyboardType: TextInputType.text,
    validator: (value) {
      if (value.isEmpty) {
        return label + ' es un campo requerido';
      }
      return null;
    },
  );
}

Widget espacio(double size) {
  return SizedBox(
    height: size,
  );
}

Widget textoH1(String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ],
  );
}

Widget botonGeneralRedirect(
    BuildContext context, String text, Widget route, Color color) {
  return Container(
    width: 300,
    height: 60,
    child: RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      },
      color: color,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0),
      ),
    ),
  );
}

Widget botonGeneralBack(BuildContext context, String text, Color color) {
  return Container(
    width: 300,
    height: 60,
    child: RaisedButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
      color: color,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0),
      ),
    ),
  );
}

AppBar barGeneral(BuildContext context, String titulo) {
  return AppBar(
      title: Text(titulo),
      leading: IconButton(
        icon: const Icon(Icons.house_outlined),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumScreen(),
            ),
          );
        },
      ),
      backgroundColor: appBar(),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          tooltip: 'Show Snackbar',
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Carrito(),
              ),
            );
          },
        ),
      ]);
}

/*
Widget build(BuildContext context) {
  return Column(
    children: <Widget>[
      ListTile(
        title: const Text('Lafayette'),
        leading: Radio(
          value: SingingCharacter.lafayette,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ),
      ListTile(
        title: const Text('Thomas Jefferson'),
        leading: Radio(
          value: SingingCharacter.jefferson,
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
*/
