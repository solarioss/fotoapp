import 'package:software1/src/Modelos/Album.dart';
import 'package:software1/src/theme/strings.dart';

class Session {
  static final Session _instance = Session._internal();
  factory Session() => _instance;

  Session._internal() {
    // init things inside this
  }

  static Session get shared => _instance;

  String id;
  String name;
  String email;
  String sexo;
  String edad;
  String photo1;
  String photo2;
  String photo3;
  Fotos album;

  static setSession(id, name, email, sexo, edad, photo1, photo2, photo3) {
    Session.shared.id = id;
    Session.shared.name = name;
    Session.shared.email = email;
    Session.shared.sexo = sexo;
    Session.shared.edad = edad;
    Session.shared.photo1 = photo1;
    Session.shared.photo2 = photo2;
    Session.shared.photo3 = photo3;
  }

  static setAlbum(album) {
    Session.shared.album = album;
  }

  getFotoImg(int numero) {
    return album.fotos[numero].url;
  }
}
