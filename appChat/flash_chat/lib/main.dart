// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/cadastro.dart';
import 'package:flash_chat/screens/chat.dart';
import 'package:flash_chat/screens/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "home", routes: {
      "home": (context) => Home(),
      "cadastro": (context) => Cadastro(),
      "chat": (context) => Chat()
    });
  }
}
