// ignore_for_file: prefer_const_constructors

import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flash_chat/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    animation = Tween(begin: 1.0, end: 0.0).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Hero(
                          tag: "logo",
                          child: Image.asset(
                            "assets/logo.png",
                            height: 100,
                          ),
                        ),
                        Text(
                          "Flash Chat",
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
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
                  SizedBox(height: 20),
                  RoundedButton(
                    text: "Login",
                    color: Colors.lightBlue,
                    onPressed: () => null,
                  ),
                  RoundedButton(
                    text: "Cadastrar-se",
                    color: Colors.blue.shade600,
                    onPressed: () =>
                        Navigator.of(context).pushNamed("cadastro"),
                  ),
                ],
              ),
            ),
            animation.value != 0
                ? Container(
                    color: Colors.white.withOpacity(animation.value),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
