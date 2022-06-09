// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app_gifs/entity/gif.dart';
import 'package:app_gifs/screens/ver_gif.dart';
import 'package:flutter/material.dart';

//classe responsável pela tela 'Home' do app
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            //TextField cria uma área para que se digite textos
            TextField(
              //InputDecoration é o widget que permite a decoração do TextField
              decoration: InputDecoration(
                  //OutineinputBorder cria uma borda sobre em volta de uma área
                  border: OutlineInputBorder(),
                  label: Text(
                    "Pesquisar GIFs",
                    style: TextStyle(color: Colors.grey),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => null,
                  )),
            ),
            FutureBuilder(
              future: Gif.getGifs(),
              builder: (context, snapshot) {
                //condição que verifica se a requisição foi finalizada
                if (snapshot.connectionState == ConnectionState.done) {
                  //se sim, ela retorna todos os gifs que o snapshot possui
                  var gifs = snapshot.data as List<Gif>;

                  return Expanded(
                    child: GridView.builder(
                      itemCount: gifs.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 1,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: () {
                              /* quando clicado, redireciona para a tela 'VerGif'
                              e atribui como parâmetro do construtor da classe
                              o gif que o usuário clicou */
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
            )
          ],
        ),
      ),
    );
  }
}
