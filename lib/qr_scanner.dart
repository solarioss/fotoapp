import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:software1/album.dart';
import 'package:software1/src/services/eventoServices.dart';
import 'package:software1/src/session/session.dart';
import 'package:software1/src/theme/colors.dart';
import 'package:software1/src/widgets/loadingDialog.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRScanner> {
  ScanResult _scanResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lector códigos QR'),
      ),
      body: Center(
          child: _scanResult == null
              ? Text('Esperando datos de código')
              : Text(
                  'Esperando datos de código') //botonFinalizar(context),<<<-----activar
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          loadingDialog(context);
          await eventoRequest('6'); //eventoRequest(_scanResult.rawContent);
          popDialog(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumScreen(),
            ),
          ); //_scanCode();
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<void> _scanCode() async {
    var result = await BarcodeScanner.scan();
    setState(() {
      _scanResult = result;
    });
  }

  Widget botonFinalizar(BuildContext context) {
    //
    return Container(
      width: 300,
      height: 60,
      child: RaisedButton(
        onPressed: () async {
          loadingDialog(context);
          await eventoRequest(_scanResult.rawContent);
          popDialog(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumScreen(),
            ),
          );
        },
        color: actionColor(),
        disabledColor: actionColor(),
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Text(
          "Ver Fotografias",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
