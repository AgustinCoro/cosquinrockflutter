import 'package:cosquinrockflutter/src/pages/dia1_page.dart';
import 'package:cosquinrockflutter/src/pages/dia2_page.dart';
import 'package:cosquinrockflutter/src/pages/migrilla_page.dart';
import 'package:cosquinrockflutter/src/providers/grupos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImagenesPage extends StatefulWidget {
  const ImagenesPage({super.key});

  @override
  State<ImagenesPage> createState() => _ImagenesPageState();
}

class _ImagenesPageState extends State<ImagenesPage> {
  final gruposProvider = new ProviderGrupos();

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<ProviderGrupos>(context, listen: true);

    return Container(
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            image: AssetImage("aa/background_inicio.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: _imagen1(currentIndex));
  }

  Widget _imagen1(currentIndex) {
    return FutureBuilder(
      future: gruposProvider.cargarGrupos(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Center(child: CircularProgressIndicator())],
          );
        }
        return Stack(children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: -100,
            //bottom: 300.0,
            child: Container(
                height: 280, // Altura deseada
                width: 294,
                child: Image(
                    image: AssetImage(
                  "aa/top.png",
                ))),
          ),
          Positioned(
            top: 300,
            left: 0.0,
            right: 0.0,
            //bottom: 400,
            child: Container(
                height: 280, // Altura deseada
                width: 294,
                child: Image(
                    image: AssetImage(
                  "aa/fecha.png",
                ))),
          ),

          Positioned(
            top: 100,
            left: 0.0,
            right: 0.0,
            //bottom: 400,
            child: Container(
                height: 280, // Altura deseada
                width: 294,
                child: Image(
                    image: AssetImage(
                  "aa/logoFecha.png",
                ))),
          ),

          // Positioned(
          //   left: 0.0,
          //   right: 0.0,
          //   bottom: 50.0,
          //   child: _botonDiaDos(currentIndex),
          // ),

          Positioned(
            //top: 100,
            left: 0.0,
            right: 0.0,
            bottom: -120,
            child: Container(
                height: 280, // Altura deseada
                width: 294,
                child: Image(
                    image: AssetImage(
                  "aa/Foot.png",
                ))),
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 50.0,
            child: Column(children: [_imagenBotones(currentIndex)]),
          ),
        ]);
      },
    );
  }

  Widget _imagenBordes(currentIndex) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("aa/CR23-APP-01.png"),
          fit: BoxFit.cover,
          //alignment: Alignment.topCenter
        ),
      ),
      //child: _imagenBotones(currentIndex),
    );
  }

  Widget _imagenFooter() {
    return Image(
      image: AssetImage('aa/Foot.png'),
      width: 300.0,
    );
  }

  Widget _imagenBotones(currentIndex) {
    return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botonDiaUno(currentIndex),
            _botonDiaDos(currentIndex),
            _botonGrilla(currentIndex),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     _botonDiaUno(currentIndex),
            //     _botonDiaDos(currentIndex),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [

            //     _botonMapa(currentIndex),
            //   ],
            // ),
          ],
        ));
  }

  Widget _botonDiaUno(currentIndex) {
    return GestureDetector(
      onTap: () {
        print("Presiono el boton del menu 1");
        currentIndex.indexMenu = 1;
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Image(
          image: AssetImage('aa/Btn_Dia1.png'),
          width: 150.0,
        ),
      ),
    );
  }

  Widget _botonDiaDos(currentIndex) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print("Presiono el boton del menu 2");
        currentIndex.indexMenu = 2;
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 15),
        child: Image(
          image: AssetImage('aa/Btn_Dia2.png'),
          width: 150.0,
        ),
      ),
    );
  }

  Widget _botonGrilla(currentIndex) {
    return GestureDetector(
      onTap: () {
        print("Presiono el boton de la grilla");
        currentIndex.indexMenu = 3;
      },
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Image(
          image: AssetImage('aa/Btn_MiGrilla.png'),
          width: 150.0,
        ),
      ),
    );
  }

  Widget _botonMapa(currentIndex) {
    return GestureDetector(
      onTap: () {
        print("Presiono el boton del mapa");
        currentIndex.indexMenu = 4;
      },
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Image(
          image: AssetImage('aa/Btn_MiMapa.png'),
          width: 150.0,
        ),
      ),
    );
  }
}

// class BotonDiaDos extends StatefulWidget {
//   final ProviderGrupos currentIndex;

//   BotonDiaDos(this.currentIndex);

//   @override
//   _BotonDiaDosState createState() => _BotonDiaDosState();
// }

// class _BotonDiaDosState extends State<BotonDiaDos> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print("Presiono el boton del menu 2");
//         print("Valor actual de currentIndex: ${widget.currentIndex.indexMenu}");
//         widget.currentIndex.indexMenu = 2;
//         print("Nuevo valor de currentIndex: ${widget.currentIndex.indexMenu}");
//       },
//       child: Image(
//         image: AssetImage('aa/Btn_Dia2.png'),
//         width: 150.0,
//       ),
//     );
//   }
// }
