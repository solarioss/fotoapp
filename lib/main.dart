import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:software1/album.dart';
import 'package:software1/login.dart';
import 'package:software1/qr_scanner.dart';
import 'package:software1/src/theme/colors.dart';

import 'cargarFotos.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('es'),
    ],
    debugShowCheckedModeBanner: false,
    home: MyApp(), //AlbumScreen(), //
  ));
}

//clase que vendria siendo el home//

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //TODA ESTA CLASE Y WIDGETS SON PARTE DEL SPLASH SCREEN

  @override //este init state da inicio a los segundos que tardara el splash o durara
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      //if (existeArchivo...)

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            //este navigator es para la ruta//
            builder: (context) => QRScanner()), //LoginScreen()), // //
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor(),
      body: Center(
          //child: Image.asset("assets/quokalogo.png", alignment: Alignment.center, height: 300, width: 300,),
          ),
    );
  }
} //HASTA ACA ES ESTA EL ESPLASH SCREEN//
