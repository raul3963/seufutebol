import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/form/AnotacoesForm.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/form/CadastroJogadorForm.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/form/ChurracoForm.dart';

class DateTimePickerModelAnota extends StatefulWidget {
  final String titulo;

  DateTimePickerModelAnota(this.titulo);

  @override
  _DateTimePickerModelAnotaState createState() =>
      _DateTimePickerModelAnotaState(titulo);
}

class _DateTimePickerModelAnotaState extends State<DateTimePickerModelAnota> {
  final String titulo;

  _DateTimePickerModelAnotaState(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: DateTimeFormField(
          dateFormat: DateFormat.d().add_M().add_y(),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.event_note),
            labelText: titulo,
          ),
          mode: DateTimeFieldPickerMode.date,
          onDateSelected: (DateTime value) {
            setState(() {
              AnotacaoData = value;
            });
          },
        ),
      ),
    );
  }
}

class DateTimePickerModelChurras extends StatefulWidget {
  final String titulo;

  DateTimePickerModelChurras(this.titulo);

  @override
  _DateTimePickerModelChurrasState createState() =>
      _DateTimePickerModelChurrasState(titulo);
}



class _DateTimePickerModelChurrasState
    extends State<DateTimePickerModelChurras> {
  final String titulo;

  _DateTimePickerModelChurrasState(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: DateTimeFormField(
          dateFormat: DateFormat.d().add_M().add_y(),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.event_note),
            labelText: titulo,
          ),
          mode: DateTimeFieldPickerMode.date,
          onDateSelected: (DateTime value) {
            setState(() {
              ChurrascoData = value;
            });
          },
        ),
      ),
    );
  }
}

class DateTimePickerModel extends StatefulWidget {
  final String titulo;

  const DateTimePickerModel(this.titulo);

  @override
  _DateTimePickerModelState createState() => _DateTimePickerModelState(titulo);
}

class _DateTimePickerModelState extends State<DateTimePickerModel> {
  final String titulo;

  _DateTimePickerModelState(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: DateTimeFormField(
          dateFormat: DateFormat.d().add_M().add_y(),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.event_note),
            labelText: titulo,
          ),
          mode: DateTimeFieldPickerMode.date,
          onDateSelected: (DateTime value) {
            setState(() {
              DataNascimentoJogador = value;
            });
          },
        ),
      ),
    );
  }
}
