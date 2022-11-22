import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seufutebol/Data/ChurrascoRodadaData.dart';
import 'package:seufutebol/Data/JogadorData.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seufutebol/Data/RecebimentoData.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/configuracao.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/form/CadastroJogadorForm.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/ListaJogadores.dart';
import '../main.dart';

int ItemRecebimentoTapId = 0;
int ItemChurrasRodTapId = 0;
int ItemChurrasRodTapTime = 0;
String ItemRecebimentoTapPagou = "";
String ItemChurrasRodTapPagou = "";
String ClickedJogadorNome = "";

class JogadorTextEditAniversario extends StatefulWidget {
  final JogadorClass Item;

  JogadorTextEditAniversario(this.Item);

  @override
  _JogadorTextEditAniversarioState createState() =>
      _JogadorTextEditAniversarioState();
}

class _JogadorTextEditAniversarioState
    extends State<JogadorTextEditAniversario> {
  int Size = 0;

  @override
  Widget build(BuildContext context) {
    return DateTime
        .parse(widget.Item.dataNascmientoRaw)
        .month ==
        DateTime
            .now()
            .month
        ? Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.white12,
          child: ListTile(
            trailing: Text(widget.Item.dataNascmiento),
            title: Text(
              widget.Item.nome,
              textScaleFactor: 1.25,
            ),
          ),
        ),
      ],
    )
        : Container(
      height: 0,
      width: 0,
    );
  }
}

class JogadorNomeTextModelTime extends StatefulWidget {
  final JogadorClass Item;

  JogadorNomeTextModelTime(this.Item);

  @override
  _JogadorNomeTextModelTimeState createState() =>
      _JogadorNomeTextModelTimeState();
}

class _JogadorNomeTextModelTimeState extends State<JogadorNomeTextModelTime> {
  Color CorItem = Colors.white12;
  int idTime = 0;
  bool carregou = false;

  @override
  Widget build(BuildContext context) {
    if (carregou == false) {
      if (widget.Item.idTime == 1) {
        setState(() {
          CorItem = Colors.blue;
        });
      } else {
        if (widget.Item.idTime == 2) {
          setState(() {
            CorItem = Colors.red;
          });
        }
      }
      carregou = true;
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: InkWell(
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                color: CorItem,
                child: ListTile(
                  leading: Icon(Icons.arrow_right),
                  trailing: Icon(Icons.arrow_left),
                  title: Text(
                    widget.Item.nome,
                    textScaleFactor: 1.25,
                  ),
                ),
              ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Time 1',
                  color: Colors.blue,
                  icon: Icons.group,
                  onTap: () {
                    setState(() {
                      idTime = 1;
                      ClickedTimeRodId = widget.Item.id;
                      CorItem = Colors.blue;
                    });

                    updateChurrasRodTime(ChurrasRodClass(widget.Item.id,
                        widget.Item.nome, idTime, "não", 00.00));
                    updateJogadorTime(JogadorClass(
                        widget.Item.id,
                        widget.Item.idGrupo,
                        idTime,
                        widget.Item.nome,
                        widget.Item.celular,
                        widget.Item.dataNascmiento,
                        widget.Item.dataNascmientoRaw,
                        widget.Item.timeCoracao,
                        widget.Item.valormes
                    ));
                    findJogador();
                    findChurrasRod();
                  },
                ),
              ],
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Time 2',
                  color: Colors.red,
                  icon: Icons.group,
                  onTap: () {
                    setState(() {
                      ClickedTimeRodId = widget.Item.id;
                      idTime = 2;
                      CorItem = Colors.red;
                    });
                    updateChurrasRodTime(ChurrasRodClass(widget.Item.id,
                        widget.Item.nome, idTime, "não", 00.00));
                    updateJogadorTime(JogadorClass(
                        widget.Item.id,
                        widget.Item.idGrupo,
                        idTime,
                        widget.Item.nome,
                        widget.Item.celular,
                        widget.Item.dataNascmiento,
                        widget.Item.dataNascmientoRaw,
                        widget.Item.timeCoracao,
                        widget.Item.valormes));
                    findChurrasRod();
                    findJogador();
                  },
                ),
              ],
            ),
            onTap: () =>
                setState(
                      () {
                    idTime = 0;
                    updateChurrasRodTime(ChurrasRodClass(
                        widget.Item.id, widget.Item.nome, idTime, "não",
                        00.00));
                    updateJogadorTime(JogadorClass(
                        widget.Item.id,
                        widget.Item.idGrupo,
                        idTime,
                        widget.Item.nome,
                        widget.Item.celular,
                        widget.Item.dataNascmiento,
                        widget.Item.dataNascmientoRaw,
                        widget.Item.timeCoracao,
                        widget.Item.valormes));
                    CorItem = Colors.white12;
                    findChurrasRod();
                  },
                ),
          ),
        ),
      ],
    );
  }
}

