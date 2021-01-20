import 'package:flutter/material.dart';
import 'package:software1/src/widgets/general.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class Pago extends StatefulWidget {
  Pago({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PagoState createState() => _PagoState();
}

class _PagoState extends State<Pago> {
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

  void _cardEntryComplete() {}

  void _cardEntryCancel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barGeneral(context, 'Metodo de pago'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'hola mund:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pay,
        tooltip: 'Payment',
        child: Icon(Icons.payment),
      ),
    );
  }
}
