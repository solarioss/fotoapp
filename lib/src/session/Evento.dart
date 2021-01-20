class Evento {
  static final Evento _instance = Evento._internal();
  factory Evento() => _instance;

  Evento._internal() {
    // init things inside this
  }

  static Evento get shared => _instance;

  String id;
  String nombre;
  String fecha;

  static setEvento(id, nombre, fecha) {
    Evento.shared.id = id;
    Evento.shared.nombre = nombre;
    Evento.shared.fecha = fecha;
  }
}
