import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software1/pago.dart';

import 'package:software1/src/session/Datos.dart';
import 'package:software1/src/session/session.dart';
import 'package:software1/src/theme/colors.dart';
import 'package:software1/src/theme/strings.dart';
import 'package:software1/src/widgets/general.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class Carrito extends StatefulWidget {
  Carrito({Key key}) : super(key: key);

  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  void _pay() {
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-JFosxdOathEnNJaOJPkbmA');
    InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _cardNonceRequestSuccess,
        onCardEntryCancel: _cardEntryCancel);
  }

  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);
    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  void _cardEntryComplete() {
    Datos.reiniciar();
    setState(() {});
  }

  void _cardEntryCancel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barGeneral(context, 'Carrito'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Carrito de compras',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0)),
              SizedBox(
                height: 12.0,
              ),
              SingleChildScrollView(
                child: todo(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget todo(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          for (var item in Datos.shared.carrito) elemento(context, item),
          Text('_________________________________________',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              Text(
                (Datos.shared.carrito.length * Datos.shared.precio).toString() +
                    ' Bs',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              )
            ],
          ),
          SizedBox(height: 40.0),
          comprar(context),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

  Widget eliminar(BuildContext context, int numero) {
    return Container(
      width: 60,
      height: 60,
      child: RaisedButton(
          onPressed: () {
            borrarElemento(numero);
          },
          color: Colors.red,
          disabledColor: actionColor(),
          disabledTextColor: Colors.white,
          textColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Icon(Icons.delete_outline)),
    );
  }

  void borrarElemento(int numero) {
    Datos.shared.carrito.remove(numero);
    setState(() {});
  }

  Widget elemento(BuildContext context, int numero) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(host() +
                          "public/" +
                          Session.shared.album.fotos[numero].url),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )),
          SizedBox(width: 12.0),
          Column(
            children: <Widget>[
              Text('Precio: ' + Datos.shared.precio.toString() + ' Bs')
            ],
          ),
          SizedBox(width: 50.0),
          eliminar(context, numero),
        ],
      ),
    );
  }

  Widget comprar(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () {
          _pay();
        },
        color: Colors.green[300],
        disabledColor: actionColor(),
        disabledTextColor: Colors.white,
        textColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "Comprar",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
