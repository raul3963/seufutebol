import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seufutebol/Data/ChurrascoRodadaData.dart';
import 'package:seufutebol/Data/JogadorData.dart';
import 'package:seufutebol/Data/RecebimentoData.dart';
import 'package:seufutebol/Models/CardModel.dart';
import 'package:seufutebol/Models/DatePickerModel.dart';
import 'package:seufutebol/Models/TextFieldModel.dart';
import 'package:seufutebol/Models/TextJogadorNomeModel.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/ListaJogadores.dart';
import 'package:seufutebol/main.dart';

String coiso = "";
bool EditandoJogador = false;
int EditandoJogadorCount = 0;

final TextEditingController ctrl_nome = TextEditingController();
final TextEditingController ctrl_celular = TextEditingController();
final TextEditingController ctrl_time = TextEditingController();
final TextEditingController ctrl_valorjog = TextEditingController();

DateTime DataNascimentoJogador = DateTime.now();

class CadastroJogadorForm extends StatefulWidget {
  @override
  _CadastroJogadorFormState createState() => _CadastroJogadorFormState();
}

class _CadastroJogadorFormState extends State<CadastroJogadorForm> {
  String message = "";
  bool shouldPop = true;

  @override
  Widget build(BuildContext context) {
    TitleAppBar = "Cadastrar Jogador";
    if (EditandoJogador == true) {
      EditandoJogadorCount = 1;
      EditandoJogador = false;
    } else {
      ValorAntigoJog = 00.00;
      EditandoJogadorCount = 0;
      ctrl_nome.text = "";
      ctrl_celular.text = "";
      ctrl_time.text = "";
      setState(() {
        TituloJogadorData = "Data de Nascimento";
        DataSelecionadoJogador = "";
      });
    }
    ctrl_valorjog.text = "00.00";
    return Scaffold(
      appBar: AppBar(
        title: Text("$TitleAppBar"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            CardModelNav("Lista de Jogadores", "ListaJogadores", Icons.list),
            TextFieldModel("Nome Completo", ctrl_nome, TextInputType.name),
            TextFieldModel("Celular", ctrl_celular,
                TextInputType.numberWithOptions(decimal: false)),
            DateTimePickerModel(TituloJogadorData),
            TextFieldModel("Time do Coração", ctrl_time, TextInputType.text),
            TextFieldModel(
                "Paga Mensalmente", ctrl_valorjog, TextInputType.number),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    if (ctrl_nome.text != "") {
                      if (ctrl_celular != "") {
                        if (DataNascimentoJogador != DateTime.now()) {
                          if (ctrl_time != "") {
                            EditandoJogadorCount == 0
                                ? saveJogador(JogadorClass(
                                    NewJogadorId,
                                    IdGrupoAtual,
                                    0,
                                    ctrl_nome.text,
                                    ctrl_celular.text,
                                    DataNascimentoJogador.day.toString() +
                                        "/" +
                                        DataNascimentoJogador.month.toString() +
                                        "/" +
                                        DataNascimentoJogador.year.toString(),
                                    DataNascimentoJogador.toString(),
                                    ctrl_time.text,
                                    double.parse(ctrl_valorjog.text)))
                                : saveJogadorALL(JogadorClass(
                                    ClickedJogadorEditId,
                                    1,
                                    1,
                                    ctrl_nome.text,
                                    ctrl_celular.text,
                                    DataNascimentoJogador.day.toString() +
                                        "/" +
                                        DataNascimentoJogador.month.toString() +
                                        "/" +
                                        DataNascimentoJogador.year.toString(),
                                    DataNascimentoJogador.toString(),
                                    ctrl_time.text,
                                    double.parse(ctrl_valorjog.text)));
                            int i = 1;
                            findRecebimento();
                            EditandoJogadorCount == 0
                                ? saveChurrasRod(ChurrasRodClass(NewJogadorId,
                                    ctrl_nome.text, 0, "não", 00.00))
                                : saveALLChurrasRod(ChurrasRodClass(
                                    ClickedJogadorEditId,
                                    ctrl_nome.text,
                                    ItemChurrasRodTapTime,
                                    ItemRecebimentoTapPagou,
                                    ctrl_valorjog.text == ""
                                        ? 00.00
                                        : double.parse(ctrl_valorjog.text)));
                            findChurrasRod();
                            if (EditandoJogadorCount == 0) {
                              while (i != 13) {
                                if (i != 12) {
                                  saveRecebimento(
                                    RecebimentoClass(
                                        NewRecebimentoId,
                                        ctrl_nome.text,
                                        "nao",
                                        ctrl_valorjog.text == ""
                                            ? "00.00"
                                            : ctrl_valorjog.text,
                                        i),
                                  );
                                }
                                i += 1;
                                NewRecebimentoId += 1;
                                if (i == 12) {
                                  saveRecebimento(
                                    RecebimentoClass(
                                        NewRecebimentoId,
                                        ctrl_nome.text,
                                        "nao",
                                        ctrl_valorjog.text == ""
                                            ? "00.00"
                                            : ctrl_valorjog.text,
                                        i),
                                  );
                                }
                              }
                            } else {
                              if (ctrl_valorjog.text !=
                                  ValorAntigoJog.toString()) {
                                editRecebimentoValor(RecebimentoClass(
                                    ClickedJogadorEditId,
                                    ctrl_nome.text,
                                    "",
                                    ctrl_valorjog.text,
                                    1));
                              }
                              editRecebimento(RecebimentoClass(
                                  NewJogadorId,
                                  ctrl_nome.text,
                                  "nao",
                                  ctrl_valorjog.text == ""
                                      ? "00.00"
                                      : ctrl_valorjog.text,
                                  i));
                            }
                            findRecebimento();
                            if (EditandoJogadorCount != 0) {
                              Navigator.pop(context);
                            }
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

                    findJogador();
                    Timer(Duration(milliseconds: 1200), () {
                      ctrl_nome.text = "";
                      ctrl_celular.text = "";
                      ctrl_time.text = "";
                      ctrl_valorjog.text = "";
                      NewJogadorId += 1;
                      setState(() {
                        TituloJogadorData = "Data de Nascimento";
                        DataSelecionadoJogador = "";
                      });
                      EditandoJogador = false;
                      Navigator.pushReplacementNamed(
                          context, "CadastroJogador");
                      EditandoJogadorCount = 0;
                    });
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
