// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Other(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* Cria um tipo de Container pré-estilizado, com mais 
            'funcionalidades' */
            Card(
              //define a cor do Card criado
              color: Colors.blue[50],
              elevation: 20,
              /* ListTile responsável por criar uma linha única de altura fixa 
              que contém um título, bem como um subtítulo, um ícone à esquerda
              e/ou outro à direita. É como o a barra de música de um celular. */
              child: ListTile(
                //leading é o ícone que fica à esquerda
                leading: Icon(
                  Icons.album,
                  size: 50,
                ),
                //trailing é o ícone que fica a direita
                trailing: IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {},
                ),
                title: Text("Título"),
                subtitle: Text("Subtítulo"),
              ),
            ),
            /* CircleAvatar cria um círculo onde é possível se colocar imagens,
            como se fosse o perfildo Whatsapp, Gmail e etc */
            CircleAvatar(
              radius: 50,
              //Cor de fundo do widget caso nãp tenha imagem
              backgroundColor: Colors.red,
              //A imagem que aparecerá no widget será setada aqui
              backgroundImage: AssetImage("assets/gato.jpg"),
              //O comentário a seguir é o texto que aparece caso não haja imagem
              /* child: Text(
                "LG",
                style: TextStyle(fontSize: 50),
              ), */
            )
          ],
        ),
      ),
    );
  }
}

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/gato.jpg"),
                ),
                trailing: Icon(Icons.thumb_up),
                title: Text("Luan Gustavo", style: TextStyle(fontFamily: "Macondo", fontSize: 20),),
                subtitle: Text("É sobre isso", style: TextStyle(fontSize: 12, fontFamily: "Macondo"),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
