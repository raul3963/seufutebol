import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seufutebol/Data/ChurrascoRodadaData.dart';
import 'package:seufutebol/Data/JogadorData.dart';
import 'package:seufutebol/Data/RecebimentoData.dart';
import 'package:seufutebol/Models/CardModel.dart';
import 'package:seufutebol/Models/DatePickerModel.dart';
import 'package:seufutebol/Models/TextFieldModel.dart';
import 'package:seufutebol/Models/TextJogadorNomeModel.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/form/CadastroJogadorForm.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/ListaJogadores.dart';

import '../../main.dart';

class finalreg extends StatefulWidget {
  const finalreg({Key? key}) : super(key: key);

  @override
  _finalregState createState() => _finalregState();
}

class _finalregState extends State<finalreg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$TitleAppBar"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[

            TextFieldModel("Nome Completo", ctrl_nome, TextInputType.name),
            DateTimePickerModel(TituloJogadorData),
            TextFieldModel("Time do Coração", ctrl_time, TextInputType.text),
            TextFieldModel(
                "Paga Mensalmente", ctrl_valorjog, TextInputType.number),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    Navigator.pushNamed(context, "aaaaaa");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
