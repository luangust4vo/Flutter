// ignore_for_file: prefer_const_constructors

import 'package:app_listas/entity/texto.dart';
import 'package:app_listas/service/banco.dart';
import 'package:flutter/material.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({Key? key}) : super(key: key);

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  String conteudo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => conteudo = value,
                decoration: InputDecoration(
                    hintText: "Texto", border: OutlineInputBorder())),
            ElevatedButton(
              onPressed: () => Banco.salvar(Texto(conteudo: conteudo)),
              child: Text("Salvar"),
            )
          ],
        ),
      ),
    );
  }
}
