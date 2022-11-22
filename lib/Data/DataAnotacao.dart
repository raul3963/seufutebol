
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'AnotaChurrasRodRecebimentoItem.dart';

class AnotacaoClass {
  final int id;
  final String data;
  final String dataRaw;
  final String descricao;

  AnotacaoClass(this.id, this.data, this.dataRaw, this.descricao);

  String toString() {
    return "AnotacaoClass{id: $id, Data: $data, DataRaw: $dataRaw, Descrição: $descricao}";
  }
}

Future<Database> CreateDBAnotacao() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'AnotacaoDB');
      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE AnotacaoDB(id INTEGER NOT NULL PRIMARY KEY,'
            'data TEXT NOT NULL,'
            'dataRaw TEXT NOT NULL,'
            'descricao TEXT NOT NULL)');
      }, version: 1);
    },
  );
}

Future<int> saveAnotacao(AnotacaoClass anotacaoClass) {
  return CreateDBAnotacao().then((db) {
    final Map<String, dynamic> listMap = Map();
    listMap["id"] = anotacaoClass.id;
    listMap["data"] = anotacaoClass.data;
    listMap["dataRaw"] = anotacaoClass.dataRaw;
    listMap["descricao"] = anotacaoClass.descricao;
    return db.insert('AnotacaoDB', listMap);
  });
}

int LastAnotaId = 0;
int NewAnotaId = 0;
bool temDataAnotacao = false;
List<AnotacaoClass> AnotacaoClasses = <AnotacaoClass>[];

Future<List<AnotacaoClass>> findAnotacao() {
  return CreateDBAnotacao().then(
    (db) {
      return db.query('AnotacaoDB', orderBy: "id").then(
        (maps) {
          AnotacaoClasses = [];
          for (Map<String, dynamic> map in maps) {
            final AnotacaoClass anotacaoClass = AnotacaoClass(
              map["id"],
              map["data"],
              map["dataRaw"],
              map["descricao"],
            );
            AnotacaoClasses.add(anotacaoClass);
          }
            if(AnotacaoClasses.length != 0){
              temDataAnotacao = true;
            }else{
                temDataAnotacao = false;
            }
          AnotacaoClasses.last.id != null
              ? LastAnotaId = AnotacaoClasses.last.id
              : LastAnotaId = 0;
          NewAnotaId = LastAnotaId + 1;
          return AnotacaoClasses;
        },
      );
    },
  );
}



DeleteDataAnotacao() {
  return CreateDBAnotacao().then(
    (db) {
      return db.query('AnotacaoDB').then((dbPath) {
        db.execute("DELETE FROM AnotacaoDB WHERE id > -1");
      });
    },
  );
}
DeleteSelectedDataAnotacao() {
  return CreateDBAnotacao().then(
    (db) {
      return db.query('AnotacaoDB').then((dbPath) {
        db.execute("DELETE FROM AnotacaoDB WHERE id = $idClicked");
      });
    },
  );
}
