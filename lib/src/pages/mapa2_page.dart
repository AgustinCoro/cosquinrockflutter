import 'package:flutter/material.dart';
import 'package:photo_view_v3/photo_view.dart';

class Mapa2Page extends StatefulWidget {
  const Mapa2Page({Key? key}) : super(key: key);

  @override
  _Mapa2PageState createState() => _Mapa2PageState();
}

class _Mapa2PageState extends State<Mapa2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        backgroundColor: Colors.black, // Color de fondo de la AppBar
        elevation: 0, // Sin sombra
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.pop(context), // Regresa a la pantalla anterior
        ),
      ),
      body: PhotoView(
        imageProvider: AssetImage("aa/mapa.jpg"),
      ),
    );
  }
}
