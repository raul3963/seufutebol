import 'dart:async';
import 'package:path/path.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/form/CadastroJogadorForm.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/ListaJogadores.dart';
import 'package:sqflite/sqflite.dart';

// Nome Completo
// Celular
// Data de Nascmiento
// Time do Coração

bool PlayerDataGet = false;

class JogadorClass {
  final int id;
  final int idGrupo;
  final int idTime;
  final String nome;
  final String celular;
  final String dataNascmiento;
  final String dataNascmientoRaw;
  final String timeCoracao;
  final double valormes;

  JogadorClass(this.id, this.idGrupo, this.idTime, this.nome, this.celular,
      this.dataNascmiento, this.dataNascmientoRaw, this.timeCoracao, this.valormes);

  String toString() {
    return "JogadorClass{id: $id, idGrupo: $idGrupo, idTime: $idTime: $nome, Celular: $celular, Data de nascimento: $dataNascmiento, Data de nascimentoRaw: $dataNascmientoRaw, Time do coração: $timeCoracao, valormes: $valormes}" +
        "\n";
  }
}

Future<Database> CreateDBJogador() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'JogadorDB');
      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE JogadorDB('
            'id INTEGER NOT NULL PRIMARY KEY,'
            'idGrupo INTEGER NOT NULL,'
            'idTime INTEGER NOT NULL,'
            'nome TEXT NOT NULL,'
            'celular TEXT NOT NULL,'
            'dataNascimento DATE NOT NULL,'
            'dataNascimentoRaw TEXT NOT NULL,'
            'timeCoracao TEXT,'
            'valormes REAL'
            ')');
      }, version: 1);
    },
  );
}

Future<int> saveJogador(JogadorClass jogadorClass) {
  return CreateDBJogador().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["id"] = jogadorClass.id;
    listMap["idGrupo"] = jogadorClass.idGrupo;
    listMap["idTime"] = jogadorClass.idTime;
    listMap["nome"] = jogadorClass.nome;
    listMap["celular"] = jogadorClass.celular;
    listMap["dataNascimento"] = jogadorClass.dataNascmiento;
    listMap["dataNascimentoRaw"] = jogadorClass.dataNascmientoRaw;
    listMap["timeCoracao"] = jogadorClass.timeCoracao;
    listMap["valormes"] = jogadorClass.valormes;
    return db.insert('JogadorDB', listMap);
  });
}

Future<int> saveJogadorALL(JogadorClass jogadorClass) {
  return CreateDBJogador().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["nome"] = jogadorClass.nome;
    listMap["celular"] = jogadorClass.celular;
    listMap["dataNascimento"] = jogadorClass.dataNascmiento;
    listMap["dataNascimentoRaw"] = jogadorClass.dataNascmientoRaw;
    listMap["timeCoracao"] = jogadorClass.timeCoracao;
    listMap["valormes"] = jogadorClass.valormes;
    return db.update('JogadorDB', listMap, where: "id = ${jogadorClass.id}", );
  });
}

Future<int> updateJogador(JogadorClass jogadorClass) {
  return CreateDBJogador().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["id"] = jogadorClass.id;
    listMap["idGrupo"] = jogadorClass.idGrupo;
    listMap["idTime"] = jogadorClass.idTime;
    listMap["nome"] = jogadorClass.nome;
    listMap["celular"] = jogadorClass.celular;
    listMap["dataNascimento"] = jogadorClass.dataNascmiento;
    listMap["dataNascimentoRaw"] = jogadorClass.dataNascmientoRaw;
    listMap["timeCoracao"] = jogadorClass.timeCoracao;
    listMap["valormes"] = jogadorClass.valormes;
    return db.rawUpdate(
        "UPDATE JogadorDB SET idTime = ${jogadorClass.idTime} WHERE id = ${jogadorClass.id}");
  });
}
Future<int> updateJogadorTime(JogadorClass jogadorClass) {
  return CreateDBJogador().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["idTime"] = jogadorClass.idTime;
    return db.update("JogadorDB", listMap, where: "id = ${jogadorClass.id}");
  });
}

int LastJogadorId = 0;
int NewJogadorId = 0;

List<JogadorClass> JogadorClasses = <JogadorClass>[];

Future<List<JogadorClass>> findJogador() {
  return CreateDBJogador().then(
    (db) {
      return db.query('JogadorDB', orderBy: "id").then(
        (maps) {
          JogadorClasses = [];
          for (Map<String, dynamic> map in maps) {
            final JogadorClass JogadorClasss = JogadorClass(
              map["id"],
              map["idGrupo"],
              map["idTime"],
              map["nome"],
              map["celular"],
              map["dataNascimento"],
              map["dataNascimentoRaw"],
              map["timeCoracao"],
              map["valormes"],
            );
            JogadorClasses.add(JogadorClasss);
          }
          LastJogadorId = JogadorClasses.last.id;
          NewJogadorId = LastJogadorId + 1;
          if (JogadorClasses.length == 0) {
            NewJogadorId = 1;
            TemDataJogador = false;
          } else {
            TemDataJogador = true;
          }
          return JogadorClasses;
        },
      );
    },
  );
}

bool TemDataJogadorTR = false;

Future<List<JogadorClass>> findJogadorpTime() {
  return CreateDBJogador().then(
        (db) {
      return db.query('JogadorDB', orderBy: "idTime").then(
            (maps) {
          JogadorClasses = [];
          for (Map<String, dynamic> map in maps) {
            final JogadorClass JogadorClasss = JogadorClass(
              map["id"],
              map["idGrupo"],
              map["idTime"],
              map["nome"],
              map["celular"],
              map["dataNascimento"],
              map["dataNascimentoRaw"],
              map["timeCoracao"],
              map["valormes"],
            );
            JogadorClasses.add(JogadorClasss);
          }
          if (JogadorClasses.length == 0) {
            TemDataJogadorTR = false;
          } else {
            TemDataJogadorTR = true;
          }
          return JogadorClasses;
        },
      );
    },
  );
}

bool TemDataJogadorN = false;

Future<List<JogadorClass>> findJogadorpNascimento() {
  return CreateDBJogador().then(
        (db) {
      return db.query('JogadorDB', orderBy: "dataNascimento").then(
            (maps) {
          JogadorClasses = [];
          for (Map<String, dynamic> map in maps) {
            final JogadorClass JogadorClasss = JogadorClass(
              map["id"],
              map["idGrupo"],
              map["idTime"],
              map["nome"],
              map["celular"],
              map["dataNascimento"],
              map["dataNascimentoRaw"],
              map["timeCoracao"],
              map["valormes"],
            );
            JogadorClasses.add(JogadorClasss);
          }
          if (JogadorClasses.length == 0) {
            TemDataJogadorN = false;
          } else {
            TemDataJogadorN = true;
          }
          return JogadorClasses;
        },
      );
    },
  );
}

DeleteDataJogador() {
  return CreateDBJogador().then(
    (db) {
      return db.query('JogadorDB').then((dbPath) {
        db.execute("DELETE FROM JogadorDB WHERE id > -1");
      });
    },
  );
}

DeleteSelectedDataJogador() {
  return CreateDBJogador().then(
        (db) {
      return db.query('JogadorDB').then((dbPath) {
        db.execute("DELETE FROM JogadorDB WHERE id = ${ClickedJogadorApagId}");
      });
    },
  );
}

bool TemDataJogador = true;
