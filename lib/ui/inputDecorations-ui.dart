import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hint_text,
    required String label_text,
    IconData? prefix_icon
  }){
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple
        )
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.deepPurple,
          width: 2
        )
      ),
      hintText: hint_text,
      labelText: label_text,
      labelStyle: TextStyle(
        color: Colors.grey
      ),
      prefixIcon: prefix_icon != null ? Icon(prefix_icon, color: Colors.deepPurple) : null,
    );
  }
}