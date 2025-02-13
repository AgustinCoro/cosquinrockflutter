import 'package:cosquinrockflutter/src/models/grupos_model.dart';
import 'package:cosquinrockflutter/src/providers/grupos_provider.dart';
import 'package:cosquinrockflutter/src/widget/cardDia2.dart';
import 'package:cosquinrockflutter/src/widget/cards.dart';
import 'package:flutter/material.dart';

class DiaDosPage extends StatefulWidget {
  const DiaDosPage({super.key});

  @override
  State<DiaDosPage> createState() => _DiaDosPageState();
}

class _DiaDosPageState extends State<DiaDosPage> {
  final ScrollController _scrollControllerNorte = ScrollController();
  final ScrollController _scrollControllerSur = ScrollController();
  final ScrollController _scrollControllerMontana = ScrollController();
  final ScrollController _scrollControllerBoomerang = ScrollController();
  final ScrollController _scrollControllerCasita = ScrollController();
  final ScrollController _scrollControllerParaguay = ScrollController();

  List<dynamic> _todosGrupos = [];
  List<dynamic> _gruposEncontrados = [];
  final gruposProvider = new ProviderGrupos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(132, 40, 40, 1),
        // appBar: AppBar(
        //   backgroundColor: Color.fromRGBO(132, 40, 131, 1),
        //   title: Center(
        //     child: Text("Dia 2 - 19/02/2023"),
        //   ),
        // ),
        body: //_todosGrupos.isEmpty ? _listarGrupos() : _buscarGrupos(),
            Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("aa/background_dia2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _imagenFecha(),
                _imagenNorte(),
                _listarGruposNorte(),
                _imagenSur(),
                _listarGruposSur(),
                _imagenMontana(),
                _listarGruposMontana(),
                //_imagenBoomerang(),
                //_listarGruposBoomerang(),
                _imagenLaCasita(),
                _listarGruposLaCasita(),
                _imagenParaguay(),
                _listarGruposParaguay(),
                _imagenHangar(),
                _listarGruposHangar()
              ],
            ),
          ),
        ));
  }

  Widget _imagenFecha() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/fecha2.png'),
        image: AssetImage('aa/fecha2.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenNorte() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscNorte.png'),
        image: AssetImage('aa/EscNorte.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenSur() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscSur.png'),
        image: AssetImage('aa/EscSur.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenMontana() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscMontana.png'),
        image: AssetImage('aa/EscMontana.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenBoomerang() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscBoomerang.png'),
        image: AssetImage('aa/EscBoomerang.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenLaCasita() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscCasita.png'),
        image: AssetImage('aa/EscCasita.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenParaguay() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/Esc_Paraguay.png'),
        image: AssetImage('aa/Esc_Paraguay.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _imagenHangar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage('aa/EscHangar.png'),
        image: AssetImage('aa/EscHangar.png'),
        fadeInDuration: Duration(seconds: 3),
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _listarGruposNorte() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaDosNorte(),
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

        //final material = Materiales.fromJsonList(result);
        //final datosDecodificados = json.decode(snapshot.data);
        final grupo = Grupos.fromJsonList(snapshot.data);

        // if (_todosGrupos.isEmpty){
        //   _todosGrupos = grupo.items;
        //   _gruposEncontrados = grupo.items;
        // }
        final _todosGruposNorte = grupo.items;

        return Column(
          children: [
            SizedBox(
              height: 400,
              child: Scrollbar(
                controller: _scrollControllerNorte,
                //trackVisibility: true,
                thumbVisibility: true,
                thickness: 5,
                child: ListView.builder(
                    controller: _scrollControllerNorte,
                    shrinkWrap: true,
                    itemCount: _todosGruposNorte.length,
                    itemBuilder: (context, index) {
                      final grupo = _todosGruposNorte[index];
                      //Grupo grupo1 =

                      return _listItems(grupo);
                    }),
              ),
            ),
          ],
        );

        // return Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(10),
        //       child:
        //           TextField(
        //             onChanged: (text) {
        //              _filtrar(text);
        //             },
        //             decoration: const InputDecoration(
        //               labelText: 'Buscar Bandas',
        //               suffixIcon: Icon(Icons.search),
        //             )
        //           ),
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         height: 200,
        //         child: ListView.builder(
        //           itemCount: _todosGrupos.length,
        //           itemBuilder: (context, index) {
        //             final grupo = _todosGrupos[index];
        //             //Grupo grupo1 =

        //             return _listItems (grupo);
        //           }
        //         ),
        //       ),
        //     ),
        //   ],
        // );

        // return ListView(
        //      shrinkWrap: true,
        //      physics: const NeverScrollableScrollPhysics(),
        //      children: _listItems(reclamoCerradoCMDetalle.items, context)
        // );
      },
    );
  }

  Widget _listarGruposSur() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaDosSur(),
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

        //final material = Materiales.fromJsonList(result);
        //final datosDecodificados = json.decode(snapshot.data);
        final grupo = Grupos.fromJsonList(snapshot.data);

        // if (_todosGrupos.isEmpty){
        //   _todosGrupos = grupo.items;
        //   _gruposEncontrados = grupo.items;
        // }

        final _todosGruposSur = grupo.items;

        return Column(
          children: [
            SizedBox(
              height: 400,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollControllerSur,
                thickness: 5,
                child: ListView.builder(
                    controller: _scrollControllerSur,
                    shrinkWrap: true,
                    itemCount: _todosGruposSur.length,
                    itemBuilder: (context, index) {
                      final grupo = _todosGruposSur[index];
                      //Grupo grupo1 =

                      return _listItems(grupo);
                    }),
              ),
            ),
          ],
        );

        // return Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(10),
        //       child:
        //           TextField(
        //             onChanged: (text) {
        //              _filtrar(text);
        //             },
        //             decoration: const InputDecoration(
        //               labelText: 'Buscar Bandas',
        //               suffixIcon: Icon(Icons.search),
        //             )
        //           ),
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         height: 200,
        //         child: ListView.builder(
        //           itemCount: _todosGrupos.length,
        //           itemBuilder: (context, index) {
        //             final grupo = _todosGrupos[index];
        //             //Grupo grupo1 =

        //             return _listItems (grupo);
        //           }
        //         ),
        //       ),
        //     ),
        //   ],
        // );

        // return ListView(
        //      shrinkWrap: true,
        //      physics: const NeverScrollableScrollPhysics(),
        //      children: _listItems(reclamoCerradoCMDetalle.items, context)
        // );
      },
    );
  }

  Widget _listarGruposMontana() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaDosMontana(),
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

        //final material = Materiales.fromJsonList(result);
        //final datosDecodificados = json.decode(snapshot.data);
        final grupo = Grupos.fromJsonList(snapshot.data);

        // if (_todosGrupos.isEmpty){
        //   _todosGrupos = grupo.items;
        //   _gruposEncontrados = grupo.items;
        // }

        final _todosGruposMontana = grupo.items;

        return Column(
          children: [
            SizedBox(
              height: 400,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollControllerMontana,
                thickness: 5,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollControllerMontana,
                    itemCount: _todosGruposMontana.length,
                    itemBuilder: (context, index) {
                      final grupo = _todosGruposMontana[index];
                      //Grupo grupo1 =

                      return _listItems(grupo);
                    }),
              ),
            ),
          ],
        );

        // return Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(10),
        //       child:
        //           TextField(
        //             onChanged: (text) {
        //              _filtrar(text);
        //             },
        //             decoration: const InputDecoration(
        //               labelText: 'Buscar Bandas',
        //               suffixIcon: Icon(Icons.search),
        //             )
        //           ),
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         height: 200,
        //         child: ListView.builder(
        //           itemCount: _todosGrupos.length,
        //           itemBuilder: (context, index) {
        //             final grupo = _todosGrupos[index];
        //             //Grupo grupo1 =

        //             return _listItems (grupo);
        //           }
        //         ),
        //       ),
        //     ),
        //   ],
        // );

        // return ListView(
        //      shrinkWrap: true,
        //      physics: const NeverScrollableScrollPhysics(),
        //      children: _listItems(reclamoCerradoCMDetalle.items, context)
        // );
      },
    );
  }

  Widget _listarGruposBoomerang() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaDosBoomerang(),
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

        //final material = Materiales.fromJsonList(result);
        //final datosDecodificados = json.decode(snapshot.data);
        final grupo = Grupos.fromJsonList(snapshot.data);

        // if (_todosGrupos.isEmpty){
        //   _todosGrupos = grupo.items;
        //   _gruposEncontrados = grupo.items;
        // }

        final _todosGruposBoomerang = grupo.items;

        return Column(
          children: [
            SizedBox(
              height: 400,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollControllerBoomerang,
                thickness: 5,
                child: ListView.builder(
                    controller: _scrollControllerBoomerang,
                    shrinkWrap: true,
                    itemCount: _todosGruposBoomerang.length,
                    itemBuilder: (context, index) {
                      final grupo = _todosGruposBoomerang[index];
                      //Grupo grupo1 =

                      return _listItems(grupo);
                    }),
              ),
            ),
          ],
        );

        // return Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(10),
        //       child:
        //           TextField(
        //             onChanged: (text) {
        //              _filtrar(text);
        //             },
        //             decoration: const InputDecoration(
        //               labelText: 'Buscar Bandas',
        //               suffixIcon: Icon(Icons.search),
        //             )
        //           ),
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         height: 200,
        //         child: ListView.builder(
        //           itemCount: _todosGrupos.length,
        //           itemBuilder: (context, index) {
        //             final grupo = _todosGrupos[index];
        //             //Grupo grupo1 =

        //             return _listItems (grupo);
        //           }
        //         ),
        //       ),
        //     ),
        //   ],
        // );

        // return ListView(
        //      shrinkWrap: true,
        //      physics: const NeverScrollableScrollPhysics(),
        //      children: _listItems(reclamoCerradoCMDetalle.items, context)
        // );
      },
    );
  }

  Widget _listarGruposLaCasita() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaDosCasitaDelBlues(),
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

        //final material = Materiales.fromJsonList(result);
        //final datosDecodificados = json.decode(snapshot.data);
        final grupo = Grupos.fromJsonList(snapshot.data);

        // if (_todosGrupos.isEmpty){
        //   _todosGrupos = grupo.items;
        //   _gruposEncontrados = grupo.items;
        // }

        final _todosGruposLaCasita = grupo.items;

        return Column(
          children: [
            SizedBox(
              height: 400,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollControllerCasita,
                thickness: 5,
                child: ListView.builder(
                    controller: _scrollControllerCasita,
                    shrinkWrap: true,
                    itemCount: _todosGruposLaCasita.length,
                    itemBuilder: (context, index) {
                      final grupo = _todosGruposLaCasita[index];
                      //Grupo grupo1 =

                      return _listItems(grupo);
                    }),
              ),
            ),
          ],
        );

        // return Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(10),
        //       child:
        //           TextField(
        //             onChanged: (text) {
        //              _filtrar(text);
        //             },
        //             decoration: const InputDecoration(
        //               labelText: 'Buscar Bandas',
        //               suffixIcon: Icon(Icons.search),
        //             )
        //           ),
        //     ),
        //     Expanded(
        //       child: SizedBox(
        //         height: 200,
        //         child: ListView.builder(
        //           itemCount: _todosGrupos.length,
        //           itemBuilder: (context, index) {
        //             final grupo = _todosGrupos[index];
        //             //Grupo grupo1 =

        //             return _listItems (grupo);
        //           }
        //         ),
        //       ),
        //     ),
        //   ],
        // );

        // return ListView(
        //      shrinkWrap: true,
        //      physics: const NeverScrollableScrollPhysics(),
        //      children: _listItems(reclamoCerradoCMDetalle.items, context)
        // );
      },
    );
  }

  Widget _listarGruposHangar() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaDosHangar(),
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
        final grupo = Grupos.fromJsonList(snapshot.data);

        final _todosGruposHangar = grupo.items;

        return Column(
          children: [
            SizedBox(
              height: 400,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollControllerCasita,
                thickness: 5,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollControllerCasita,
                    itemCount: _todosGruposHangar.length,
                    itemBuilder: (context, index) {
                      final grupo = _todosGruposHangar[index];
                      //Grupo grupo1 =

                      return _listItems(grupo);
                    }),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _listarGruposParaguay() {
    return FutureBuilder(
      future: gruposProvider.mostrarGruposDiaDosParaguay(),
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
        final grupo = Grupos.fromJsonList(snapshot.data);

        final _todosGruposParaguay = grupo.items;

        return Column(
          children: [
            SizedBox(
              height: 400,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollControllerParaguay,
                thickness: 5,
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollControllerParaguay,
                    itemCount: _todosGruposParaguay.length,
                    itemBuilder: (context, index) {
                      final grupo = _todosGruposParaguay[index];
                      //Grupo grupo1 =

                      return _listItems(grupo);
                    }),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buscarGrupos() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
              onChanged: (text) {
                _filtrar(text);
              },
              decoration: const InputDecoration(
                labelText: 'Buscar Zonas',
                suffixIcon: Icon(Icons.search),
              )),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: _gruposEncontrados.length,
              itemBuilder: (context, index) {
                Grupo grupo = _gruposEncontrados[index];

                return _listItems(grupo);
              }),
        ),
      ],
    );
  }

  Widget _listItems(Grupo infogrupo) {
    //final List<Widget> optValueWidget = [];

    // for (Grupo opt in infogrupo)
    // {
    //   //print(opt.domicilio);
    //   List<dynamic> grupo = [opt.estadio, opt.banda, opt.fecha];
    //   final witgetvalue =  Padding(
    //     padding: const EdgeInsets.only(top:10.0, bottom:10.0),
    //     child: CardGrupo(grupos: grupo),
    //   );
    //   optValueWidget.add(witgetvalue);
    // }
    // return optValueWidget;

    List<dynamic> grupo = [infogrupo.estadio, infogrupo.banda, infogrupo.fecha];
    final witgetvalue = Padding(
      padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
      child: CardGrupo2(grupos: grupo),
    );

    return witgetvalue;
  }

  void _filtrar(String grupoBuscado) {
    final resultado = _todosGrupos.where((grupo) {
      final grupoNombre = grupo.banda.toString().toLowerCase();
      final input = grupoBuscado.toLowerCase();

      return grupoNombre.contains(input);
    }).toList();

    setState(() => _gruposEncontrados = resultado);
  }
}
