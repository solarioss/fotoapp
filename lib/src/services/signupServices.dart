import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:software1/src/session/session.dart';
import 'package:software1/src/theme/strings.dart';

Future<http.Response> signupRequest(String nombre, String email,
    String password, String edad, String sexo) async {
  final http.Response response = await http.post(
    host() + 'api/singup',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': nombre,
      'email': email,
      'sexo': sexo,
      'edad': edad,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    const JsonDecoder decoder = const JsonDecoder();
    var item = decoder.convert(response.body);
    Session.setSession(
        item['id'].toString(),
        item['name'],
        item['email'],
        item['sexo'],
        item['edad'].toString(),
        item['photo1'],
        item['photo2'],
        item['photo3']);
  }
  return response;
}
