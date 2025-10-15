import 'package:cosquinrockflutter/constant.dart';
import 'package:cosquinrockflutter/src/pages/youtubevideo_page.dart';
import 'package:flutter/material.dart';

class ShowDialogPage {
  //EL valor 0 es para un mensaje de carga de operacion
  //EL valor 1 es para un mensaje de una operacion finalizada ya sea hecha satisfactoriamente o con un error
  //EL valor 2 es para un mensaje de confimacion de una operacion
  //static Future<void> showMensajeDialog(BuildContext context, String titulo, String message, int b) async {
  static Future<void> showMensajeDialog(
      BuildContext context, String titulo, String message, int b) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              children: b == 0
                  ? <Widget>[
                      Text(message),
                      CircularProgressIndicator(),
                    ]
                  : b == 1
                      ? <Widget>[Text(message)]
                      : <Widget>[Text(message)]),
          actions: b == 2
              ? <Widget>[
                  TextButton(
                    child: Text('Acceso Norte'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YoutubeVideoPage(
                              videoUrl:
                                  "https://www.youtube.com/shorts/LVd89s6SpGY"),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    child: Text('Acceso Sur'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YoutubeVideoPage(
                              videoUrl:
                                  "https://www.youtube.com/shorts/xj75cZ_nLxI"),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    child: Text('Cerrar'),
                    onPressed: () {
                      opcionSeleccionada = false;
                      Navigator.of(context).pop('No');
                    },
                  ),
                ]
              : b == 1
                  ? <Widget>[
                      TextButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop('');
                        },
                      ),
                    ]
                  : <Widget>[],
        );
      },
    );
  }

  static Future<void> subsidioMensaje(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Aviso"),
          content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text(
              "SI SOS USUARIO RESIDENCIAL Y RECIBIS EL SUBSIDIO (T1R - N2) SIN HABER REALIZADO NINGÚN TRAMITE",
              style: TextStyle(
                color: Color.fromARGB(255, 27, 14, 121),
              ),
            ),
            Text(
              "TE INFORMAMOS QUE PARA MANTENER EL SUBSIDIO TENDRÁS QUE COMPLETAR EL FORMULARIO RASE EN FORMA ONLINE EN https://www.argentina.gob.ar/subsidios. HASTA EL 04 DE SEPTIEMBRE DEL 2024.",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "CASO CONTRARIO CORRES EL RIESGO DE PERDER ESE BENEFICIO",
              style: TextStyle(
                color: Colors.red,
              ),
            )
          ]),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop('');
              },
            ),
          ],
        );
      },
    );
  }
}
