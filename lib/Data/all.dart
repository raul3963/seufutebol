import 'package:flutter/material.dart';
import 'package:seufutebol/Data/temasave.dart';
import 'package:seufutebol/Screens/telas%20aba%20controle/configuracao.dart';
import '../main.dart';
import 'ChurrascoData.dart';
import 'ChurrascoRodadaData.dart';
import 'DataAnotacao.dart';
import 'GroupData.dart';
import 'JogadorData.dart';
import 'RecebimentoData.dart';

DeleteAllData(){
  DeleteDataRecebimento();
  DeleteDataJogador();
  DeleteDataGrupos();
  DeleteDataAnotacao();
  DeleteDataChurrasRod();
  DeleteDataChurras();
  FindAllData();
  NewJogadorId = 1;
  NewChurrasRodId = 1;
  NewChurrasId = 1;
  NewAnotaId = 1;
  NewRecebimentoId = 1;
  NewRecebimentoId = 1;
  NewRecebimentoId = 1;
}


FindAllData(){
  findTema();
  findRecebimento();
  findRecebimentopMes();
  findChurrasRod();
  findChurras();
  findJogador();
  findRecebimento();
  findJogadorpTime();
  findJogadorpNascimento();
  findAnotacao();
  findGrupos();
}