import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seufutebol/Data/AnotaChurrasRodRecebimentoItem.dart';
import 'package:seufutebol/Data/DataAnotacao.dart';
import '../../../main.dart';

class AnotacoesMes extends StatefulWidget {
  @override
  _AnotacoesMesState createState() => _AnotacoesMesState();
}


class _AnotacoesMesState extends State<AnotacoesMes> {
  @override
  Widget build(BuildContext context) {

    loading == 1?
    Mensagem = 0:
    Mensagem = Mensagem;
    TitleAppBar = "Anotações";
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
              Navigator.pushNamed(context, "AnotacoesForm");
            },
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<AnotacaoClass>>(
          future: Future.delayed(Duration(seconds: 1))
              .then((value) => findAnotacao()),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              final List<AnotacaoClass> anotacaoClass =
                  snapshot.data as List<AnotacaoClass>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final AnotacaoClass Item = anotacaoClass[index];
                  return EditorSelectorAnota(Item);
                },
                itemCount:
                    anotacaoClass.length == null ? 0 : anotacaoClass.length,
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
