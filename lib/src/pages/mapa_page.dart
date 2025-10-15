import 'package:cosquinrockflutter/src/pages/mapa2_page.dart';
import 'package:cosquinrockflutter/src/pages/youtubevideo_page.dart';
import 'package:cosquinrockflutter/src/widget/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:photo_view_v3/photo_view.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  //@override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromRGBO(132, 40, 40, 1),
        body: //_todosGrupos.isEmpty ? _listarGrupos() : _buscarGrupos(),
            Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("aa/BACKGROUNDMAPA.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  height: 300, // Altura deseada
                  width: 294,
                  child: Image(
                      image: AssetImage(
                    "aa/logoFecha.png",
                  ))),
              boton(
                "MAPA DEL PREDIO",
                () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Mapa2Page())),
              ),
              boton(
                "VIDEO ACCESO SUR",
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YoutubeVideoPage(
                        videoUrl: "https://www.youtube.com/shorts/xj75cZ_nLxI"),
                  ),
                ),
              ),
              boton(
                "VIDEO ACCESO NORTE",
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YoutubeVideoPage(
                        videoUrl: "https://www.youtube.com/shorts/LVd89s6SpGY"),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget boton(String texto, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 50.0, left: 50.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          texto,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          padding: EdgeInsets.only(top: 30, right: 20, bottom: 30, left: 20),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
