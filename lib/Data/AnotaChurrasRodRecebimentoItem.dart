import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seufutebol/Data/ChurrascoData.dart';
import 'package:seufutebol/Data/ChurrascoRodadaData.dart';
import 'package:seufutebol/Data/DataAnotacao.dart';
import 'package:seufutebol/Data/RecebimentoData.dart';
import 'package:seufutebol/Data/temasave.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/Anotacaomes.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/Recebimentomes.dart';

int idClicked = 0;

class ChurrasItem extends StatefulWidget {
  final ChurrasClass ItemChurras;

  ChurrasItem(this.ItemChurras);

  @override
  _ChurrasItemState createState() => _ChurrasItemState();
}

class _ChurrasItemState extends State<ChurrasItem> {
  Color CorItem = Colors.white12;

  @override
  Widget build(BuildContext context) {
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
                  title: Text(
                    widget.ItemChurras.data,
                    textScaleFactor: 1.25,
                  ),
                  subtitle: Text(
                    widget.ItemChurras.responsaveis,
                    textScaleFactor: 1.25,
                  ),
                ),
              ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Deletar',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    setState(() {
                      idClicked = widget.ItemChurras.id;
                    });
                    DeleteSelectedDataChurras();
                    Navigator.pushReplacementNamed(context, "ChurrasLista");
                    showDialog(
                        context: context,
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Carregando..."),
                                    ),
                                    Center(
                                        child: SpinKitRing(
                                      color: Colors.white,
                                      size: 100,
                                      lineWidth: 10,
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                    findChurras();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EditorSelectorAnota extends StatefulWidget {
  final AnotacaoClass ItemAnotacao;

  EditorSelectorAnota(this.ItemAnotacao);

  @override
  _EditorSelectorAnotaState createState() => _EditorSelectorAnotaState();
}

class _EditorSelectorAnotaState extends State<EditorSelectorAnota> {
  bool carregouAnotacao = false;
  double heigtitem = 75;

  @override
  Widget build(BuildContext context) {
    if (carregouAnotacao == false) {
      carregouAnotacao = true;
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
                height: heigtitem,
                color: temaload == ThemeData.light()
                    ? Colors.white
                    : Colors.white12,
                child: ListTile(
                  leading: heigtitem != 0 ? Icon(Icons.arrow_right) : null,
                  title: Text(
                    widget.ItemAnotacao.data,
                    textScaleFactor: 1.25,
                  ),
                  subtitle: Text(
                    widget.ItemAnotacao.descricao,
                    textScaleFactor: 1.25,
                  ),
                ),
              ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Deletar',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    setState(() {
                      heigtitem = 0;
                      idClicked = widget.ItemAnotacao.id;
                    });
                    DeleteSelectedDataAnotacao();
                    Navigator.pushReplacementNamed(context, "AnotacaoLista");
                    showDialog(
                      context: context,
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EditorSelectorChurraRod extends StatefulWidget {
  final ChurrasRodClass ItemChurrasRod;

  EditorSelectorChurraRod(this.ItemChurrasRod);

  @override
  _EditorSelectorChurraRod createState() => _EditorSelectorChurraRod();
}

class _EditorSelectorChurraRod extends State<EditorSelectorChurraRod> {
  TextEditingController Valor_ctrl = TextEditingController();
  Color CorItem = Colors.red;
  String Pagou = "";
  bool carregouChurrasRod = false;

  @override
  Widget build(BuildContext context) {
    Pagou = widget.ItemChurrasRod.pagou;
    if (carregouChurrasRod == false) {
      if (widget.ItemChurrasRod.pagou == "não") {
        if (widget.ItemChurrasRod.timeJogador == 1) {
          setState(() {
            CorItem = Colors.blue;
          });
        } else {
          setState(() {
            CorItem = Colors.red;
          });
        }
      } else {
        if (widget.ItemChurrasRod.pagou == "sim") {
          setState(() {
            CorItem = Colors.green;
          });
        }
      }
      carregouChurrasRod = true;
    }
    Valor_ctrl.text = widget.ItemChurrasRod.valor.toString();
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
                    widget.ItemChurrasRod.jogador,
                    textScaleFactor: 1.25,
                  ),
                  subtitle: CorItem == Colors.green
                      ? Text("R\$ " + Valor_ctrl.text)
                      : null,
                ),
              ),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Pagou',
                  color: Colors.green,
                  icon: Icons.attach_money,
                  onTap: () {
                    Valor_ctrl.text = widget.ItemChurrasRod.valor.toString();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Salvar Pagamento Churasco"),
                            content: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text("Valor Pago"),
                                  ),
                                  TextField(
                                    controller: Valor_ctrl,
                                    keyboardType: TextInputType.number,
                                  )
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  if(Valor_ctrl.text.contains(",")){
                                    Valor_ctrl.text = Valor_ctrl.text.replaceAll(",", ".");
                                  }
                                  setState(() {
                                    idClicked = widget.ItemChurrasRod.id;
                                    CorItem = Colors.green;
                                  });
                                  updateChurrasRodPago(ChurrasRodClass(
                                      widget.ItemChurrasRod.id,
                                      widget.ItemChurrasRod.jogador,
                                      widget.ItemChurrasRod.timeJogador,
                                      "sim",
                                      double.parse(Valor_ctrl.text)));
                                  findChurrasRod();
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Salvar",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancelar",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                ),
              ],
              secondaryActions: [
                IconSlideAction(
                  caption: 'Não Pagou',
                  color: widget.ItemChurrasRod.timeJogador == 1
                      ? Colors.blue
                      : Colors.red,
                  icon: Icons.money_off,
                  onTap: () {
                    if (widget.ItemChurrasRod.timeJogador == 1) {
                      setState(() {
                        CorItem = Colors.blue;
                      });
                    } else {
                      setState(() {
                        CorItem = Colors.red;
                      });
                    }
                    updateChurrasRodPago(ChurrasRodClass(
                        widget.ItemChurrasRod.id,
                        widget.ItemChurrasRod.jogador,
                        widget.ItemChurrasRod.timeJogador,
                        "não",
                        widget.ItemChurrasRod.valor));
                    findChurrasRod();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EditorSelectorRecebimento extends StatefulWidget {
  final RecebimentoClass ItemRecebimento;

  EditorSelectorRecebimento(this.ItemRecebimento);

  @override
  _EditorSelectorRecebimentoState createState() =>
      _EditorSelectorRecebimentoState();
}

bool onRecebimento = false;

class _EditorSelectorRecebimentoState extends State<EditorSelectorRecebimento> {
  TextEditingController ctrl_valor = TextEditingController();
  Color CorItem = Colors.white12;
  bool carregouRecebimento = false;

  @override
  Widget build(BuildContext context) {
    if (onRecebimento == true) {
      if (carregouRecebimento == false) {
        if (widget.ItemRecebimento.pagou == "nao") {
          setState(() {
            CorItem = Colors.red;
          });
        } else {
          setState(() {
            CorItem = Colors.green;
          });
        }
        carregouRecebimento = true;
      }
    }
    ctrl_valor.text = widget.ItemRecebimento.valor.toString();
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          child: Padding(
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
                      widget.ItemRecebimento.nome,
                      textScaleFactor: 1.25,
                    ),
                    subtitle: CorItem == Colors.green
                        ? Text("R\$ " + ctrl_valor.text)
                        : null,
                  ),
                ),
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Pagou',
                    color: Colors.green,
                    icon: Icons.attach_money,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Salvar Pagamento do Mês"),
                              content: Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text("Valor Pago"),
                                    ),
                                    TextField(
                                      controller: ctrl_valor,
                                      keyboardType: TextInputType.number,
                                    )
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      idClicked = widget.ItemRecebimento.id;
                                      CorItem = Colors.green;
                                    });
                                    editRecebimentoNaoPago(RecebimentoClass(
                                        widget.ItemRecebimento.id,
                                        widget.ItemRecebimento.nome,
                                        "sim",
                                        ctrl_valor.text,
                                        widget.ItemRecebimento.mesN));
                                    findRecebimentopMes();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Salvar",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancelar",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
                secondaryActions: [
                  IconSlideAction(
                    caption: 'Não Pagou',
                    color: Colors.red,
                    icon: Icons.money_off,
                    onTap: () {
                      setState(() {
                        idClicked = widget.ItemRecebimento.id;
                        CorItem = Colors.red;
                      });
                      editRecebimentoNaoPago(RecebimentoClass(
                          widget.ItemRecebimento.id,
                          widget.ItemRecebimento.nome,
                          "nao",
                          "00.00",
                          widget.ItemRecebimento.mesN));
                      findRecebimentopMes();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
