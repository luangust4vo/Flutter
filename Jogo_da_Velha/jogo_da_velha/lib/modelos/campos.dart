import 'package:flutter/material.dart';

class Campos {
  final int id;
  String simbolo;
  Color cor;
  bool vazio;

  Campos(this.id, {this.simbolo = "", this.cor = Colors.black, this.vazio = true});
}
