import 'package:flutter/material.dart';

import '../main.dart';

class firstscreengroup extends StatefulWidget {
  const firstscreengroup({Key? key}) : super(key: key);

  @override
  _firstscreengroupState createState() => _firstscreengroupState();
}

class _firstscreengroupState extends State<firstscreengroup> {
  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                    height: 100,
                    child: Center(child: Text("criar grupo")),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "CriarGrupo");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                  height: 100,
                  child: Center(child: Text("Meus grupos")),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "CriarGrupo");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Container(
                  height: 50,
                  child: Center(child: Text("entrar em grupo")),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "CriarGrupo");
                },
              ),
            )
          ],
        ));
  }
}
