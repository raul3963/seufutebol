import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seufutebol/Data/ChurrascoData.dart';
import 'package:seufutebol/Data/ChurrascoRodadaData.dart';
import 'package:seufutebol/Models/DatePickerModel.dart';
import 'package:seufutebol/Models/TextFieldModel.dart';
import '../../../main.dart';

String DataChurrascoAll = "";
String ResponsavelChurrascoAll = "";
DateTime ChurrascoData = DateTime.now();

class ChurrascoForm extends StatefulWidget {
  @override
  _ChurrascoFormState createState() => _ChurrascoFormState();
}

class _ChurrascoFormState extends State<ChurrascoForm> {
  final TextEditingController responsavel = TextEditingController();

  DateTime dataChurrasco = DateTime.now();

  @override
  Widget build(BuildContext context) {
    setState(() {
      TitleAppBar = "Novo Churrasco";
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("$TitleAppBar"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            DateTimePickerModelChurras("Dia do Churrasco"),
            TextFieldModel("Responsaveis", responsavel, TextInputType.text),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    setState(
                      () {
                        ResponsavelChurrascoAll = responsavel.text;
                      },
                    );
                    saveChurras(
                      ChurrasClass(
                          NewChurrasId,
                          ChurrascoData.day.toString() + "/" + ChurrascoData.month.toString() + "/" + ChurrascoData.year.toString(),
                          responsavel.text),
                    );
                    findChurras();
                    Timer(Duration(milliseconds: 500), () {
                      Navigator.pop(context);
                    });
                    Timer(Duration(milliseconds: 600), () {
                      Navigator.popAndPushNamed(context, "ChurrasLista");
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
