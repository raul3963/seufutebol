import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seufutebol/Data/DataAnotacao.dart';
import 'package:seufutebol/Models/DatePickerModel.dart';
import 'package:seufutebol/Models/TextFieldModel.dart';
import 'package:seufutebol/main.dart';

String coiso = "";
bool EditandoJogador = false;
int EditandoJogadorCount = 0;
String TituloDataAnotacao = "Data";
DateTime AnotacaoData = DateTime.now();

final TextEditingController ctrl_desc = TextEditingController();
DateTime DataAnotacao = DateTime.now();

class AnotacaoForm extends StatefulWidget {
  @override
  _AnotacaoFormState createState() => _AnotacaoFormState();
}

class _AnotacaoFormState extends State<AnotacaoForm> {
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$TitleAppBar"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ShortTextFieldModel("Descrição", ctrl_desc, TextInputType.name),
            DateTimePickerModelAnota("Data"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    if (DataAnotacao != DateTime.now()) {
                      if (ctrl_desc != "") {
                        saveAnotacao(AnotacaoClass(
                            NewAnotaId,
                            DataAnotacao.day.toString() +
                                "/" +
                                DataAnotacao.month.toString() +
                                "/" +
                                DataAnotacao.year.toString(),
                            DataAnotacao.toString(),
                            ctrl_desc.text));
                        Timer(Duration(milliseconds: 250), () {
                          ctrl_desc.text = "";
                        });

                        Timer(Duration(milliseconds: 500), () {
                          Navigator.pop(context);
                        });
                        Timer(Duration(milliseconds: 600), () {
                          Navigator.popAndPushNamed(context, "AnotacaoLista");
                        });
                      } else {
                        setState(() {
                          message = "Preencha todos os campos";
                        });
                      }
                    } else {
                      setState(() {
                        message = "Preencha todos os campos";
                      });
                    }

                    NewAnotaId += 1;
                    findAnotacao();

                  }),
            ),
            Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
