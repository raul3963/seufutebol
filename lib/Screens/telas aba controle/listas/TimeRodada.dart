import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seufutebol/Data/JogadorData.dart';
import 'package:seufutebol/Models/TextJogadorNomeModel.dart';
import '../../../main.dart';

class TimeRodada extends StatefulWidget {
  @override
  _TimeRodadaState createState() => _TimeRodadaState();
}

class _TimeRodadaState extends State<TimeRodada> {
  @override

  Widget build(BuildContext context) {
    loading == 1?
    Mensagem = 0:
    Mensagem = Mensagem;
    TitleAppBar = "Criar Time da Rodada";
    return Scaffold(
      appBar: AppBar(
        title: Text("$TitleAppBar"),
      ),
      body: Center(
        child: FutureBuilder<List<JogadorClass>>(
          future: Future.delayed(Duration(seconds: 1))
              .then((value) => findJogador()),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              final List<JogadorClass> jogadorClass =
              snapshot.data as List<JogadorClass>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final JogadorClass Item = jogadorClass[index];
                  return JogadorNomeTextModelTime(Item);
                },
                itemCount:
                jogadorClass.length == null ? 0 : jogadorClass.length,
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
