import 'package:path/path.dart';
import 'package:seufutebol/Models/TextJogadorNomeModel.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/ListaJogadores.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/Recebimentomes.dart';
import 'package:sqflite/sqflite.dart';

class RecebimentoClass {
  final int id;
  final String nome;
  final String pagou;
  final String valor;
  final int mesN;

  RecebimentoClass(
      this.id,
      this.nome,
      this.pagou,
      this.valor,
      this.mesN);

  String toString() {
    return "RecebimentoClass{id: $id, pagou: $pagou Nome:$nome Valor: $valor, mesN: $mesN}";
  }
}

Future<Database> CreateDBRecebimento() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'RecebimentoDB');
      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE RecebimentoDB(id INTEGER NOT NULL PRIMARY KEY,'
            'jogador TEXT NOT NULL,'
            'pagou TEXT NOT NULL,'
            'valor TEXT NOT NULL,'
            'mesN INTEGER NOT NULL)');
      }, version: 3);
    },
  );
}



Future<int> saveRecebimento(RecebimentoClass anotacaoClass) {
  return CreateDBRecebimento().then(
    (db) {
      final Map<String, dynamic> listMap = Map();
      listMap["id"] = anotacaoClass.id;
      listMap["jogador"] = anotacaoClass.nome;
      listMap["pagou"] = anotacaoClass.pagou;
      listMap["valor"] = anotacaoClass.valor;
      listMap["mesN"] = anotacaoClass.mesN;
      return db.insert('RecebimentoDB', listMap);
    },
  );
}

Future<int> saveRecebimentoAll(RecebimentoClass anotacaoClass) {
  return CreateDBRecebimento().then(
    (db) {
      final Map<String, dynamic> listMap = Map();
      listMap["pagou"] = anotacaoClass.pagou;
      return db.update('RecebimentoDB', listMap,
          where: "id = ${anotacaoClass.id}");
    },
  );
}


Future<int> editRecebimentoNaoPago(RecebimentoClass anotacaoClass) {
  return CreateDBRecebimento().then(
        (db) {
      final Map<String, dynamic> listMap = Map();
      listMap["pagou"] = anotacaoClass.pagou;
      listMap["valor"] = anotacaoClass.valor;
      return db.update('RecebimentoDB', listMap,
          where: "id = ${anotacaoClass.id}");
    },
  );
}

Future<int> editRecebimentoValor(RecebimentoClass anotacaoClass) {
  return CreateDBRecebimento().then(
        (db) {
      final Map<String, dynamic> listMap = Map();
      listMap["valor"] = anotacaoClass.valor;
      return db.update('RecebimentoDB', listMap, where: "jogador = ${anotacaoClass.nome} AND valor = ${ValorAntigoJog.toDouble().toStringAsFixed(2).toString()}", );
    },
  );
}

Future<int> editRecebimentoNaoPagoall(RecebimentoClass anotacaoClass) {
  return CreateDBRecebimento().then(
        (db) {
      final Map<String, dynamic> listMap = Map();
      listMap["pagou"] = anotacaoClass.pagou;
      return db.update('RecebimentoDB', listMap,
          where: "id > -1");
    },
  );
}


Future<int> editRecebimento(RecebimentoClass anotacaoClass) {
  return CreateDBRecebimento().then(
    (db) {
      final Map<String, dynamic> listMap = Map();
      listMap["jogador"] = anotacaoClass.nome;
      return db.rawUpdate('UPDATE RecebimentoDB SET jogador = "${anotacaoClass.nome}" WHERE jogador = "$jogadoreditNome"');
    },
  );
}



int LastRecebimentoId = 0;
int NewRecebimentoId = 0;
List<RecebimentoClass> RecebimentoClasses = <RecebimentoClass>[];

Future<List<RecebimentoClass>> findRecebimento() {
  return CreateDBRecebimento().then(
    (db) {
      return db.query('RecebimentoDB').then(
        (maps) {
          RecebimentoClasses = [];
          for (Map<String, dynamic> map in maps) {
            final RecebimentoClass recebimentoClass = RecebimentoClass(
              map["id"],
              map["jogador"],
              map["pagou"],
              map["valor"],
              map["mesN"],
            );
            RecebimentoClasses.add(recebimentoClass);
          }
          RecebimentoClasses.last.id != null
              ? LastRecebimentoId = RecebimentoClasses.last.id
              : LastRecebimentoId = 0;
          NewRecebimentoId = LastRecebimentoId + 1;
          return RecebimentoClasses;
        },
      );
    },
  );
}

Future<List<RecebimentoClass>> findRecebimentopMes() {
  return CreateDBRecebimento().then(
        (db) {
      return db.query('RecebimentoDB', orderBy: "pagou", where: "mesN = $MesEscolhido").then(
            (maps) {
          RecebimentoClasses = [];
          for (Map<String, dynamic> map in maps) {
            final RecebimentoClass recebimentoClass = RecebimentoClass(
              map["id"],
              map["jogador"],
              map["pagou"],
              map["valor"],
              map["mesN"],
            );
            RecebimentoClasses.add(recebimentoClass);
          }
          RecebimentoClasses.last.id != null
              ? LastRecebimentoId = RecebimentoClasses.last.id
              : LastRecebimentoId = 0;
          NewRecebimentoId = LastRecebimentoId + 1;
          return RecebimentoClasses;
        },
      );
    },
  );
}

bool TemDataRecebimentopMes = false;

DeleteDataRecebimento() {
  return CreateDBRecebimento().then(
    (db) {
      return db.query('RecebimentoDB').then(
        (dbPath) {
          db.execute("DELETE FROM RecebimentoDB WHERE id > -1");
        },
      );
    },
  );
}

DeleteSelectedDataRecebimento() {
  return CreateDBRecebimento().then(
    (db) {
      return db.query('RecebimentoDB').then(
        (dbPath) {
          db.execute(
              "DELETE FROM RecebimentoDB WHERE id=${ClickedJogadorApagId}");
        },
      );
    },
  );
}

DeleteDataRecebimento2() {
  return CreateDBRecebimento().then(
        (db) {
      return db.query('RecebimentoDB').then(
            (dbPath) {
              db.rawDelete("DELETE FROM RecebimentoDB WHERE jogador=${ClickedJogadorNome}");
              db.execute(
                  "DELETE FROM RecebimentoDB WHERE jogador=${ClickedJogadorNome}");
        },
      );
    },
  );
}
