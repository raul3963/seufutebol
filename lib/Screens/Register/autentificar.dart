import 'dart:async';

import 'package:flutter/material.dart';

import '../../main.dart';
import 'Register1.dart';

class AutentificatePage extends StatefulWidget {
  const AutentificatePage({Key? key}) : super(key: key);

  @override
  _AutentificatePageState createState() => _AutentificatePageState();
}

class _AutentificatePageState extends State<AutentificatePage> {
  @override


  Widget build(BuildContext context) {
    String textoali = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("$TitleAppBar"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "Configuracao");
              },
              icon: Icon(Icons.build))
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
//                    labelText: "${CTRL_Telefone.text}",
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "475623"),
              ),
            )
          ),
          Container(
              child: RaisedButton(
            child: Text("Verificar"),
            onPressed: () {
              Navigator.pushNamed(context, "registrarfim");
            },
          ))
        ],
      ),
    );
  }
}
