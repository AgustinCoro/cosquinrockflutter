import 'package:flutter/material.dart';
import 'package:photo_view_v3/photo_view.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Color.fromRGBO(0, 0, 0, 1),
    //   body: Container(
    //       width: double.infinity, // Ancho igual al ancho de la pantalla
    //       height: double.infinity,
    //       decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: AssetImage("aa/mapa.jpg"),
    //             //fit: BoxFit.cover,
    //           ),
    //       ),
    //     ),   
    // );
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: PhotoView(
        imageProvider: AssetImage("aa/mapa.jpg"),
      ),
    );
  }
}