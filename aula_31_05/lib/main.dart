// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable, avoid_unnecessary_containers, sized_box_for_whitespace

/* Arquivo criado para aula do dia 31/05/2022 do curso de Dart e Flutter */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<String> simularRequisicao() {
  //função que retornará, após 2 segundos, a mensagem 'abc'
  return Future.delayed(Duration(seconds: 2), () => "abc");
}

Future<Response<dynamic>> makeRequest(String url) async {
  var req = await Dio().get(url);

  return req;
}

/* async diz que o método não irá retornar algo de imediato */
void mostrarResultado() async {
  //await diz que o programa deverá esperar uma ação da função antes de continuar
  var req = await makeRequest("https://viacep.com.br/ws/01001000/json/");

  /* como a url acima é um json e o mais próximo de json que temos no dart
  é o tipo Map, é necessário que seja feito o processo a seguir(cast) a fim de 
  acessar os valores do json por meio de suas chaves */
  var dados = req.data as Map<String, dynamic>;

  /* acessando os valores do arquivo json por meio de suas chaves após ter sido
  feito o cast para uma variável tipo Map */
  print(dados["localidade"]);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeDog(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  //variáve que guardará o valor do cep digitado pelo usuário no TextField
  String cep = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 800,
            child: TextField(
              /* onChanged é responsável por verificar alteração no campo de texto
              e atribuir o novo texto do campo ao seu valor. Neste caso, dizemos
              que a variável cep recebe o valor de onChanged no TextField */
              onChanged: (value) => cep = value,
              decoration: InputDecoration(
                  //OutlineInputBorder cria uma borda retangular arredondada
                  border: OutlineInputBorder(),
                  //label é o atributo que funciona como placheholder do TextField
                  label: Text("CEP"),
                  prefixIcon: Icon(Icons.home)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text("Mostrar informação"),
              onPressed: () async {
                var r =
                    await makeRequest("https://viacep.com.br/ws/$cep/json/");

                var dados = r.data as Map<String, dynamic>;

                /* As informações sobre o cep inserido no TextField aparecerão
                como uma caixa de alerta após o botão ser apertado */
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Informações"),
                    content: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Text("Bairro: ${dados["bairro"]}"),
                          Text("Localidade: ${dados["localidade"]}"),
                          Text("UF: ${dados["localidade"]}")
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}

class HomeUniversity extends StatelessWidget {
  const HomeUniversity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: makeRequest(
              "http://universities.hipolabs.com/search?country=Brazil"),
          builder: (context, snapshot) {
            //se a conexão finalizou
            if (snapshot.connectionState == ConnectionState.done) {
              var req = snapshot.data as Response<dynamic>;
              var dados = req.data as List<dynamic>;
              //... retorne uma lista com os dados informados
              return ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(dados[index]["name"]),
                    subtitle: Text(dados[index]["web_pages"][0]),
                  ),
                ),
              );
            }
            //senão
            else {
              //... retorne um circulo de progresso enquanto a execução ocorre
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class HomeDog extends StatefulWidget {
  const HomeDog({Key? key}) : super(key: key);

  @override
  State<HomeDog> createState() => _HomeDogState();
}

class _HomeDogState extends State<HomeDog> {
  //variavel do tipo Widget que recebe um conbtainer vazio
  Widget dog = Container();

  /* A função getDog irá realizar um setState e mudará a imagem da tela */
  void getDog() async {
    var req = await makeRequest("https://dog.ceo/api/breeds/image/random");

    setState(() {
      dog = Image.network(
        req.data["message"],
        width: 400,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //chamando a variável dog que contém um container vazio
            dog,
            ElevatedButton(
              child: Text("Mostrar outro"),
              //sempre que clicado, o botão irá executar a função getDog
              onPressed: getDog,
            )
          ],
        ),
      ),
    );
  }
}
