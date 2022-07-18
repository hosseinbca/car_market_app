import 'package:flutter/material.dart';
import 'package:marketapp/main.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController tec;
  bool ot;
  String error, hint;
  IconData id;
  CustomTextField(this.tec, this.ot, this.error, this.hint , this.id) {}
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.only(top: 20),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35)),
          color: lightblue),
      child: TextField(
        controller: tec,
        obscureText: ot,
        cursorColor: Colors.deepOrange,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 12),
            errorText: error,
            hintText: hint,
            prefixIcon: Icon(id ,color: darkblue,), 
            border: InputBorder.none),
      ),
    );
  }
}