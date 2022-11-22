import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seufutebol/Data/AnotaChurrasRodRecebimentoItem.dart';
import 'package:seufutebol/Data/ChurrascoRodadaData.dart';
import 'package:seufutebol/Data/DataAnotacao.dart';
import '../../../main.dart';

int TimePerdedor = -1;

bool OnChurrasRod = false;

class ChurrasRodada extends StatefulWidget {
  @override
  _ChurrasRodadaState createState() => _ChurrasRodadaState();
}

String selectedChurascoRodada = "";

class _ChurrasRodadaState extends State<ChurrasRodada> {
  @override
  Widget build(BuildContext context) {

    loading == 1?
    Mensagem = 0:
    Mensagem = Mensagem;
    OnChurrasRod = true;
    TitleAppBar = "Churrasco da Rodada";
    double widthsobrando = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      appBar: AppBar(
        title: Text("$TitleAppBar"),
        actions: <Widget>[
          Container(
            color: TimePerdedor == 1
                ? Colors.blue
                : TimePerdedor == 2
                    ? Colors.red
                    : Colors.white12,
            child: IconButton(
              icon: Icon(
                Icons.group,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text("Time perdedor"),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Selecione o time perdedor da rodada"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                              height: 50,
                              color: Colors.blue,
                              child: Center(
                                child: Text("Time 1"),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              if (selectedChurascoRodada != "Time 1") {
                                Navigator.pushReplacementNamed(
                                    context, "ChurrascoRodada");
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                setState(() {
                                  TimePerdedor = 1;
                                  selectedChurascoRodada = "Time 1";
                                });
                              }
                              findChurrasRod();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                              height: 50,
                              color: Colors.red,
                              child: Center(
                                child: Text("Time 2"),
                              ),
                            ),
                            onTap: () {
                              findChurrasRod();
                              Navigator.pop(context);
                              if (selectedChurascoRodada != "Time 2") {
                                Navigator.pushReplacementNamed(
                                    context, "ChurrascoRodada");
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                setState(() {
                                  TimePerdedor = 2;
                                  selectedChurascoRodada = "Time 2";
                                });
                              }
                              findChurrasRod();
                            },
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<ChurrasRodClass>>(
          future: Future.delayed(Duration(seconds: 1))
              .then((value) => findChurrasRodpTime()),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.data!.length != 0) {
                final List<ChurrasRodClass> churrasRodClass =
                    snapshot.data as List<ChurrasRodClass>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final ChurrasRodClass Item = churrasRodClass[index];
                    return EditorSelectorChurraRod(Item);
                  },
                  itemCount: churrasRodClass.length == null
                      ? 0
                      : churrasRodClass.length,
                );
              } else {
                temDataChurrasRodpt == true
                    ? Center(child: Text("Carregando..."))
                    : Center(child: Text("Nenhum dado encontrado"));
              }
            } else {
              temDataChurrasRodpt == true
                  ? Center(child: Text("Carregando..."))
                  : Center(child: Text("Nenhum dado encontrado"));
            }
            return TimePerdedor == -1
                ? Center(child: Text("Selecione um time perdedor"))
                : temDataChurrasRodpt == true
                    ? Center(child: Text("Carregando..."))
                    : Center(child: Text("Nenhum dado encontrado"));
          },
        ),
      ),
    );
  }
}
