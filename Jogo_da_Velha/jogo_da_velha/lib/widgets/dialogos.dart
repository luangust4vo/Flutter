// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jogo_da_velha/nucleo/constantes.dart';

class Dialogos extends StatelessWidget {
  final String titulo;
  final String mensagem;
  final Function? estaPressionado;

  const Dialogos({this.titulo = "", this.mensagem = "", this.estaPressionado});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titulo),
      content: Text(mensagem),
      actions: [
        TextButton(
          child: Text(TEXTO_DENOVO),
          onPressed: () {
            Navigator.pop(context);
            estaPressionado!();
          },
        )
      ],
    );
  }
}
