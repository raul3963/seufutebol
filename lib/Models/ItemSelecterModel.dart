import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seufutebol/Data/ChurrascoRodadaData.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/listas/ChurrascoRodada.dart';

class ItemSelecterModelRecebimento extends StatefulWidget {
  final String item1;
  final String item2;

  ItemSelecterModelRecebimento(this.item1, this.item2);

  @override
  _ItemSelecterModelRecebimento createState() =>
      _ItemSelecterModelRecebimento(item1, item2);
}

String SelectedItemSelecter = "";

class _ItemSelecterModelRecebimento
    extends State<ItemSelecterModelRecebimento> {
  int _selectedValue = 0;

  final String item1;
  final String item2;

  _ItemSelecterModelRecebimento(this.item1, this.item2);

  bool clicked = false;

  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 250,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: [
                  Text(item1),
                  Text(item2),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
            ));
  }

  bool enabled = true;
  bool focus = false;
  String hint = '';
  Color cor = Colors.white30;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            child: Container(
              height: 35,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.25, color: cor),
              ),
              child: Center(
                child: Text(
                  clicked == true ? SelectedItemSelecter : "não",
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            onTap: () {
              clicked = true;
              _selectedValue = 0;
              setState(() {
                cor = Colors.blue;
                SelectedItemSelecter = item1;
              });
              _showPicker(context);
            },
          ),
        ],
      ),
    );
  }
}

class ItemSelecterModelTime extends StatefulWidget {
  final String item1;
  final String item2;

  ItemSelecterModelTime(this.item1, this.item2);

  @override
  _ItemSelecterModelTime createState() => _ItemSelecterModelTime(item1, item2);
}

String SelectedItemSelecterTime = "";

class _ItemSelecterModelTime extends State<ItemSelecterModelTime> {
  int _selectedValue = 0;

  final String item1;
  final String item2;

  _ItemSelecterModelTime(this.item1, this.item2);

  bool clicked = false;

  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 250,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: [
                  Container(
                      width: 300,
                      color: Colors.blue,
                      child: Center(child: Text(item1))),
                  Container(
                      width: 300,
                      color: Colors.red,
                      child: Center(child: Text(item2))),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                    TimePerdedor = int.parse(value.toString());
                  });
                  findChurrasRod();
                },
              ),
            ));
  }

  bool enabled = true;
  bool focus = false;
  String hint = '';
  Color cor = Colors.white30;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            child: Container(
              height: 35,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.25, color: cor),
              ),
              child: Center(
                child: Text(
                  clicked == true ? SelectedItemSelecter : "",
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            onTap: () {
              clicked = true;
              _selectedValue = 0;
              setState(() {
                cor = Colors.blue;
                SelectedItemSelecter = item1;
              });
              _showPicker(context);
            },
          ),
        ],
      ),
    );
  }
}

class ItemSelecterModel2 extends StatefulWidget {
  final String item1;
  final String item2;
  final String titulo;

  ItemSelecterModel2(this.item1, this.item2, this.titulo);

  @override
  _ItemSelecterModelState2 createState() =>
      _ItemSelecterModelState2(item1, item2, titulo);
}

String SelectedItemSelecterRecebimento = "";

class _ItemSelecterModelState2 extends State<ItemSelecterModel2> {
  int _selectedValue = 0;

  final String item1;
  final String item2;
  final String titulo;

  _ItemSelecterModelState2(this.item1, this.item2, this.titulo);

  bool clicked = false;

  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 250,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: [
                  Text(item1),
                  Text(item2),
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
            ));
  }

  bool enabled = true;
  bool focus = false;
  String hint = '';
  Color cor = Colors.white30;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            child: Container(
              height: 75,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.25, color: cor),
              ),
              child: Center(
                child: Text(
                  clicked == true ? SelectedItemSelecter : titulo,
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            onTap: () {
              clicked = true;
              _selectedValue = 0;
              setState(() {
                cor = Colors.blue;
                SelectedItemSelecter = item1;
              });
              _showPicker(context);
            },
          ),
        ],
      ),
    );
  }
}
