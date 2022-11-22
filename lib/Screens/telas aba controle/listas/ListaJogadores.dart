import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seufutebol/Data/JogadorData.dart';
import 'package:seufutebol/Models/TextJogadorNomeModel.dart';

import '../../../main.dart';

int ClickedJogadorApagId = -1;
double ValorAntigoJog = 00.00;
class ListaJogadores extends StatefulWidget {
  const ListaJogadores({Key? key}) : super(key: key);

  @override
  _ListaJogadoresState createState() => _ListaJogadoresState();
}

class _ListaJogadoresState extends State<ListaJogadores> {
  @override
  Widget build(BuildContext context) {

    loading == 1?
    Mensagem = 0:
    Mensagem = Mensagem;
    TitleAppBar = "Lista de Jogadores";
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
                  return JogadorTextEdit(Item);
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
