import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:software1/src/widgets/general.dart';
import 'package:software1/src/widgets/swiper.dart';
import 'package:software1/src/session/session.dart';

import 'package:software1/src/services/loginServices.dart';
import 'package:software1/src/theme/colors.dart';

import 'package:software1/src/widgets/loadingDialog.dart';
import 'package:http/http.dart' as http;
import 'package:software1/qr_scanner.dart';

class AlbumScreen extends StatefulWidget {
  @override
  AlbumScreenState createState() {
    return AlbumScreenState();
  }
}

class AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    var container = Container(
      child: Column(
        children: <Widget>[
          _swiperFotos(context)
        ], //<--------------- agregue boton
      ),
    );
    return Scaffold(
      appBar: barGeneral(context, 'Fotos elegidas para ti'),
      body: container,
    );
  }

  Widget _swiperFotos(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return CardSwiper(fotos: Session.shared.album);
      },
    );
    /*print(Session.shared.album);
    return CardSwiper(fotos: Session.shared.album);*/
  }

  Widget botonIngresar(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () {},
        color: actionColor(),
        disabledColor: actionColor(),
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "Carrito",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  login(String email, String pass) async {
    http.Response response = await loginRequest(email, pass);
    setState(() {
      responseLogin = response;
    });
  }

  String email = "";
  String pass = "";
  http.Response responseLogin;
}
