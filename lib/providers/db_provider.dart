
// Singleton : siempre se va a tomar la misma instancia desde donde la quiera tomar


import 'dart:io';
// import 'dart:js_interop';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:qr_reader_2/models/scan_model.dart';
export 'package:qr_reader_2/models/scan_model.dart';

// export 'package:path_provider/path_provider.dart';


class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._(); // Constructor privado para acceder a la misma instancia de la clase

  Future<Database> get database async {

    // if(_database != null ) return _database;
    if(_database != null ) return Future.value(_database);
    // if(_database != null){
    //   return Future.value(_database);
    // }

    _database = await initDB();

    return _database!;

  }

  Future<Database> initDB() async {  
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' ); //.db es la extension de sflite
    print(path);
    return await openDatabase(
      path,
      version: 1, // Es importante cambiar la version cuando se hacen cambios estructurales, porque no se va a ejecutar la rutina de creacion de las tablas.
      onOpen: (db){},
      onCreate: (db, version) async { //Database db, int version
        await db.execute('CREATE TABLE Scans(id INTEGER PRIMARY KEY,tipo TEXT,valor TEXT)');
      },
    );

  }

  // Es async porque la interaccion con la base de datos no es sincrona
  //Tiene que esperar a que se realice el procedimiento y luego se obtiene la respuesta
  Future<int> nuevoScanRaw( ScanModel nuevoScan ) async {

    final id    = nuevoScan.id;
    final tipo  = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    // Verificar la base de datos
    final db = await database; 

    final res = await db.rawInsert('''
      INSERT INTO Scans( id, tipo, valor)
      VALUES ( $id ,'$tipo', '$valor' )
    ''');
    return res;

  }
  // Insertar registros
  Future<int> nuevoScan( ScanModel nuevoScan ) async {
    // final db = await database; // // es el getter
    // final res = await db.insert('Scans', nuevoScan.toJson());
    // print(res);
    // // res es el id del ultimo registro insertado
    // return res;
    var query = await database;
    var result = await query.insert('Scans', nuevoScan.toJson());
    print('result id ${result}');
    return result;
    
  }

  Future<List<Map<String, Object?>>> showScans() async {
    var query = await database;
    var result = await query.rawQuery('SELECT * FROM Scans');
    print('result select ${result}');
    return result;
  }

  // Obtener todos los registros
  dynamic showAllScans() async { //Future<List<ScanModel>> 
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : null;
  }

  //Obtener registro por id
  dynamic getScanById( int id ) async {
    final db = await database;
    final res = await db.query('Scans', where:'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromMap(res.first ) : null;
  }

  // obtener los scans mediante el tipo
  // dynamic getScansByType(String tipo) async {
  //   final db = await database;
  //   final res = await db.rawQuery('''
  //   SELECT * FROM Scans WHERE Tipo = $tipo
  //   ''');
  //   // return res.isNotEmpty ? ScanModel.fromMap(res.first ) : [];
  //   return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  // }

  dynamic getScansByType(String tipo) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);
    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

  // actualizar un registro mediante id
  dynamic updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);
    // final res = await db.update('Scans', nuevoScan.toJson()); // aplica para todos los registros de la base de datos
    return res;
  }

  dynamic deleteScan(int id ) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  dynamic deleteScans() async {
    final db = await database;
    final res = await db.rawDelete('''
    DELETE FROM Scans
    ''');
    return res;
  }

  


}



