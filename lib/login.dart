import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:software1/qr_scanner.dart';
import 'package:software1/signup.dart';
import 'package:software1/src/services/loginServices.dart';
import 'package:software1/src/theme/colors.dart';
import 'package:software1/src/widgets/general.dart';
import 'package:software1/src/widgets/loadingDialog.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  String email = "";
  String pass = "";
  http.Response responseLogin;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerEmail.addListener(() {
      email = controllerEmail.text;
    });
    controllerPass.addListener(() {
      pass = controllerPass.text;
    });
    return Scafold(context);
  }

  Widget Scafold(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor(),
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: todo(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget todo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: mainColor(),
      padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          /*imagen("assets/logo.png", 300, 300),*/
          input(Icons.account_circle, 'Correo', controllerEmail, false),
          SizedBox(height: 20.0),
          input(Icons.lock, 'Password', controllerPass, true),
          SizedBox(height: 20.0),
          botonIngresar(context),
          SizedBox(height: 20.0),
          botonRegistro(context),
        ],
      ),
    );
  }

  login(String email, String pass) async {
    http.Response response = await loginRequest(email, pass);
    setState(() {
      responseLogin = response;
    });
  }

  Widget botonIngresar(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () async {
          loadingDialog(context);
          await login(email, pass);
          popDialog(context);
          (responseLogin.statusCode == 200)
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRScanner(),
                  ),
                )
              : errorDialog(context, responseLogin);
        },
        color: actionColor(),
        disabledColor: actionColor(),
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "LOGIN",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget botonRegistro(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUp(),
            ),
          );
        },
        color: seccondaryColor(),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "REGISTRARSE",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
