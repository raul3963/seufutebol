import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seufutebol/main.dart';

class carregando extends StatelessWidget {
  const carregando({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 2000), (){
      Navigator.popAndPushNamed(context, "GroupManageScreen");
      main();
    });
    return Scaffold(
      body: Center(),
    );
  }
}
