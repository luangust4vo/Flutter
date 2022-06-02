// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';

//pega a localização, apenas
class Localizacao {
  //duas variáveis nuláveis que representam a latitude e longitude do local
  double? latitude;
  double? longitude;

  //função responsável por pegar a localização
  Future<void> getLocalizacao() async {
    try {
      /* variável responsável por pegar a resposta do usuário ao pedido para 
      pegar a localização. Ela é await pois é necessário esperar que a permissão
      seja pega */
      var permissao = await Geolocator.checkPermission();

      //caso a permissão seja/esteja negada, pedir permissão para acessar
      if (permissao == LocationPermission.denied ||
          permissao == LocationPermission.deniedForever) {
        //await pois é necessário esperar a resposta do usuário
        await Geolocator.requestPermission();
      }
      /* Variável que pega a posição do usuário. É await por questões como ter
      que esperar a resposta do GPS informando a posição e etc */
      var posicao = await Geolocator.getCurrentPosition();

      //pegando os valores de latitude e longitude
      latitude = posicao.longitude;
      longitude = posicao.latitude;
    } catch (erro) {
      //caso retorne erro este processo, ele será apresentado aqui
      print(erro);
    }
  }
}
