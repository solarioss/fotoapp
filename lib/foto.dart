import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software1/src/session/Datos.dart';
import 'package:software1/src/session/session.dart';
import 'package:software1/src/theme/colors.dart';
import 'package:software1/src/theme/strings.dart';
import 'package:software1/src/widgets/general.dart';

class FotoIndividual extends StatefulWidget {
  FotoIndividual({Key key}) : super(key: key);

  @override
  _FotoIndividualState createState() => _FotoIndividualState();
}

class _FotoIndividualState extends State<FotoIndividual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barGeneral(context, 'Compra tu foto favorita'),
      body: Column(
        children: <Widget>[
          imagen(Session.shared.album.fotos[Datos.shared.seleccion].url),
          espacio(40),
          contiene(context),
          espacio(20),
          contiene2(context),
        ],
      ),
    );
  }

  Widget imagen(String url) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      margin: EdgeInsets.all(8.0),
      child: Stack(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(
              host() +
                  'public/' +
                  Session.shared.album.fotos[Datos.shared.seleccion].url,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 400),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Image.network(
              "https://www.appskou.com/wp-content/uploads/2019/12/landmark1.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 400),
        ),
      ]),
    );
  }

  Widget contiene(BuildContext context) {
    print(Datos.shared.carrito);
    if (Datos.shared.carrito == null) {
      return boton(context);
    }
    if (Datos.shared.carrito.contains(Datos.shared.seleccion)) {
      return enCarrito(context);
    } else {
      return boton(context);
    }
  }

  Widget contiene2(BuildContext context) {
    if (Datos.shared.carrito.contains(Datos.shared.seleccion)) {
      return borrarCarrito(context);
    } else {
      return espacio(10);
    }
  }

  void ingresarCarrito() {
    Datos.setCarrito(Datos.shared.seleccion);
    setState(() {});
  }

  void borrarElemento() {
    Datos.shared.carrito.remove(Datos.shared.seleccion);
    setState(() {});
  }

  Widget boton(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () {
          ingresarCarrito();
        },
        color: actionColor(),
        disabledColor: actionColor(),
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "Añadir al carrito",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget enCarrito(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () {},
        color: Colors.blueGrey[300],
        disabledColor: actionColor(),
        disabledTextColor: Colors.white,
        textColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "Esta foto ya ha sido añadida",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget borrarCarrito(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
          onPressed: () {
            borrarElemento();
          },
          color: Colors.red,
          disabledColor: actionColor(),
          disabledTextColor: Colors.white,
          textColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Icon(Icons.delete_outline)),
    );
  }
} //widget[ NetworkImage(host() + 'public/' + Session.shared.album.fotos[Datos.shared.seleccion].url)]
