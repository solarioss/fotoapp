import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:software1/src/Modelos/Album.dart';
import 'package:software1/src/session/Datos.dart';
import 'package:software1/src/session/Evento.dart';
import 'package:software1/src/session/session.dart';
import 'package:software1/src/theme/strings.dart';

Future<http.Response> eventoRequest(String idEvento) async {
  final http.Response response = await http.post(
    host() +
        'api/buscar_foto/8/' +
        idEvento, //host() + 'api/buscar_foto/' + Session.shared.id + '/' + idEvento,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'evento': idEvento,
    }),
  );
  if (response.statusCode == 200) {
    const JsonDecoder decoder = const JsonDecoder();
    final decodeData = json.decode(response.body);

    Fotos fotos = new Fotos.fromJsonList(decodeData);
    Session.setAlbum(fotos);
  }
  Datos.inicializar();
  return response;
}
