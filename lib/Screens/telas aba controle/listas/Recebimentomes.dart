import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seufutebol/Data/AnotaChurrasRodRecebimentoItem.dart';
import 'package:seufutebol/Data/RecebimentoData.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/configuracao.dart';
import '../../../main.dart';

int TimePerdedor = 0;
int MesEscolhido = DateTime.now().month;

bool OnChurrasRod = false;

class Recebimento extends StatefulWidget {
  @override
  _RecebimentoState createState() => _RecebimentoState();
}

String selectedRecebimento = "";

class _RecebimentoState extends State<Recebimento>
    with TickerProviderStateMixin {
  late TabController ctrl_TabMes;

  @override
  void initState() {
    super.initState();
    ctrl_TabMes = TabController(
        length: 12,
        vsync: this,
        initialIndex: MesEscolhido == 0 ? 0 : MesEscolhido - 1);
  }

  @override
  Widget build(BuildContext context) {
    loading == 1 ? Mensagem = 0 : Mensagem = Mensagem;
    onRecebimento = true;
    TitleAppBar = "Recebimento";
    double widthsobrando = MediaQuery.of(context).size.width - 50;
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          title: Text("$TitleAppBar"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Deseja Resetar o Pagamento?"),
                          content: Text(
                            'Deseja marcar todos como "não pago"?',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  editRecebimentoNaoPagoall(RecebimentoClass(
                                      1, "", "nao", "0.00", 0));
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                      context, "RecebimentoMes");
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        Timer(Duration(milliseconds: 1500), () {
                                          Navigator.pop(context);
                                          Navigator.pushReplacementNamed(
                                              context, "RecebimentoMes");
                                        });
                                        return Center(
                                          child: Container(
                                            height: 250,
                                            child: Dialog(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        Text("Carregando..."),
                                                  ),
                                                  Center(
                                                      child: SpinKitRing(
                                                    color: Colors.white,
                                                    size: 100,
                                                    lineWidth: 10,
                                                  ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  "Marcar todos como não pago",
                                  style: TextStyle(color: Colors.red),
                                )),
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancelar"),
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(Icons.refresh_rounded))
          ],
          bottom: TabBar(
            controller: ctrl_TabMes,
            indicatorWeight: 0.0001,
            labelColor: Colors.white,
            unselectedLabelColor:
                TemaDark == false ? Colors.black : Colors.blue,
            isScrollable: true,
            tabs: [
              InkWell(
                onTap: () {
                  Recebimento();
                  ctrl_TabMes.index = 0;
                  MesEscolhido = 1;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Janeiro'),
              ),
              InkWell(
                onTap: () {
                  Recebimento();
                  MesEscolhido = 2;
                  ctrl_TabMes.index = 1;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Fevereiro'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 3;
                  ctrl_TabMes.index = 2;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Março'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 4;
                  ctrl_TabMes.index = 3;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Abril'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 5;
                  ctrl_TabMes.index = 4;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Maio'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 6;
                  ctrl_TabMes.index = 5;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Junho'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 7;
                  ctrl_TabMes.index = 6;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Julho'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 8;
                  ctrl_TabMes.index = 7;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Agosto'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 9;
                  ctrl_TabMes.index = 8;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Setembro'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 10;
                  ctrl_TabMes.index = 9;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Outubro'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 11;
                  ctrl_TabMes.index = 10;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Novembro'),
              ),
              InkWell(
                onTap: () {
                  MesEscolhido = 12;
                  ctrl_TabMes.index = 11;
                  print(MesEscolhido);
                  findRecebimentopMes();
                  Navigator.pushReplacementNamed(context, "RecebimentoMes");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Timer(Duration(milliseconds: 1500), () {
                          Navigator.pop(context);
                        });
                        return Center(
                          child: Container(
                            height: 250,
                            child: Dialog(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Carregando..."),
                                  ),
                                  Center(
                                      child: SpinKitRing(
                                    color: Colors.white,
                                    size: 100,
                                    lineWidth: 10,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Tab(text: 'Dezembro'),
              ),
            ],
          ),
        ),
        body: Center(
          child: FutureBuilder<List<RecebimentoClass>>(
            future: Future.delayed(Duration(seconds: 1))
                .then((value) => findRecebimentopMes()),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                final List<RecebimentoClass> recebimentoClass =
                    snapshot.data as List<RecebimentoClass>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final RecebimentoClass Item = recebimentoClass[index];
                    return EditorSelectorRecebimento(Item);
                  },
                  itemCount: recebimentoClass.length == null
                      ? 0
                      : recebimentoClass.length,
                );
              } else {
                Timer(Duration(seconds: 2), () {
                  setState(() {
                    loading = 0;
                    Mensagem = 1;
                  });
                });
              }
              return Mensagem == 1
                  ? Center(
                      child: Text("Nenhum Dado Encontrado"),
                    )
                  : Center(
                      child: Text("Carregando..."),
                    );
            },
          ),
        ),
      ),
    );
  }
}
