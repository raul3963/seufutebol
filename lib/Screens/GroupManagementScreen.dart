import 'package:flutter/material.dart';
import 'package:seufutebol/Data/temasave.dart';
import 'package:seufutebol/Models/CardModel.dart';
import 'package:seufutebol/Models/TextJogadorNomeModel.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/configuracao.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/form/CadastroJogadorForm.dart';
import '../main.dart';

class GroupManagementScreen extends StatefulWidget {
  @override
  _GroupManagementScreenState createState() => _GroupManagementScreenState();
}

bool onGroupManage = false;

class _GroupManagementScreenState extends State<GroupManagementScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      ctrl_nome.text = "";
      ctrl_celular.text = "";
      ctrl_time.text = "";
      setState(() {
        TituloJogadorData = "Data de Nascimento";
        DataSelecionadoJogador = "";
      });
      EditandoJogador = false;
    });
    onGroupManage = true;
    TitleAppBar = "Controle De Grupo";
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
      body: Center(
        child: ListView(
          children: <Widget>[
            InkWell(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Card(
                          color: TemaDark == false? Colors.white: Colors.white10,
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            title: Row(
                              children: [
                                Icon(Icons.home),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  child:
                                      Text("Administração", textScaleFactor: 2),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              //CardModelNav("Criar Grupo", "CriarGrupo"),
                              CardModelNav(
                                  "Cadastrar Jogadores", "CadastroJogador", Icons.person_add),
                              CardModelNav(
                                  "Criar Time Rodada", "TimeRodadaCreate", Icons.group),
                              CardModelNav(
                                  "Recebimentos do Grupo", "RecebimentoMes", Icons.attach_money),
                              CardModelNav("Churrasco do Mês", "ChurrasLista", Icons.food_bank_outlined),
                              CardModelNav(
                                  "Churrasco da Rodada", "ChurrascoRodada",Icons.food_bank_outlined),
                              CardModelNav(
                                  "Aniversarios do Mês", "AniversarioMes", Icons.cake),
                              CardModelNav("Anotações", "AnotacaoLista", Icons.note_add_outlined),
                            ],
                          ),
                        ),
                        // Card(
                        //   color: Colors.white10,
                        //   child: ExpansionTile(
                        //     title: Row(
                        //       children: [
                        //         Icon(Icons.group),
                        //         Padding(
                        //           padding:
                        //               const EdgeInsets.symmetric(horizontal: 6),
                        //           child: Text("Grupos", textScaleFactor: 2),
                        //         ),
                        //       ],
                        //     ),
                        //     children: <Widget>[
                        //       CardModelNav(
                        //           "Maiores Vencedores do Grupo", "Home"),
                        //       CardModelNav("Ver Outros Grupos", "Home"),
                        //       CardModelNav(
                        //           "Maiores Vencedores de Todos os Grupos",
                        //           "Home"),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
