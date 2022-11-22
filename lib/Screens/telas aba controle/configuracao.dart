import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:seufutebol/Data/all.dart';
import 'package:seufutebol/Data/temasave.dart';
import 'package:seufutebol/main.dart';

class Config extends StatefulWidget {
  const Config({Key? key}) : super(key: key);

  @override
  _ConfigState createState() => _ConfigState();
}

bool temaRadio = false;

bool value = false;

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(TemaDark);
    TitleAppBar = "Configurações";
    return Scaffold(
      appBar: AppBar(
        title: Text(TitleAppBar),
      ),
      body: ListView(
        children: [
          Center(
            child: InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Center(
                        child: Text(
                      "Apagar Todos os Dados",
                      textScaleFactor: 1.5,
                    )),
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(
                          child: Text("Você Deseja Apagar Todos os Dados?"),
                        ),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Assim que clicar em "Apagar dados" não será possivel recuperar os dados apagados'),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlatButton(
                              color: Colors.blue,
                              height: 50,
                              onPressed: () {
                                DeleteAllData();
                                Timer(Duration(milliseconds: 500), () {
                                  FindAllData();
                                });
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Text("Apagar dados"),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Tema"),
                      )),
                    ],
                  ),
                  Container(
                    width: width / 3 + width / 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              TemaDark = false;
                              DeleteTema();
                              if (TemaDark == true) {
                                saveTema(TemaClass(1));
                                setState(() {
                                  tema = ThemeData.dark();
                                });
                              } else {
                                saveTema(TemaClass(0));
                                setState(() {
                                  tema = ThemeData.light();
                                });
                              }
                              findTema();
                              main();
                            },
                            child: Text("Claro")),
                        TextButton(
                            onPressed: () {
                              TemaDark = true;
                              DeleteTema();
                              if (TemaDark == true) {
                                saveTema(TemaClass(1));
                                setState(() {
                                  tema = ThemeData.dark();
                                });
                              } else {
                                saveTema(TemaClass(0));
                                setState(() {
                                  tema = ThemeData.light();
                                });
                              }
                              findTema();
                              main();
                            },
                            child: Text("Escuro")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

bool TemaDark = false;

// if (TemaDark == true) {
// saveTema(TemaClass(1));
// setState(() {
// tema = ThemeData.dark();
// });
// } else {
// saveTema(TemaClass(0));
// setState(() {
// tema = ThemeData.light();
// });
// }
// findTema();
// main();
