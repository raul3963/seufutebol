import 'dart:async';
import 'package:path/path.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/ChurrascoRodada.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/ListaJogadores.dart';
import 'package:sqflite/sqflite.dart';

import 'AnotaChurrasRodRecebimentoItem.dart';

class ChurrasRodClass {
  final int id;
  final String jogador;
  final int timeJogador;
  final String pagou;
  final double valor;

  ChurrasRodClass(
      this.id, this.jogador, this.timeJogador, this.pagou, this.valor);

  String toString() {
    return "ChurrasRodClass{id: $id, jogador: $jogador, timeJogador: $timeJogador, pagou: $pagou, valor: $valor}";
  }
}


int LastChurrasRodId = 0;
int NewChurrasRodId = 0;
int ChurrasRodIdSelected = 0;

Future<Database> CreateDBChurrasRod() {
  return getDatabasesPath().then(
        (dbPath) {
      final String path = join(dbPath, 'ChurrascoRodDB');
      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE ChurrascoRodDB(id INTEGER NOT NULL PRIMARY KEY,'
            'jogador TEXT NOT NULL,'
            'timeJogador INTEGER NOT NULL,'
            'pagou TEXT NOT NULL,'
            'valor REAL NOT NULL)');
      }, version: 1);
    },
  );
}

Future<int> saveChurrasRod(ChurrasRodClass churrasRodClass) {
  return CreateDBChurrasRod().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["id"] = churrasRodClass.id;
    listMap["jogador"] = churrasRodClass.jogador;
    listMap["timeJogador"] = churrasRodClass.timeJogador;
    listMap["pagou"] = churrasRodClass.pagou;
    listMap["valor"] = churrasRodClass.valor;
    return db.insert('ChurrascoRodDB', listMap);
  });
}
Future<int> saveALLChurrasRod(ChurrasRodClass churrasRodClass) {
  return CreateDBChurrasRod().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["jogador"] = churrasRodClass.jogador;
    return db.update('ChurrascoRodDB', listMap, where: "id = ${churrasRodClass.id}");
  });
}
Future<int> updateChurrasRodPago (ChurrasRodClass churrasRodClass) {
  return CreateDBChurrasRod().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["pagou"] = churrasRodClass.pagou;
    listMap["valor"] = churrasRodClass.valor;
    return db.update('ChurrascoRodDB', listMap, where: "id = ${churrasRodClass.id}");
  });
}

Future<int> updateChurrasRodTime (ChurrasRodClass churrasRodClass) {
  return CreateDBChurrasRod().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["timeJogador"] = churrasRodClass.timeJogador;
    return db.update('ChurrascoRodDB', listMap, where: "id = ${churrasRodClass.id}");
  });
}

List<ChurrasRodClass> churrasRodClass = <ChurrasRodClass>[];

Future<List<ChurrasRodClass>> findChurrasRod() {
  return CreateDBChurrasRod().then(
        (db) {
      return db.query('ChurrascoRodDB').then(
            (maps) {
              churrasRodClass = [];
          for (Map<String, dynamic> map in maps) {
            final ChurrasRodClass churrasRodClasses = ChurrasRodClass(
              map["id"],
              map["jogador"],
              map["timeJogador"],
              map["pagou"],
              map["valor"],
            );
            churrasRodClass.add(churrasRodClasses);
          }
              churrasRodClass.last.id != null ?
          LastChurrasRodId = churrasRodClass.last.id : LastChurrasRodId = 0;
          NewChurrasRodId = LastChurrasRodId + 1;
          if(churrasRodClass.length == 0){
            temDataChurrasRod = false;
          }else{
            temDataChurrasRod = true;
          }
          return churrasRodClass;
        },
      );
    },
  );
}

Future<List<ChurrasRodClass>> findChurrasRodpTime() {
  return CreateDBChurrasRod().then(
        (db) {
      return db.query('ChurrascoRodDB', where: "timeJogador = $TimePerdedor").then(
            (maps) {
          churrasRodClass = [];
          for (Map<String, dynamic> map in maps) {
            final ChurrasRodClass churrasRodClasses = ChurrasRodClass(
              map["id"],
              map["jogador"],
              map["timeJogador"],
              map["pagou"],
              map["valor"],
            );
            churrasRodClass.add(churrasRodClasses);
          }
          if(churrasRodClass.length == 0){
            temDataChurrasRodpt = false;
          }else{
            temDataChurrasRodpt = true;
          }
          return churrasRodClass;
        },
      );
    },
  );
}

bool temDataChurrasRod = false;
bool temDataChurrasRodpt = false;

DeleteDataChurrasRod() {
  return CreateDBChurrasRod().then(
        (db) {
      return db.query('ChurrascoRodDB').then((dbPath) {
        db.execute("DELETE FROM ChurrascoRodDB WHERE id > -1");
      });
    },
  );
}

DeleteSelectedDataChurrasRod() {
  return CreateDBChurrasRod().then(
        (db) {
      return db.query('ChurrascoRodDB').then((dbPath) {
        db.execute("DELETE FROM ChurrascoRodDB WHERE id = $idClicked");
      });
    },
  );
}