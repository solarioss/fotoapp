import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:software1/foto.dart';
import 'package:software1/src/session/Datos.dart';
import 'package:software1/src/session/session.dart';

import 'package:software1/src/theme/strings.dart';
import 'package:software1/src/Modelos/Album.dart';

class CardSwiper extends StatelessWidget {
  Fotos fotos;
  int seleccionado = 1;

  CardSwiper({@required this.fotos});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 50.0),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FotoIndividual()),
          );
        },
        child: Swiper(
          itemWidth: _screenSize.width * 0.8,
          itemHeight: _screenSize.height * 0.5,
          itemCount: fotos.fotos.length,
          layout: SwiperLayout.STACK,
          itemBuilder: (BuildContext context, int index) {
            seleccionado = index - 1;
            if (seleccionado < 0) {
              seleccionado = fotos.fotos.length - 1;
            }

            Datos.setDato(seleccionado);
//----------------------------

            return Stack(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: FadeInImage(
                    image: NetworkImage(
                        host() + 'public/' + fotos.fotos[index].url),
                    placeholder: AssetImage('assets/images/camara.png'),
                  )),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                    "https://www.appskou.com/wp-content/uploads/2019/12/landmark1.png",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 200),
              ),
            ]);
            /*return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image:
                      NetworkImage(host() + 'public/' + fotos.fotos[index].url),
                  placeholder: AssetImage('assets/images/camara.png'),
                ));*/
          },
        ),
      ),
    );
  }
}
