import 'package:cosquinrockflutter/src/providers/grupos_provider.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:maps_launcher/maps_launcher.dart';

class CardGrupo extends StatefulWidget {
  List<dynamic> grupos;

  CardGrupo({required this.grupos});

  @override
  State<CardGrupo> createState() => _CardGrupoState();
}

class _CardGrupoState extends State<CardGrupo> {
  //const CardOficina(this.grupos, {Key? key}) : super(key: key);
  final gruposProvider = new ProviderGrupos();

  @override
  Widget build(BuildContext context) {
    //final _screenSize = MediaQuery.of(context).size;
    //print ("Esto es lo que hay en las grupos");
    //print (this.grupos);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                //color: Color.fromRGBO(107, 131, 252, 1),
                color: Color.fromRGBO(255, 255, 255, 0.5),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
              //-----------------------------
              // Card Body
              //-----------------------------
              child: GestureDetector(
                onTap: () async {
                  await gruposProvider.ingresarBandaGrillaPersonal(
                      widget.grupos[0], widget.grupos[1], widget.grupos[2]);
                  showDialogMensaje(widget.grupos[1]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _banda(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]);
  }

  _banda() {
    return Row(
      children: [
        // const Icon(
        //   Icons.groups,
        //   size: 40,
        //   color: Colors.grey,
        // ),
        const SizedBox(width: 10),
        Flexible(
          child: Center(
            child: Text.rich(
              TextSpan(
                //text: 'Banda: ',
                children: [
                  TextSpan(
                    text: '${widget.grupos[1].toUpperCase()} - ',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500, height: 1.5),
                  ),
                  TextSpan(
                    text: '${widget.grupos[2].substring(10)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500, height: 1.5),
                  )
                ],
              ),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  showDialogMensaje(String banda) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('¡Genial!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('${banda} se agregó a Mi Grilla'),
              ],
            ),
          );
        });
  }
}
