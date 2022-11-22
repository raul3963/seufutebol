import 'package:flutter/material.dart';
import 'package:seufutebol/Data/GroupData.dart';
import 'package:seufutebol/Models/TextFieldModel.dart';
import 'package:seufutebol/main.dart';

class CadastroGrupoForm extends StatefulWidget {
  @override
  _CadastroGrupoFormState createState() => _CadastroGrupoFormState();
}

class _CadastroGrupoFormState extends State<CadastroGrupoForm> {
  final TextEditingController ctrl_nome = TextEditingController();

  final TextEditingController ctrl_desc = TextEditingController();
  String _printedMessage = "";

  @override
  Widget build(BuildContext context) {
    TitleAppBar = "Cadastrar Grupo";
    return Scaffold(
      appBar: AppBar(
        title: Text("$TitleAppBar"),

      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            TextFieldModel("Nome do Grupo", ctrl_nome, TextInputType.text),
            TextFieldModel("Descrição", ctrl_desc, TextInputType.text),
            Text(_printedMessage),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    saveGrupo(
                        GrupoClass(NewGroupId, ctrl_nome.text, ctrl_desc.text));
                    findGrupos();
                    setState(() {
                      _printedMessage = "Nome: " +
                          ctrl_nome.text +
                          "\n" +
                          "Descrição: " +
                          ctrl_desc.text;
                    });
                  }),

            )
          ],
        ),
      ),
    );
  }
}
