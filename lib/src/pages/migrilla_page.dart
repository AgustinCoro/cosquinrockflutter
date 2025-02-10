import 'dart:async';

import 'package:cosquinrockflutter/src/models/grupoPersonalizado_model.dart';
import 'package:cosquinrockflutter/src/models/grupos_model.dart';
import 'package:cosquinrockflutter/src/pages/dia1_page.dart';
import 'package:cosquinrockflutter/src/pages/dia2_page.dart';
import 'package:cosquinrockflutter/src/pages/imagenes_page.dart';
import 'package:cosquinrockflutter/src/providers/grupos_provider.dart';
import 'package:cosquinrockflutter/src/widget/cardPersonalizada.dart';
import 'package:cosquinrockflutter/src/widget/cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MiGrillaPage extends StatelessWidget {
  //const MiGrillaPage({super.key});

  final ScrollController _scrollControllerDiaUno = ScrollController();

  final ScrollController _scrollControllerDiaDos = ScrollController();

  List<GrupoPersonalizado> _todosGruposDiaUno = []; //
  List<GrupoPersonalizado> _todosGruposDiaDos = []; //

  int contador = 0;

  late Timer _timer;

  @override

  // void initState() {
  //   final _passwordVisible = false;

  //   super.initState();

  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       //contador = contador + 180;
  //       _listarGruposDiaUno();
  //       _listarGruposDiaDos();
  //     });
  //   });
  // }

  final gruposProvider = new ProviderGrupos();

  @override
  Widget build(BuildContext context) {
    //Color color = Color(842883);
    double screenWidth = MediaQuery.of(context).size.width;
    final currentIndex = Provider.of<ProviderGrupos>(context, listen: true);
    return Scaffold(
      backgroundColor: Color.fromRGBO(132, 40, 40, 1),
      body: //_todosGrupos.isEmpty ? _listarGrupos() : _buscarGrupos(),
          Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("aa/background_migrilla.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _imagenMiGrilla(screenWidth),

              _imagenFechaUno(screenWidth),

              //Text("El valor del index es ${currentIndex.indexMenu}", style: TextStyle(color: Colors.white), ),

              //_todosGruposDiaUno.isEmpty? Text("Aun no ha ingresado ningun artista", style: TextStyle(color: Colors.white), ) : _listarGruposDiaUno(),

              _listarGruposDiaUno(),

              _imagenFechaDos(screenWidth),

              // _todosGruposDiaDos.isEmpty? Padding(
              //   padding: const EdgeInsets.only(left: 80, right: 90, bottom: 500),
              //   child: Text("Aun no ha ingresado ningun artista", style: TextStyle(color: Colors.white), ),
              // ) : _listarGruposDiaDos(),

              _listarGruposDiaDos(),
            ],
          ),
        ),
      ),
      //   bottomNavigationBar: BottomNavigationBar(
      //   //onTap: (index)=> currentIndex = index,
      //   //currentIndex: 0,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'INICIO',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.date_range),
      //       label: 'DIA 1',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.date_range),
      //       label: 'DIA 2',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       label: 'MI GRILLA',
      //     ),
      //   ],
      //   currentIndex: currentIndex,

      //   selectedItemColor: Colors.orange,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   onTap: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      // ),
    );
  }

  Widget _imagenMiGrilla(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/MiGrilla.png'),
        image: AssetImage('aa/MiGrilla.png'),
        fadeInDuration: Duration(seconds: 3),
        width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenFechaUno(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/fecha1.png'),
        image: AssetImage('aa/fecha1.png'),
        fadeInDuration: Duration(seconds: 3),
        width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenFechaDos(screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/fecha2.png'),
        image: AssetImage('aa/fecha2.png'),
        fadeInDuration: Duration(seconds: 3),
        width: screenWidth * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _listarGruposDiaUno() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaUnoGrillaPersonal(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: CircularProgressIndicator())],
          );
        }

        final grupo = GruposPersonalizados.fromJsonList(snapshot.data);

        _todosGruposDiaUno = grupo.items;

        if (_todosGruposDiaUno.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 80, right: 90, bottom: 100),
            child: Text(
              "Aun no ha ingresado ningun artista",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: 300,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollControllerDiaUno,
                  thickness: 5,
                  child: ListView.builder(
                      controller: _scrollControllerDiaUno,
                      shrinkWrap: true,
                      itemCount: _todosGruposDiaUno.length,
                      itemBuilder: (context, index) {
                        final grupo = _todosGruposDiaUno[index];
                        //Grupo grupo1 =

                        return _listItems(grupo);
                      }),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _listarGruposDiaDos() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaDosGrillaPersonal(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: CircularProgressIndicator())],
          );
        }

        final grupo = GruposPersonalizados.fromJsonList(snapshot.data);

        _todosGruposDiaDos = grupo.items;

        if (_todosGruposDiaDos.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 80, right: 90, bottom: 500),
            child: Text(
              "Aun no ha ingresado ningun artista",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: 400,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollControllerDiaDos,
                  thickness: 5,
                  child: ListView.builder(
                      controller: _scrollControllerDiaDos,
                      shrinkWrap: true,
                      itemCount: _todosGruposDiaDos.length,
                      itemBuilder: (context, index) {
                        final grupo = _todosGruposDiaDos[index];
                        //Grupo grupo1 =

                        return _listItems(grupo);
                      }),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _listItems(GrupoPersonalizado infogrupo) {
    List<dynamic> grupo = [
      infogrupo.estadio,
      infogrupo.banda,
      infogrupo.fecha,
      infogrupo.id
    ];
    final witgetvalue = Padding(
      padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
      child: CardGrupoPersonalizado(gruposPersonalizados: grupo),
    );
    return witgetvalue;
  }
}
