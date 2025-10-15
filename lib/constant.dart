// variables

import 'package:url_launcher/url_launcher.dart';

bool opcionSeleccionada = true;

//funciones

Future<void> abrirDireccion(String direccion) async {
  final Uri _url = Uri.parse(direccion);
  if (!await launchUrl(
    _url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'No se pudo ingresar a la direccion $_url';
  }
}
