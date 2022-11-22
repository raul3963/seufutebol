import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GrupoClass {
  final int id;
  final String nome;
  final String descricao;

  GrupoClass(this.id, this.nome, this.descricao);

  String toString() {
    return "GrupoClass{id: $id, Nome: $nome, Descrição: $descricao}";
  }
}

int SelectedGroupId = -1;

Future<Database> CreateDBGrupo() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'GrupoDB');
      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE GrupoDB(id INTEGER NOT NULL PRIMARY KEY,'
            'nome TEXT NOT NULL,'
            'descricao TEXT NOT NULL)');
      }, version: 1);
    },
  );
}

Future<int> saveGrupo(GrupoClass grupoClass) {
  return CreateDBGrupo().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["id"] = grupoClass.id;
    listMap["nome"] = grupoClass.nome;
    listMap["descricao"] = grupoClass.descricao;
    return db.insert('GrupoDB', listMap);
  });
}

int LastGroupId = 0;
int NewGroupId = 0;

Future<List<GrupoClass>> findGrupos() {
  return CreateDBGrupo().then(
    (db) {
      return db.query('GrupoDB').then(
        (maps) {
          final List<GrupoClass> GrupoClasses = <GrupoClass>[];
          for (Map<String, dynamic> map in maps) {
            final GrupoClass grupoClasss = GrupoClass(
              map["id"],
              map["nome"],
              map["descricao"],
            );
            GrupoClasses.add(grupoClasss);
          }
          GrupoClasses.last.id!= null?LastGroupId = GrupoClasses.last.id:LastGroupId = 0;
          NewGroupId = LastGroupId + 1;
          return GrupoClasses;
        },
      );
    },
  );
}

DeleteDataGrupos(){
  return CreateDBGrupo().then(
        (db) {
      return db.query('GrupoDB').then((dbPath) {
        db.execute("DELETE FROM GrupoDB WHERE id > -1");
      });
    },
  );
}
