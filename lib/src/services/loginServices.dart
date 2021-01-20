import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:software1/src/session/session.dart';
import 'package:software1/src/theme/strings.dart';

Future<http.Response> loginRequest(String email, String password) async {
  final http.Response response = await http.post(
    host() + 'api/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    const JsonDecoder decoder = const JsonDecoder();
    var item = decoder.convert(response.body);
    Session.setSession(
        item['id'].toString(),
        item['nombre'],
        item['email'],
        item['sexo'],
        item['edad'].toString(),
        item['photo1'],
        item['photo2'],
        item['photo3']);
  }
  return response;
}
