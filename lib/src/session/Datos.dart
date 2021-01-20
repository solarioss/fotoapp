import '../../cargarFotos.dart';

class Datos {
  static final Datos _instance = Datos._internal();
  factory Datos() => _instance;

  Datos._internal() {
    // init things inside this
  }

  static Datos get shared => _instance;

  int seleccion;
  List<int> carrito;
  int precio;

  static setDato(int numero) {
    Datos.shared.seleccion = numero;
  }

  static setCarrito(int numero) {
    Datos.shared.carrito.add(numero);
  }

  static inicializar() {
    Datos.shared.carrito = new List<int>();
    Datos.shared.precio = 10;
  }

  static reiniciar() {
    Datos.shared.carrito = new List<int>();
  }
}
