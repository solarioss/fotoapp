import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';

Widget loadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Cargando"),
            content: Container(
              height: 80,
              width: 80,
              child: Center(child: CircularProgressIndicator()),
            ));
      });
}

Widget errorDialog(BuildContext context, responseLogin) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              "Error",
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 80,
              width: 80,
              child: Center(
                  child: Text(
                responseLogin.body,
                textAlign: TextAlign.center,
              )),
            ));
      });
}

Widget errorDialogString(BuildContext context, String texto) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              "Error",
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 80,
              width: 80,
              child: Center(
                  child: Text(
                    texto,
                    textAlign: TextAlign.center,
                  )),
            ));
      });
}

void popDialog(BuildContext context){
  Navigator.of(context, rootNavigator: true).pop('dialog');
}
Widget genericDialog(BuildContext context, String text) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(text),
            content: Container(
              height: 80,
              width: 80,
              child: GFButton(
                text: "Ok",
                onPressed: (){
                  popDialog(context);
                },
              ),
            ));
      });
}