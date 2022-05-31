// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/gato.jpg"),
                radius: 50,
              ),
              Text(
                "Luan Gustavo",
                style: TextStyle(fontFamily: "Koulen", fontSize: 20),
              ),
              Text(
                "ESTUDANTE EM T.I. EM INFORMÁTICA, 4° ANO",
                style: TextStyle(fontFamily: "Macondo", fontSize: 10),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.blue,),
                  title: Text("+55 44 9 9954-4455", style: TextStyle(color: Colors.blue),),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "gluan1213@gmail.com",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
