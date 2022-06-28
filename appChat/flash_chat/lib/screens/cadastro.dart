// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flash_chat/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String email = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ignore: prefer_const_literals_to_create_immutables
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Image.asset(
                    "assets/logo.png",
                    height: 300,
                  ),
                ),
              ),
              SizedBox(height: 40),
              RoundedTextField(
                placeholder: "Digite seu e-mail",
                onChanged: (value) => email = value,
              ),
              SizedBox(height: 16),
              RoundedTextField(
                placeholder: "Digite sua senha",
                onChanged: (value) => senha = value,
                hideText: true,
              ),
              SizedBox(height: 40),
              RoundedButton(
                text: "Cadastrar-se",
                color: Colors.blue.shade600,
                onPressed: () async {
                  var resultado = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: senha);

                  try {
                    if (resultado.user != null) {
                      Navigator.of(context).pushNamed("chat");
                    }
                  } catch (erro) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(erro.toString()),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
