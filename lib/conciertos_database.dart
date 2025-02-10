import 'dart:convert';

import 'package:cosquinrockflutter/src/providers/grupos_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;

class CosquiRockDataBase {
  static final CosquiRockDataBase instance = new CosquiRockDataBase._init();

  static Database? _database;

  CosquiRockDataBase._init();

  final String tableGuardias = 'Guardias';
  final String tableDocumentos = 'Documentos';
  final String tableReclamos = 'Reclamos';
  final String tableDocumentoEstado = 'DocumentoEstado';
  final String tableDocumentosBackup = 'DocumentosBackup';
  final String tableReclamosBackup = 'ReclamosBackup';
  final String tableGuardiaDocumentoTarea = 'GuardiaDocumentoTarea';
  final String tableGuardiaDocumentoMaterial = 'GuardiaDocumentoMaterial';
  final String tableMateriales = 'Materiales';
  final String tableTareas = 'Tareas';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('CosquinRock.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    // print ("El path es");
    // print (path);

    return await openDatabase(path, version: 1, onCreate: onCreateDB);
  }

  //GuardiaDocumentoTarea, GuardiaDocumentoMaterial, Materiales, Tareas
  Future onCreateDB(Database db, int version) async {
    //await db.delete("Tareas");
    //await db.delete("Materiales");

    await db.execute('''
    CREATE TABLE IF NOT EXISTS GrillaDiaUno
    (
      estadio Text,
      banda Text,
      fecha Text
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS GrillaDiaDos
    (
      estadio Text,
      banda Text,
      fecha Text
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS Grilla
    (
      estadio Text,
      banda Text,
      fecha Text
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS GrillaPersonal
    (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      estadio Text,
      banda Text,
      fecha Text,
      notificado INTEGER
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS Avisos
    (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      mensaje Text,
      fecha Text,
      notificado INTEGER
    )
    ''');
  }

  // Future<void> insertGrupos() async {
  //   final gruposProvider = new ProviderGrupos();
  //   final db = await instance.database;
  //   await db.insert(tableReclamos, item.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  Future<List<dynamic>> cargarGrupos() async {
    List<dynamic> getOption = [];
    final value = await rootBundle.loadString('aa/info.json');

    Map datos = json.decode(value);
    print("Las bandas son");
    print(datos);
    //getOption = datos;
    return getOption;
  }

  // Future<List<Map<String, dynamic>>> obtenerAvisos() async {
  //   Database db = await openDatabase('CosquinRock.db');

  //   // Realizar la consulta SELECT
  //   List<Map<String, dynamic>> result = await db.query('Avisos');

  //   return result;
  // }

  // Future<void> insertTarea(Tarea item) async {
  //   final db = await instance.database;
  //   await db.insert(tableTareas, item.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // Future<void> insertMaterial(Material item) async {
  //   final db = await instance.database;
  //   await db.insert(tableMateriales, item.toJson(),
  //       conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  // Future<List<CartItem>> getAllItems() async {
  //   final db = await instance.database;
  //   final List<Map<String, dynamic>> maps = await db.query(tableCartItems);

  //   return List.generate(maps.length, (i) {
  //     return CartItem(
  //       id: maps[i]['id'],
  //       name: maps[i]['name'],
  //       price: maps[i]['price'],
  //       quantity: maps[i]['quantity'],
  //     );
  //   });
  // }

  // Future<int> delete(int id) async {
  //   final db = await instance.database;
  //   return await db.delete(
  //     tableCartItems,
  //     where: "id = ?",
  //     whereArgs: [id],
  //   );
  // }

  // Future<int> update(CartItem item) async {
  //   final db = await instance.database;
  //   return await db.update(
  //     tableCartItems,
  //     item.toMap(),
  //     where: "id=?",
  //     whereArgs: [item.id],
  //   );
  // }
}
