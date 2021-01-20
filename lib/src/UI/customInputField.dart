import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  Icon fieldIcon;
  String hinText;
  var controller;
  bool obscure;
  //CONSTRUCTOR//
  CustomInputField(this.fieldIcon, this.hinText, this.controller, this.obscure);

  @override
  Widget build(BuildContext context) {
    return Container(
      //hasta aca copio//
      //ESTE CONTENEDOR TIENE TOODO EL PRIMER TEXTFIEL DE MANERA CENTRADA
      width: 300,
      child: Material(
        //ESTE TEXTFIEL VENDRIA SIENDO PARA EL USUARIO HASTA LA LIN:33
        elevation: 5.0,
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), //ESTO HACE CIRCULAR AL TEXTFIELD
        color: Colors.black, //ESTE ES EL COLOR DE FONDO DEL TEXTO
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: fieldIcon,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0)),
              ),
              width: 250,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: obscure,
                  controller: controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hinText,
                      fillColor: Colors.black,
                      filled: true),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ); //hasta aca debo copiar el container
  }
}
