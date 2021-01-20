import 'package:flutter/material.dart';
import 'package:software1/cargarFotos.dart';
import 'package:software1/login.dart';
import 'package:software1/src/services/signupServices.dart';
import 'package:software1/src/theme/colors.dart';
import 'package:http/http.dart' as http;
import 'package:software1/src/widgets/general.dart';
import 'package:software1/src/widgets/loadingDialog.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final controllerNombre = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerConfirmPassword = TextEditingController();
  final controllerEdad = TextEditingController();
  final controllerSexo = TextEditingController();
  String nombre = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String edad = "";
  String sexo = "1";
  http.Response responseLogin;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerNombre.addListener(() {
      nombre = controllerNombre.text;
    });
    controllerEmail.addListener(() {
      email = controllerEmail.text;
    });
    controllerPassword.addListener(() {
      password = controllerPassword.text;
    });
    controllerConfirmPassword.addListener(() {
      confirmPassword = controllerConfirmPassword.text;
    });
    controllerEdad.addListener(() {
      edad = controllerEdad.text;
    });

    return Scafold(context);
  }

  Widget Scafold(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 233, 100),
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
      color: Color.fromRGBO(230, 230, 233, 100),
      padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          textoH1("Ingresa tus datos para registrarte"),
          SizedBox(height: 20.0),
          inputForm(context, controllerNombre, "Nombre", 20, false),
          SizedBox(height: 20.0),
          inputForm(context, controllerEmail, "Email", 20, false),
          SizedBox(height: 20.0),
          inputForm(context, controllerPassword, "Contraseña", 20, true),
          SizedBox(height: 20.0),
          inputForm(context, controllerConfirmPassword, "Confirmar contraseña",
              20, true),
          SizedBox(height: 20.0),
          inputForm(context, controllerEdad, "Edad", 20, false),
          SizedBox(height: 20.0),
          radio(context),
          SizedBox(height: 20.0),
          botonRegistrar(context),
          SizedBox(height: 20.0),
          botonGeneralBack(context, "Cancelar", seccondaryColor())
        ],
      ),
    );
  }

  signup(String nombre, String email, String password, String edad,
      String sexo) async {
    http.Response response =
        await signupRequest(nombre, email, password, edad, sexo);
    print('normal');
    setState(() {
      responseLogin = response;
    });
  }

  Widget botonRegistrar(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () async {
          if (password == confirmPassword) {
            loadingDialog(context);
            await signup(nombre, email, password, edad, sexo);
            popDialog(context);
            (responseLogin.statusCode == 200)
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Foto(),
                    ),
                  )
                : errorDialog(context, responseLogin);
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Las contraseñas no coinciden'),
                  );
                });
          }
        },
        color: actionColor(),
        disabledColor: actionColor(),
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "REGISTRAR",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  mostrar(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(sexo.toString()),
          );
        });
  }

  Widget radio(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title:
              Text('Masculino', style: Theme.of(context).textTheme.subtitle1),
          leading: Radio(
            value: '0',
            groupValue: sexo,
            activeColor: Color(0xFF6200EE),
            onChanged: (String value) {
              setState(() {
                sexo = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Femenino', style: Theme.of(context).textTheme.subtitle1),
          leading: Radio(
            value: '1',
            groupValue: sexo,
            activeColor: Color(0xFF6200EE),
            onChanged: (String value) {
              setState(() {
                sexo = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
