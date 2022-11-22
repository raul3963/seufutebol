// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seufutebol/Data/RecebimentoData.dart';
import 'package:seufutebol/Screens/GroupManagementScreen.dart';
import 'package:seufutebol/Screens/load.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/configuracao.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/form/CadastroJogadorForm.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/ListaJogadores.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/TimeRodada.dart';
import 'Data/all.dart';
import 'Data/temasave.dart';
import 'Screens/Register/Register1.dart';
import 'Screens/Register/autentificar.dart';
import 'Screens/Register/finalregist.dart';
import 'Screens/fisrtGroup.dart';
import 'Screens/telas aba controle/listas/AniversarioMes.dart';
import 'Screens/telas aba controle/listas/Anotacaomes.dart';
import 'Screens/telas aba controle/form/AnotacoesForm.dart';
import 'Screens/telas aba controle/form/ChurracoForm.dart';
import 'Screens/telas aba controle/form/formGrupo.dart';
import 'Screens/telas aba controle/listas/Churrasco lista.dart';
import 'Screens/telas aba controle/listas/ChurrascoRodada.dart';
import 'Screens/telas aba controle/listas/Recebimentomes.dart';

void main() {
//  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  runApp(MyApp());
  FindAllData();
  findRecebimento();
}

ThemeData tema = ThemeData.light();
int newRecebiemntoId = 0;
int IdGrupoAtual = 1;
String TituloJogadorData = "Data de Nascimento";
String TitleAppBar = "Home";

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "autpage": (context) => AutentificatePage(),
        "aaaaaa": (context) => firstscreengroup(),
        "registrarfim": (context) => finalreg(),
        "Configuracao": (context) => Config(),
        "RecebimentoMes": (context) => Recebimento(),
        "AnotacoesForm": (context) => AnotacaoForm(),
        "AnotacaoLista": (context) => AnotacoesMes(),
        "GroupManageScreen": (context) => GroupManagementScreen(),
        "CadastroJogador": (context) => CadastroJogadorForm(),
        "ListaJogadores": (context) => ListaJogadores(),
        "ChurrascoForm": (context) => ChurrascoForm(),
        "ChurrascoRodada": (context) => ChurrasRodada(),
         "CriarGrupo": (context) => CadastroGrupoForm(),
        "TimeRodadaCreate": (context) => TimeRodada(),
        "ChurrasLista": (context) => ChurrasLista(),
        "AniversarioMes": (context) => ListaAniversarioMes(),
      },
      theme: TemaDark == false
          ? ThemeData(
              brightness: Brightness.light,
              accentColor: Colors.blue,
              cardColor: Colors.white70,
              buttonColor: Colors.lightBlue,
      )
          : ThemeData.dark(),
      home: GroupManagementScreen()
    );
  }
}

retorno(){
  return Center(child: Text("Nenhum Dado Encontrado"),);
}

int Mensagem = 0;
int loading = 0;