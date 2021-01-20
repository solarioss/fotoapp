class Fotos {
  List<Foto> fotos = new List();

  Fotos();

  Fotos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final foto = new Foto.fromJsonMap(item);
      fotos.add(foto);
    }
  }
}

class Foto {
  int id;
  String url;
  int idEvento;

  Foto({
    this.id,
    this.url,
    this.idEvento,
  });

  Foto.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    idEvento = json['id_evento'];
  }
}
