import 'dart:convert';
import 'package:cosquinrockflutter/conciertos_database.dart';
import 'package:cosquinrockflutter/conciertos_database.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class ProviderGrupos with ChangeNotifier {
  List<dynamic> getOption = [];
  // ProviderGrupos(){
  //   cargarGrupos();
  // }

  Future<void> cargarAvisos() async {
    Database db = await openDatabase('CosquinRock.db');

    List<Map<String, dynamic>> avisos = [
      {
        'mensaje': "Faltan 10 días para Cosquín Rock 2025 ¡Latido de Montaña!",
        'fecha': "05/02/2025 00:00",
        'notificado': 0
      },
      {
        'mensaje': "- Faltan 5 días para Cosquín Rock 2025",
        'fecha': "10/02/2025 00:00",
        'notificado': 0
      },
      {
        'mensaje': "Faltan 3 días - Cosquín Rock 2025",
        'fecha': "12/02/2025 00:00",
        'notificado': 0
      },
      {
        'mensaje': "Faltan 2 días - Cosquín Rock 2025",
        'fecha': "13/02/2025 00:00",
        'notificado': 0
      },
      {
        'mensaje': "Falta 1 día para el Cosquin Rock 2025",
        'fecha': "14/02/2025 00:00",
        'notificado': 0
      },
      {
        'mensaje': "¡¡LLEGO EL DIA!!",
        'fecha': "15/02/2025 00:00",
        'notificado': 0
      },
      {
        'mensaje': "Arma tu grilla del Cosquin Rock 2025",
        'fecha': "15/02/2025 00:01",
        'notificado': 0
      },
      {
        'mensaje': "Descarga el Mapa del Festival",
        'fecha': "15/02/2025 00:02",
        'notificado': 0
      },
      {
        'mensaje': "Carga con Poket Cash",
        'fecha': "15/02/2025 00:03",
        'notificado': 0
      },
      {
        'mensaje': "¡¡LLEGO EL DIA!!",
        'fecha': "16/02/2025 00:00",
        'notificado': 0
      },
      {
        'mensaje': "Arma tu grilla del Cosquin Rock 2025",
        'fecha': "16/02/2025 00:01",
        'notificado': 0
      },
      {
        'mensaje': "Descarga el Mapa del Festival",
        'fecha': "16/02/2025 00:02",
        'notificado': 0
      },
      {
        'mensaje': "Carga con Poket Cash",
        'fecha': "16/02/2025 00:03",
        'notificado': 0
      },

      {
        'mensaje': "No te olvides de Cargar poket cash",
        'fecha': "15/02/2025 09:00",
        'notificado': 0
      },
      {
        'mensaje': "Arma tu grilla",
        'fecha': "15/02/2025 09:01",
        'notificado': 0
      },
      {
        'mensaje': "Descarga tu mapa",
        'fecha': "15/02/2025 09:02",
        'notificado': 0
      },

      {
        'mensaje': "No te olvides de Cargar poket cash",
        'fecha': "15/02/2025 12:00",
        'notificado': 0
      },
      {
        'mensaje': "Arma tu grilla",
        'fecha': "15/02/2025 12:01",
        'notificado': 0
      },
      {
        'mensaje': "Descarga tu mapa",
        'fecha': "15/02/2025 12:02",
        'notificado': 0
      },

      //domingo

      {
        'mensaje': "No te olvides de Cargar poket cash",
        'fecha': "16/02/2025 09:00",
        'notificado': 0
      },
      {
        'mensaje': "Arma tu grilla",
        'fecha': "16/02/2025 09:01",
        'notificado': 0
      },
      {
        'mensaje': "Descarga tu mapa",
        'fecha': "16/02/2025 09:02",
        'notificado': 0
      },

      {
        'mensaje': "No te olvides de Cargar poket cash",
        'fecha': "16/02/2025 12:00",
        'notificado': 0
      },
      {
        'mensaje': "Arma tu grilla",
        'fecha': "16/02/2025 12:01",
        'notificado': 0
      },
      {
        'mensaje': "Descarga tu mapa",
        'fecha': "16/02/2025 12:02",
        'notificado': 0
      },

      {
        'mensaje': "Hoy viví el día 1 del Cosquin Rock",
        'fecha': "15/02/2025 10:00",
        'notificado': 0
      },
      {
        'mensaje': "Hoy viví el día 2 del Cosquin Rock",
        'fecha': "16/02/2025 10:00",
        'notificado': 0
      },
    ];

    // Insertar cada registro en la tabla
    List<Map<String, dynamic>> result = await db.query('Avisos');

    // Verificar si la tabla está vacía
    if (result.isEmpty) {
      // La tabla está vacía, cargar los avisos
      for (var aviso in avisos) {
        await db.insert('Avisos', aviso);
      }
      print('Avisos cargados exitosamente.');
    } else {
      print('La tabla Avisos ya tiene registros, no se realizará la carga.');
    }

    // for (var aviso in avisos) {
    //   await db.insert('Avisos', aviso);
    // }

    result = await db.query('Avisos');

    print("La lista de mensajes son:");
    print(result);
  }

  //Future <List<dynamic>> cargarGrupos() async {
  Future cargarGrupos() async {
    final db = await CosquiRockDataBase.instance.database;
    final value = await rootBundle.loadString('aa/info.json');
    await db.delete('Grilla');
    List<dynamic> datos = json.decode(value);
    //getOption = datos['rutas'];
    // print("Los datos son:");
    // print (datos);

    for (var item in datos) {
      // await db.insert(
      //   'table_name',
      //   {
      //     'column_1': item['column_1'],
      //     'column_2': item['column_2'],
      //   },
      //   conflictAlgorithm: ConflictAlgorithm.replace,
      // );
      //print(item['banda']);
      await db.rawInsert(
          'INSERT INTO Grilla (estadio, banda, fecha) VALUES (?, ?, ?)',
          [item['estadio'], item['banda'], item['fecha']]);
    }

    cargarAvisos();
    //return datos;
    //return getOption;
  }

  Future<List<Map>> mostrarGruposDiaUnoNorte() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        //"SELECT estadio, banda, strftime('%H:%M', fecha, 'unixepoch', 'localtime') as fecha FROM Grilla WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' AND estadio like 'Norte' ORDER BY fecha DESC"
        "SELECT * FROM Grilla WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' AND estadio like 'Norte' ORDER BY fecha DESC");

    // print("Dia 1 norte");
    // print(result);

    return result;
  }

  Future<List<Map>> mostrarGruposDiaUnoSur() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' AND estadio like 'Sur' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaUnoMontana() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' AND estadio like 'Montaña' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaUnoBoomerang() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' AND estadio like 'Boomerang' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaUnoHangar() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' AND estadio like 'Hangar' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaUnoParaguay() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' AND estadio like 'Paraguay' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaUnoCasitaDelBlues() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' AND estadio like 'La Casita del Blues' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaDos() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map<String, dynamic>> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '16/02/2025 03:10' AND '17/02/2025 03:00' ORDER BY fecha DESC");

    // print ("Los grupos del dia 2 son");
    // print(result);

    return result;
  }

  Future<List<Map>> mostrarGruposDiaDosNorte() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        //"SELECT estadio, banda, strftime('%H:%M', fecha, 'unixepoch', 'localtime') as fecha FROM Grilla WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' AND estadio like 'Norte' ORDER BY fecha DESC"
        "SELECT * FROM Grilla WHERE fecha BETWEEN '16/02/2025 03:10' AND '17/02/2025 03:00' AND estadio like 'Norte' ORDER BY fecha DESC");

    // print("Dia 1 norte");
    // print(result);

    return result;
  }

  Future<List<Map>> mostrarGruposDiaDosSur() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '16/02/2025 03:10' AND '17/02/2025 03:00' AND estadio like 'Sur' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaDosHangar() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '16/02/2025 03:10' AND '17/02/2025 03:00' AND estadio like 'Hangar' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaDosMontana() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '16/02/2025 03:10' AND '17/02/2025 03:00' AND estadio like 'Montaña' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaDosBoomerang() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '16/02/2025 03:10' AND '17/02/2025 03:00' AND estadio like 'Boomerang' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaDosParaguay() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '16/02/2025 03:10' AND '17/02/2025 03:00' AND estadio like 'Paraguay' ORDER BY fecha DESC");

    return result;
  }

  Future<List<Map>> mostrarGruposDiaDosCasitaDelBlues() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM Grilla WHERE fecha BETWEEN '16/02/2025 03:10' AND '17/02/2025 03:00' AND estadio like 'La Casita del Blues' ORDER BY fecha DESC");

    return result;
  }

  Future ingresarBandaGrillaPersonal(
      String estadio, String banda, String fecha) async {
    final db = await CosquiRockDataBase.instance.database;

    await db.rawInsert(
        'INSERT INTO GrillaPersonal (estadio, banda, fecha) VALUES (?, ?, ?)',
        [estadio, banda, fecha]);

    List<Map> result =
        await db.rawQuery("SELECT * FROM GrillaPersonal ORDER BY fecha DESC");

    print("La lista personal es");
    print(result);
    //return result;
  }

  Future<List<Map>> mostrarGruposDiaUnoGrillaPersonal() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM GrillaPersonal WHERE fecha BETWEEN '15/02/2025 00:00' AND '16/02/2025 03:00' ORDER BY fecha DESC");
    return result;
  }

  Future<List<Map>> mostrarGruposDiaDosGrillaPersonal() async {
    final db = await CosquiRockDataBase.instance.database;

    List<Map> result = await db.rawQuery(
        "SELECT * FROM GrillaPersonal WHERE fecha BETWEEN '16/02/2025 03:10' AND '17/02/2025 03:00' ORDER BY fecha DESC");
    return result;
  }

  Future borraGrupoPersonalizado(int identificador) async {
    final db = await CosquiRockDataBase.instance.database;

    await db
        .rawDelete("DELETE FROM GrillaPersonal WHERE id = ?;", [identificador]);
  }

  int _indexMenu = 0;

  int get indexMenu {
    return _indexMenu;
  }

  set indexMenu(int valor) {
    this._indexMenu = valor;

    notifyListeners();
  }
}
