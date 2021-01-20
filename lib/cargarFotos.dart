import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:software1/login.dart';
import 'package:software1/src/session/session.dart';
import 'package:software1/src/theme/colors.dart';
import 'package:software1/src/theme/strings.dart';
import 'package:software1/src/widgets/general.dart';
import 'package:software1/src/widgets/loadingDialog.dart';

class Foto extends StatefulWidget {
  Foto({Key key}) : super(key: key);

  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  bool foto1 = false;
  bool foto2 = false;
  bool foto3 = false;

  String url1 = '';
  String url2 = '';
  String url3 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar fotos de usuario'),
      ),
      backgroundColor: Color.fromRGBO(230, 230, 233, 100),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buscarImagen1(context),
                          buscarImagen2(context),
                          buscarImagen3(context),
                        ])),
              ),
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          imagenEstandar1(),
                          imagenEstandar2(),
                          imagenEstandar3(),
                        ])),
              ),
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          botonFinalizar(context),
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget botonFinalizar(BuildContext context) {
    //
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        color: actionColor(),
        disabledColor: actionColor(),
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "Finalizar",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  Widget buscarImagen1(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        top: 20,
        right: 10,
        bottom: 20,
      ),
      child: RaisedButton(
          onPressed: getImage1,
          color: actionColor(),
          disabledColor: actionColor(),
          disabledTextColor: Colors.white,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Icon(Icons.camera_alt)),
    );
  }

  Widget buscarImagen2(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        top: 20,
        right: 10,
        bottom: 20,
      ),
      child: RaisedButton(
          onPressed: getImage2,
          color: actionColor(),
          disabledColor: actionColor(),
          disabledTextColor: Colors.white,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Icon(Icons.camera_alt)),
    );
  }

  Widget buscarImagen3(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        top: 20,
        right: 10,
        bottom: 20,
      ),
      child: RaisedButton(
          onPressed: getImage3,
          color: actionColor(),
          disabledColor: actionColor(),
          disabledTextColor: Colors.white,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Icon(Icons.camera_alt)),
    );
  }

  Future getImage1() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      loadingDialog(context);
      var request =
          http.MultipartRequest('POST', Uri.parse(host() + 'api/registro/1'));
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      request.fields['id'] = Session.shared.id;

      var res = await request.send();
      popDialog(context);
      String body = await res.stream.bytesToString();
      const JsonDecoder decoder = const JsonDecoder();
      var item = decoder.convert(body);
      Session.shared.photo1 = item;
      setState(() {
        foto1 = true;
        url1 = item;
      });
    }
  }

  Future getImage2() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      loadingDialog(context);
      var request =
          http.MultipartRequest('POST', Uri.parse(host() + 'api/registro/2'));
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      request.fields['id'] = Session.shared.id;

      var res = await request.send();
      popDialog(context);

      String body = await res.stream.bytesToString();
      const JsonDecoder decoder = const JsonDecoder();
      var item = decoder.convert(body);
      Session.shared.photo2 = item;
      setState(() {
        foto3 = true;
        url2 = item;
      });
    }
  }

  Future getImage3() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      loadingDialog(context);
      var request =
          http.MultipartRequest('POST', Uri.parse(host() + 'api/registro/3'));
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      request.fields['id'] = Session.shared.id;

      var res = await request.send();
      popDialog(context);

      String body = await res.stream.bytesToString();
      const JsonDecoder decoder = const JsonDecoder();
      var item = decoder.convert(body);
      Session.shared.photo3 = item;
      setState(() {
        foto3 = true;
        url3 = item;
      });
    }
  }

  Widget imagenEstandar1() {
    if (url1 != '') {
      return Image(
        image: NetworkImage(host() + url1),
        width: 100,
        height: 100,
      );
    }
    return Image(
      image: NetworkImage(
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
      width: 100,
      height: 100,
    );
  }

  Widget imagenEstandar2() {
    if (url2 != '') {
      return Image(
        image: NetworkImage(host() + url2),
        width: 100,
        height: 100,
      );
    }
    return Image(
      image: NetworkImage(
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
      width: 100,
      height: 100,
    );
  }

  Widget imagenEstandar3() {
    if (url3 != '') {
      return Image(
        image: NetworkImage(host() + url3),
        width: 100,
        height: 100,
      );
    }
    return Image(
      image: NetworkImage(
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
      width: 100,
      height: 100,
    );
  }
}
