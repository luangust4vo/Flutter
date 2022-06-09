// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_gifs/entity/gif.dart';
import 'package:app_gifs/screens/favoritos.dart';
import 'package:app_gifs/screens/home.dart';
import 'package:flutter/material.dart';

/* Classe resposável pela barra de navegação na parte de baixo do app 
com as opções 'Home' e 'Favoritos */
class Navegacao extends StatefulWidget {
  const Navegacao({Key? key}) : super(key: key);

  @override
  State<Navegacao> createState() => _NavegacaoState();
}

class _NavegacaoState extends State<Navegacao> {
  //contador do array de telas
  int index = 0;

  //array de telas que chama as classes responsáveis pela tela 'Home' e 'Favoritos'
  var telas = [
    Home(),
    Favoritos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* SafeArea é um widget responsável por deixar outros widgets e itens em 
      uma "área segura" da tela para que possam funcionar em 100% sem algo 
      intervir e atrapalhar*/
      body: SafeArea(child: telas[index]),
      /*BottomNavigationBar é o responsável por criar a barra de navegação da 
      parte de baixo da tela do app*/
      bottomNavigationBar: BottomNavigationBar(
        //muda a cor do item na barra de navegação na parte de baixo
        selectedItemColor: Colors.red,
        //cor dos itens da barra de navegação na parte de baixo sem seleção
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: (posicao) {
          setState(() {
            index = posicao;
          });
        },
        items: [
          /*  Este widget é o que cria os itens de navegação da barra de navegação 
         criada pelo BottomNavigationBar */
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favoritos",
          ),
        ],
      ),
    );
  }
}
