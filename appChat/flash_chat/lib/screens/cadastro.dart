// ignore_for_file: prefer_const_constructors

import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flash_chat/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
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
                onChanged: (value) => null,
              ),
              SizedBox(height: 16),
              RoundedTextField(
                placeholder: "Digite sua senha",
                onChanged: (value) => null,
                hideText: true,
              ),
              SizedBox(height: 40),
              RoundedButton(
                text: "Cadastrar-se",
                color: Colors.blue.shade600,
                onPressed: () => null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
