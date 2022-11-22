import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seufutebol/Data/AnotaChurrasRodRecebimentoItem.dart';
import 'package:seufutebol/Data/ChurrascoData.dart';
import '../../../main.dart';

class ChurrasLista extends StatefulWidget {
  @override
  _ChurrasListaState createState() => _ChurrasListaState();
}

class _ChurrasListaState extends State<ChurrasLista> {
  String Erro = "Carregando...";

  @override
  Widget build(BuildContext context) {

    loading == 1?
    Mensagem = 0:
    Mensagem = Mensagem;
    TitleAppBar = "Churrasco do Mês";
    return Scaffold(
      appBar: AppBar(
        title: Text("$TitleAppBar"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "ChurrascoForm");
            },
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<ChurrasClass>>(
          future: Future.delayed(Duration(seconds: 1))
              .then((value) => findChurras()),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
                final List<ChurrasClass> churrasClass =
                    snapshot.data as List<ChurrasClass>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final ChurrasClass Item = churrasClass[index];
                    return ChurrasItem(Item);
                  },
                  itemCount:
                      churrasClass.length == null ? 0 : churrasClass.length,
                );
            }else {
              Timer(Duration(seconds: 2), () {
                setState(() {
                  Mensagem = 1;
                  loading = 0;
                });
              });
            }
            return Mensagem == 1?Center(
              child: Text("Nenhum Dado Encontrado"),
            ):Center(
              child: Text("Carregando..."),
            );
          },
        ),
      ),
    );
  }
}
