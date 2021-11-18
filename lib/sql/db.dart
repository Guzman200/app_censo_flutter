import 'package:ins/model/persona.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {

  static Future<Database> _openDB() async {

    return openDatabase(join(await getDatabasesPath(),'personas.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE personas (nombre TEXT, correo TEXT, totalHabitantes TEXT, numPersonasVacunadas TEXT, direccion TEXT, codigoPostal TEXT, fechaEntrevista TEXT)",
        );
      }, version: 1);
  }

  static void insert(Persona persona) async {
    
    Database database = await _openDB();

    database.insert("personas", persona.toMap());

  }

  /*static Future<void> delete(Animal animal) async {
    Database database = await _openDB();

    return database.delete("animales", where: "id = ?", whereArgs: [animal.id]);
  }

  static Future<void> update(Animal animal) async {
    Database database = await _openDB();

    return database.update("animales", animal.toMap(), where: "id = ?", whereArgs: [animal.id]);
  }

  */

  static Future<List<Persona>> personas() async {

    Database database = await _openDB();

    final List<Map<String, dynamic>> personasMap = await database.query("personas");

    return List.generate(personasMap.length,
            (i) => Persona(
              personasMap[i]['nombre'],
              personasMap[i]['correo'],
              personasMap[i]['totalHabitantes'],
              personasMap[i]['numPersonasVacunadas'],
              personasMap[i]['direccion'],
              personasMap[i]['codigoPostal'],
              personasMap[i]['fechaEntrevista']
            ));
  }

  /*
  // CON SENTENCIAS
  static Future<void> insertar2(Animal animal) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert("INSERT INTO animales (id, nombre, especie)"
    " VALUES (${animal.id}, ${animal.nombre}, ${animal.especie})");

  }
  */
}