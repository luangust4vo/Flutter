// ignore_for_file: prefer_const_constructors

import 'package:app_gifs/entity/gif.dart';
import 'package:app_gifs/screens/ver_gif.dart';
import 'package:app_gifs/services/banco.dart';
import 'package:flutter/material.dart';

//classe responsável pela tela 'Favoritos' do app
class Favoritos extends StatelessWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Banco.buscar(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var gifs = snapshot.data as List<Gif>;

              return Expanded(
                child: GridView.builder(
                  itemCount: gifs.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VerGif(gifs[index]),
                          ));
                        },
                        child: Image.network(
                          gifs[index].previewUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              //se não, ele retorna um circulo de progresso até que finalize
              return const CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 3,
              );
            }
          },
        ),
      ),
    );
  }
}
