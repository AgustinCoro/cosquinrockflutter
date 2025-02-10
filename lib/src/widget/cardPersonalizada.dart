import 'package:cosquinrockflutter/src/pages/migrilla_page.dart';
import 'package:cosquinrockflutter/src/pages/principal_page.dart';
import 'package:cosquinrockflutter/src/providers/grupos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:maps_launcher/maps_launcher.dart';

class CardGrupoPersonalizado extends StatefulWidget {
  List<dynamic> gruposPersonalizados;

  CardGrupoPersonalizado({required this.gruposPersonalizados});

  @override
  State<CardGrupoPersonalizado> createState() => _CardGrupoPersonalizadoState();
}

class _CardGrupoPersonalizadoState extends State<CardGrupoPersonalizado> {
  //const CardOficina(this.grupos, {Key? key}) : super(key: key);
  final gruposProvider = new ProviderGrupos();

  @override
  Widget build(BuildContext context) {
    final currentIndex = Provider.of<ProviderGrupos>(context, listen: true);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Visibility(
              //visible: _visible,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(91, 11, 89, 1),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(229, 238, 242, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _banda(currentIndex),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]);
  }

  _banda(currentIndex) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          flex: 9, // 90% del espacio disponible
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    '${widget.gruposPersonalizados[0]} - ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    '${widget.gruposPersonalizados[1].toUpperCase()}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    ' - ${widget.gruposPersonalizados[2].substring(10)} ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1, // 10% del espacio disponible
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () async {
                await gruposProvider
                    .borraGrupoPersonalizado(widget.gruposPersonalizados[3]);
                showDialogMensaje(widget.gruposPersonalizados[1]);
                currentIndex.indexMenu = 3;
              },
              child: Image(
                image: AssetImage('aa/eliminar.png'),
                //width: 150.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // _banda(currentIndex)
  // {
  //   return Row(
  //     children: [
  //       const SizedBox(width: 10),
  //       Flexible(
  //         child: Center(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                   '${widget.gruposPersonalizados[0]} - ',
  //                   style: const TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.w500,
  //                       height: 1.5),
  //                 ),
  //                 Text(
  //                     '${widget.gruposPersonalizados[1].toUpperCase()} - ',
  //                     style: const TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w500,
  //                         height: 1.5),
  //                 ),
  //                 Text(
  //                     '${widget.gruposPersonalizados[2].substring(10)} ',
  //                     style: const TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w500,
  //                         height: 1.5),
  //                 ),
  //               // Column(
  //               //   children: [
  //               //   Text(
  //               //     '${widget.gruposPersonalizados[0]} - ',
  //               //     style: const TextStyle(
  //               //         fontSize: 20,
  //               //         fontWeight: FontWeight.w500,
  //               //         height: 1.5),
  //               //   ),
  //               //   Text(
  //               //       '${widget.gruposPersonalizados[1].toUpperCase()} - ',
  //               //       style: const TextStyle(
  //               //           fontSize: 20,
  //               //           fontWeight: FontWeight.w500,
  //               //           height: 1.5),
  //               //   ),
  //               //   Text(
  //               //       '${widget.gruposPersonalizados[2].substring(10)} ',
  //               //       style: const TextStyle(
  //               //           fontSize: 20,
  //               //           fontWeight: FontWeight.w500,
  //               //           height: 1.5),
  //               //   ),
  //               //     ],
  //               // ),
  //               Spacer(),
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 10),
  //                 child: GestureDetector(
  //                   onTap: () async {
  //                     //print("Presiono el id");
  //                     //print (widget.gruposPersonalizados[3]);
  //                     await gruposProvider.borraGrupoPersonalizado(widget.gruposPersonalizados[3]);
  //                     //int index = 3;
  //                     //currentIndex.indexMenu=0;
  //                     showDialogMensaje(widget.gruposPersonalizados[1]);
  //                     currentIndex.indexMenu=3;
  //                   },
  //                   child: const Text(
  //                       'X',
  //                       style: TextStyle(
  //                           color: Colors.red,
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.w500,
  //                           height: 1.5),
  //                   ),
  //                 ),
  //               ),

  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  void myFunction() {
    int _selectedIndex = 0;
    setState(() {
      _selectedIndex = 3;
    });
  }

  showDialogMensaje(String banda) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Aviso'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Se elimino a ${banda} a tu grilla personal'),
              ],
            ),
          );
        });
  }
}
