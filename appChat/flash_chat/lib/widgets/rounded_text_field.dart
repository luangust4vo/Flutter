import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedTextField extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  RoundedTextField(
      {required this.placeholder, this.onChanged, this.hideText = false});

  String placeholder;
  Function(String)? onChanged;
  bool hideText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: hideText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          hintText: placeholder),
    );
  }
}
