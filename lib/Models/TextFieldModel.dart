import 'package:flutter/material.dart';

class TextFieldModel extends StatelessWidget {

  final String titulo;
  final controller;
  final TextInputType keyboardType;

  TextFieldModel(this.titulo, this.controller, this.keyboardType);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: TextField(
                style: TextStyle(
                  fontSize: 25
                ),
                decoration: InputDecoration(
                  labelText: titulo,
                  border: OutlineInputBorder()
                ),
                keyboardType: keyboardType,
                controller: controller,
              ),
            ),
          ),
      ],
    );
  }
}

class ShortTextFieldModel extends StatelessWidget {

  final String titulo;
  final controller;
  final TextInputType keyboardType;

  ShortTextFieldModel(this.titulo, this.controller, this.keyboardType);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: TextField(
              maxLength: 100,
              style: TextStyle(
                  fontSize: 25
              ),
              decoration: InputDecoration(
                  labelText: titulo,
                  border: OutlineInputBorder()
              ),
              keyboardType: keyboardType,
              controller: controller,
            ),
          ),
        ),
      ],
    );
  }
}
