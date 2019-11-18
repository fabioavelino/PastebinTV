import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  TextInput({this.placeholder, this.controller});

  final String placeholder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        margin: EdgeInsets.all(20),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF444444),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                hintText: placeholder),
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFFEEEEEE),
            )));
  }
}
