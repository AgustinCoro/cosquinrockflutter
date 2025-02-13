import 'package:cosquinrockflutter/conciertos_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
//import 'package:date_format/date_format.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('icono_notificacion');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> mostrarNotificacion(mensaje) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'channelId',
    'channelName',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  await flutterLocalNotificationsPlugin.show(
      1, 'Aviso', mensaje, notificationDetails);

  //const DarwinNotificationDetails iOSNotificationDetails= DarwinNotificationDetails('channelId', 'channelName');
}

Future<void> consultarConciertos() async {
  final db = await CosquiRockDataBase.instance.database;

  DateTime now = DateTime.now();

  List<Map> result = await db.rawQuery(
      //"SELECT * FROM GrillaPersonal WHERE fecha BETWEEN '15/02/2025 00:00' AND '18/02/2024 23:59' ORDER BY fecha DESC");
      "SELECT * FROM GrillaPersonal ORDER BY fecha DESC");
}

void obtenerAvisos() async {
  final db = await CosquiRockDataBase.instance.database;
  DateTime ahora = DateTime.now();
  //DateTime ahora = DateTime.parse(DateTime.now());
  DateTime horaLimite = ahora.add(Duration(minutes: 10));

  print("La hora limite es");
  print(horaLimite);

  String fechaActual = DateFormat('dd/MM/yyyy HH:mm').format(ahora);
  String fechaLimite = DateFormat('dd/MM/yyyy HH:mm').format(horaLimite);

  print("La fecha limite en nuevo formato es");
  print(fechaLimite);

  List<Map<String, dynamic>> result = await db.rawQuery(
    "SELECT * FROM Avisos WHERE notificado is not 1",
  );

  print("Los registros son");
  print(result);

  for (Map<String, dynamic> row in result) {
    // Accede al valor del campo fecha en cada fila
    String fecha = row['fecha'];
    print("Fecha: $fecha");

    DateTime fechaLDateTime = DateFormat("dd/MM/yyyy HH:mm").parse(fechaLimite);

    DateTime fechaDateTime = DateFormat("dd/MM/yyyy HH:mm").parse(fecha);

    if (fechaDateTime.isBefore(fechaLDateTime) ||
        fechaDateTime.isAtSameMomentAs(fechaLDateTime)) {
      print("La clave principal es");
      print(row['id']);
      int idParaActualizar = row['id'];

      await db.update(
        'Avisos', // Nombre de la tabla
        {'notificado': 1}, // Nuevos valores que deseas establecer
        where:
            'id = ?', // Condición WHERE para seleccionar el registro específico
        whereArgs: [idParaActualizar], // Valor del 'id' que estás buscando
      );

      mostrarNotificacion(row['mensaje']);
    } else {
      //print("La fecha es mayor que fechaL");
    }
  }
}

void obtenerRegistrosConDiferenciaDeTiempo() async {
  final db = await CosquiRockDataBase.instance.database;
  DateTime ahora = DateTime.now();
  //DateTime ahora = DateTime.parse(DateTime.now());
  DateTime horaLimite = ahora.add(Duration(minutes: 15));

  print("La hora limite es");
  print(horaLimite);

  String fechaActual = DateFormat('dd/MM/yyyy HH:mm').format(ahora);
  String fechaLimite = DateFormat('dd/MM/yyyy HH:mm').format(horaLimite);

  print("La fecha limite en nuevo formato es");
  print(fechaLimite);

  List<Map<String, dynamic>> result = await db.rawQuery(
    "SELECT * FROM GrillaPersonal WHERE notificado is not 1",
  );

  print("Los registros son");
  print(result);

  for (Map<String, dynamic> row in result) {
    // Accede al valor del campo fecha en cada fila
    String fecha = row['fecha'];
    print("Fecha: $fecha");

    DateTime fechaLDateTime = DateFormat("dd/MM/yyyy HH:mm").parse(fechaLimite);

    DateTime fechaDateTime = DateFormat("dd/MM/yyyy HH:mm").parse(fecha);

    if (fechaDateTime.isBefore(fechaLDateTime) ||
        fechaDateTime.isAtSameMomentAs(fechaLDateTime)) {
      print("La clave principal es");
      print(row['id']);
      int idParaActualizar = row['id'];

      await db.update(
        'GrillaPersonal', // Nombre de la tabla
        {'notificado': 1}, // Nuevos valores que deseas establecer
        where:
            'id = ?', // Condición WHERE para seleccionar el registro específico
        whereArgs: [idParaActualizar], // Valor del 'id' que estás buscando
      );

      mostrarNotificacion("En menos de 15 minutos estara " +
          row['banda'] +
          " en el escenario " +
          row['estadio']);
    } else {
      //print("La fecha es mayor que fechaL");
    }
  }
}
