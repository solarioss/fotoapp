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
        padding: const EdgeInsets.all(10.0),
        child: TextField(
            obscureText: obscure,
            controller: controller,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: hinText,
                labelText: hinText,
                icon: fieldIcon),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            )));
  }
}
