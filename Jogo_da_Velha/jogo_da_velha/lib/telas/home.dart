// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controladorDeAnimacao;
  late Animation animacao;

  @override
  void initState() {
    controladorDeAnimacao =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    animacao = Tween(begin: 1.0, end: 0.0).animate(controladorDeAnimacao);

    controladorDeAnimacao.addListener(() {
      setState(() {});
    });

    controladorDeAnimacao.forward();

    super.initState();
  }

  @override
  void dispose() {
    controladorDeAnimacao.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Hero(
                tag: "animacao",
                child: Text("Jogo da Velha"),
              ),
              Hero(
                tag: "jVelha",
                child: Image.asset("assets/jogo-da-velha.png"),
              ),
              TextButton(
                child: Text("Jogar"),
                onPressed: () => Navigator.of(context).pushNamed("Jogo"),
              )
            ],
          ),
          animacao.value != 0
            ? Container(color: Colors.white.withOpacity(animacao.value),)
            : Container()
        ],
      )),
    );
  }
}
