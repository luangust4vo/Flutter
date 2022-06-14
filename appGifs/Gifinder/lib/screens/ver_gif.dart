// ignore_for_file: prefer_const_constructors

import 'package:app_gifs/entity/gif.dart';
import 'package:app_gifs/services/banco.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class VerGif extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  VerGif(this.gif);

  Gif gif;

  @override
  State<VerGif> createState() => _VerGifState();
}

class _VerGifState extends State<VerGif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: widget.gif.url));
                ScaffoldMessenger.of(context).showSnackBar(
                    /* SnackBar usado para informar ao usuário o processo que foi 
                  realizado/executado */
                    SnackBar(
                  content: Text("Link copiado para área de transferência"),
                  duration: Duration(seconds: 1),
                ));
              }),
          IconButton(
            icon: Icon(Icons.favorite_outline),
            onPressed: () => Banco.salvar(widget.gif),
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          widget.gif.url,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              );
            }
          },
        ),
      ),
    );
  }
}
