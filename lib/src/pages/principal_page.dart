import 'package:cosquinrockflutter/src/pages/dia1_page.dart';
import 'package:cosquinrockflutter/src/pages/dia2_page.dart';
import 'package:cosquinrockflutter/src/pages/imagenes_page.dart';
import 'package:cosquinrockflutter/src/pages/intro_page.dart';
import 'package:cosquinrockflutter/src/pages/mapa_page.dart';
import 'package:cosquinrockflutter/src/pages/migrilla_page.dart';
import 'package:cosquinrockflutter/src/pages/pocket_page.dart';
import 'package:cosquinrockflutter/src/providers/grupos_provider.dart';
import 'package:cosquinrockflutter/src/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  late Timer timer;
  bool loading = true;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 60), (timer) {
      //print("Ejecutando función cada segundo");
      DateTime now = DateTime.now();
      print("Fecha actual: $now");
      obtenerRegistrosConDiferenciaDeTiempo();
      //mostrarNotificacion();
    });
  }

  void mostrarMensajes() {
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      //print("Ejecutando función cada segundo");
      DateTime now = DateTime.now();
      print("Fecha actual: $now");
      obtenerAvisos();
      //mostrarNotificacion();
    });
  }

  @override
  void initState() {
    super.initState();
    cargando();
  }

  void cargando() {
    timer = Timer(Duration(seconds: 8), () {
      setState(() {
        loading = false;
      });
    });
  }

  int _selectedIndex = 0;
  final screens = [
    ImagenesPage(),
    DiaUnoPage(),
    DiaDosPage(),
    MiGrillaPage(),
    MapaPage(),
    PocketPage(),
  ];
  @override
  Widget build(BuildContext context) {
    startTimer();
    mostrarMensajes();

    final currentIndex = Provider.of<ProviderGrupos>(context, listen: true);
    return loading
        ? IntroPage()
        : Scaffold(
            body: screens[currentIndex.indexMenu],
            bottomNavigationBar: BottomNavigationBar(
              //onTap: (index)=> currentIndex = index,
              //currentIndex: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'INICIO',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.date_range),
                  label: 'DIA 1',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.date_range),
                  label: 'DIA 2',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'MI GRILLA',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'MAPA',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.money),
                  label: 'POCKET',
                ),
              ],
              currentIndex: currentIndex.indexMenu,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              onTap: (index) => setState(() {
                currentIndex.indexMenu = index;
              }),
            ),
          );
  }
}
