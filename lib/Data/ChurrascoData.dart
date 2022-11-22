import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'AnotaChurrasRodRecebimentoItem.dart';

class ChurrasClass {
  final int id;
  final String data;
  final String responsaveis;

  ChurrasClass(this.id, this.data, this.responsaveis);

  String toString() {
    return "ChurrasClass{id: $id, Data: $data, Responsaveis: $responsaveis}";
  }
}

Future<Database> CreateDBChurras() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'ChurrascoDB');
      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE ChurrascoDB(id INTEGER NOT NULL PRIMARY KEY,'
            'data TEXT NOT NULL,'
            'responsaveis TEXT NOT NULL)');
      }, version: 1);
    },
  );
}

Future<int> saveChurras(ChurrasClass churrasClass) {
  return CreateDBChurras().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["id"] = churrasClass.id;
    listMap["data"] = churrasClass.data;
    listMap["responsaveis"] = churrasClass.responsaveis;
    return db.insert('ChurrascoDB', listMap);
  });
}

int LastChurrasId = 0;
bool temDataChurras = false;
int NewChurrasId = 0;
String LastChurrasData = "";
String FirstChurrasData = "";
String LastChurrasResponsaveis = "";
String FirstChurrasResponsaveis = "";

List<ChurrasClass> ChurrasClasses = <ChurrasClass>[];

Future<List<ChurrasClass>> findChurras() {
  return CreateDBChurras().then(
    (db) {
      return db.query('ChurrascoDB').then(
        (maps) {
          ChurrasClasses = [];
          for (Map<String, dynamic> map in maps) {
            final ChurrasClass churrasClass = ChurrasClass(
              map["id"],
              map["data"],
              map["responsaveis"],
            );
            ChurrasClasses.add(churrasClass);
          }
          LastChurrasData = ChurrasClasses.last.data;
          LastChurrasResponsaveis = ChurrasClasses.last.responsaveis;
          ChurrasClasses.last.id != null
              ? LastChurrasId = ChurrasClasses.last.id
              : LastChurrasId = 0;
          NewChurrasId = LastChurrasId + 1;
          if (ChurrasClasses.length == 0) {
            temDataChurras = false;
          } else {
            temDataChurras = true;
          }
          return ChurrasClasses;
        },
      );
    },
  );
}

DeleteDataChurras() {
  return CreateDBChurras().then(
    (db) {
      return db.query('ChurrascoDB').then((dbPath) {
        db.execute("DELETE FROM ChurrascoDB WHERE id > -1");
      });
    },
  );
}

DeleteSelectedDataChurras() {
  return CreateDBChurras().then(
    (db) {
      return db.query('ChurrascoDB').then((dbPath) {
        db.execute("DELETE FROM ChurrascoDB WHERE id = $idClicked");
      });
    },
  );
}