int ClickedTimeRodId = -1;
int ClickedJogadorEditId = -1;

class JogadorTextEdit extends StatefulWidget {
  final JogadorClass Item;

  JogadorTextEdit(this.Item);

  @override
  _JogadorTextEditState createState() => _JogadorTextEditState();
}

String jogadoreditNome = "";

class _JogadorTextEditState extends State<JogadorTextEdit> {
  String campoNome = "";
  String campoCelular = "";
  String campovalor = "";
  DateTime campoData = DateTime.now();
  String campoTime = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 1,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: InkWell(
          child: Card(
            child: Column(
              children: <Widget>[
                Text(
                  widget.Item.nome,
                  textScaleFactor: 1.25,
                ),
                Text(
                  "Nascimento:  " +
                      widget.Item.dataNascmiento +
                      "\n" +
                      "Telefone/Celular:  " +
                      widget.Item.celular +
                      "\n" +
                      "Time favorito:  " +
                      widget.Item.timeCoracao +
                      "\n" +
                      "Paga Mensalmente:  " +
                      widget.Item.valormes.toString(),
                  textScaleFactor: 1,
                ),
              ],
            ),
          ),
          onTap: () {
            jogadoreditNome = widget.Item.nome;
            campoNome = widget.Item.nome;
            campoCelular = widget.Item.celular;
            campoTime = widget.Item.timeCoracao;
            campovalor = widget.Item.valormes.toString();

            setState(() {
              EditandoJogador = true;
            });

            ClickedJogadorEditId = widget.Item.id;
            ctrl_nome.text = campoNome;
            ctrl_celular.text = campoCelular;
            ctrl_time.text = campoTime;
            ctrl_valorjog.text = campovalor;
            ValorAntigoJog = widget.Item.valormes;
            setState(
                  () {
                TituloJogadorData = widget.Item.dataNascmiento;
              },
            );
            Navigator.popAndPushNamed(context, "CadastroJogador");
          },
          onLongPress: () {
            ClickedJogadorNome = widget.Item.nome;
            ClickedJogadorApagId = widget.Item.id;
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(
                      child: Text("Apagar Item"),
                    ),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Deseja apagar o item selecionado?'),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          color: Colors.blue,
                          height: 50,
                          onPressed: () {
                            DeleteDataRecebimento2();
                            DeleteSelectedDataJogador();
                            DeleteSelectedDataChurrasRod();
                            DeleteSelectedDataRecebimento();
                            Timer(Duration(milliseconds: 500), () {
                              findJogador();
                              findChurrasRod();
                              findRecebimento();
                            });
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, "ListaJogadores");
                            showDialog(context: context,
                                builder: (BuildContext context) {
                                  Timer(Duration(milliseconds: 1500), () {
                                    Navigator.pop(context);
                                  });
                                  return Center(
                                    child: Container(
                                      height: 250,
                                      child: Dialog(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Text("Carregando..."),
                                            ),
                                            Center(child: SpinKitRing(
                                              color: Colors.white,
                                              size: 100,
                                              lineWidth: 10,))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Center(
                            child: Text("Apagar Item"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          color: Colors.red,
                          height: 50,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text("Cancelar"),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}

String DataSelecionadoJogador = "";
