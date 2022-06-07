// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:app_clima/services/api.dart';
import 'package:app_clima/services/tempo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget mostrarTempo(int temperatura, String emoji, String descricao) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IconButton(
          icon: Icon(
            Icons.near_me,
            size: 50,
          ),
          onPressed: () {
            setState(() {});
          },
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "$temperatura°C $emoji",
            style: TextStyle(fontSize: 100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            descricao,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 50),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.6), BlendMode.dstATop),
                  image: NetworkImage(
                      "https://img.elo7.com.br/product/original/3249FFD/quadro-decorativo-natureza-paisagem-mar-sol-coqueiro-ponte-quadro-belezas-naturais.jpg"))),
          child: SafeArea(
            child: FutureBuilder(
              future: Tempo.getTempo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    var dados = snapshot.data as API;
                    return mostrarTempo(
                        dados.temperatura,
                        Tempo.getEmoji(dados.condicao),
                        Tempo.getDescricao(dados.temperatura) +
                            " em " +
                            dados.cidade);
                  } else {
                    return mostrarTempo(
                        0, "😶", "Impossível carregar os dados");
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )),
    );
  }
}
