import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/configuracao.dart';
import 'package:sqflite/sqflite.dart';

class TemaClass {
  final int id;

  TemaClass(this.id);

  String toString() {
    return "temaClass{id: $id}";
  }
}

Future<Database> CreateDBChurras() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'temaDB');
      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE temaDB(id INTEGER NOT NULL)');
      }, version: 1);
    },
  );
}

Future<int> saveTema(TemaClass temaClass) {
  return CreateDBChurras().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["id"] = temaClass.id;
    return db.insert('temaDB', listMap);
  });
}

bool temtema = false;
ThemeData temaload = ThemeData.light();

List<TemaClass> TemaClasses = <TemaClass>[];

Future<List<TemaClass>> findTema() {
  return CreateDBChurras().then(
    (db) {
      return db.query('temaDB').then(
        (maps) {
          TemaClasses = [];
          for (Map<String, dynamic> map in maps) {
            final TemaClass temaClass = TemaClass(map["id"]);
            TemaClasses.add(temaClass);
          }
          if (TemaClasses.length != 0) {
            TemaClasses.last.id == 1
                ? temaload = ThemeData.dark()
                : ThemeData.light();
            temtema = true;
          } else {
            temtema = false;
          }
          if(TemaClasses.last.id == 1){
            TemaDark = true;
            value = true;
          }else{
            TemaDark = false;
            value = true;
          }
          return TemaClasses;
        },
      );
    },
  );
}

DeleteTema() {
  return CreateDBChurras().then(
    (db) {
      return db.delete('temaDB', where: 'id >-1');
    },
  );
}

