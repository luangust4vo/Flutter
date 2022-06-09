import 'package:app_gifs/entity/gif.dart';
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
            // ignore: prefer_const_constructors
            icon: Icon(Icons.copy),
            onPressed: () =>
                Clipboard.setData(ClipboardData(text: widget.gif.url)),
          ),
          IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(Icons.favorite_outline),
            onPressed: () => null,
          ),
        ],
      ),
      body: Center(
        child: Image.network(widget.gif.url),
      ),
    );
  }
}
