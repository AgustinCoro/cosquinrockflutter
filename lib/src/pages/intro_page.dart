import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Iniciar una animación después de que el widget se ha construido completamente
    Future.delayed(Duration.zero, () {
      animateImage();
    });
  }

  void animateImage() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "aa/background_inicio.png"
                  ), // Cambia "Fondo.png" por tu imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Imagen que carga lentamente
          Center(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 4000),
              child: Container(
                width: 310,  // Ajusta el ancho según tus necesidades
                height: 310, // Ajusta la altura según tus necesidades
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("aa/Intro.png"), // Cambia "Intro.png" por tu imagen que carga lentamente
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class IntroPage extends StatefulWidget {
//   const IntroPage({Key? key}) : super(key: key);

//   @override
//   _IntroPageState createState() => _IntroPageState();
// }

// class _IntroPageState extends State<IntroPage> {
//   double opacity = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     // Iniciar una animación después de que el widget se ha construido completamente
//     Future.delayed(Duration.zero, () {
//       animateImage();
//     });
//   }

//   void animateImage() {
//     Future.delayed(Duration(milliseconds: 500), () {
//       setState(() {
//         opacity = 1.0;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //backGrounImage: const Image(image: AssetImage("aa/Foot.png", )),
//       body: Center(
//         child: AnimatedOpacity(
//           opacity: opacity,
//           duration: Duration(milliseconds: 4000),
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("aa/Intro.png"),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }