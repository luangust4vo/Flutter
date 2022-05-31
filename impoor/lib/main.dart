// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

void main() {
  //linha usada para inicializar o app
  runApp(const ImPoor());
}

class ImPoor extends StatelessWidget {
  const ImPoor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "I am Poor",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      home: PoorApp(),
    );
  }
}

class PoorApp extends StatelessWidget {
  const PoorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
          title: Text("I am poor"),
        ),
        body: Center(
          /* InkWell usado para 'transformar' uma imagem em botão */
            child: InkWell(
          child: Image(
            image: AssetImage("assets/papel.png"),
            height: 150,
            width: 150,
          ),
          /* showDialog responsável por apresentar uma caixa de diálogo na tela
          do app */
          onTap: () => showDialog(
            //atributo base do showDialog
            context: context,
            /* Este atributo diz que mesmo clicando fora da caixa de texto, ela
            não vai desaparecer */
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text("Alerta"),
              content: Text(
                  "Yay, you're poor... And I'm too. Congrats! Now I gonna cry"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
