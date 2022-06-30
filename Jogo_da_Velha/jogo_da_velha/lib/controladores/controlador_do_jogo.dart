// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:jogo_da_velha/enums/jogador.dart';
import 'package:jogo_da_velha/enums/vencedor.dart';
import 'package:jogo_da_velha/modelos/campos.dart';
import 'package:jogo_da_velha/nucleo/constantes.dart';
import 'package:jogo_da_velha/nucleo/regras_do_vencedor.dart';

class ControladorDoJogo {
  List<Campos> campos = [];
  List<int> movimentosDoJogador1 = [];
  List<int> movimentosDoJogador2 = [];
  late Jogador jogadorAtual;
  late bool eUmJogador;

  bool get temMovimentos =>
      (movimentosDoJogador1.length + movimentosDoJogador2.length) !=
      TAMANHO_TABULEIRO;

  ControladorDoJogo() {
    _iniciar();
  }

  void _iniciar() {
    movimentosDoJogador1.clear();
    movimentosDoJogador2.clear();
    jogadorAtual = Jogador.jogador1;
    eUmJogador = false;
    campos = List<Campos>.generate(
        TAMANHO_TABULEIRO, (endereco) => Campos(endereco + 1));
  }

  void reiniciar() {
    _iniciar();
  }

  void marcarCampoPorEndereco(endereco) {
    final campo = campos[endereco];
    if (jogadorAtual == Jogador.jogador1) {
      _marcarComJogador1(campo);
    } else {
      _marcarcomJogador2(campo);
    }

    campo.vazio = false;
  }

  void _marcarComJogador1(Campos campo) {
    campo.simbolo = SIMBOLO_DO_JOGADOR1;
    campo.cor = COR_DO_JOGADOR1;
    movimentosDoJogador1.add(campo.id);
    jogadorAtual = Jogador.jogador2;
  }

  void _marcarcomJogador2(Campos campo) {
    campo.simbolo = SIMBOLO_DO_JOGADOR2;
    campo.cor = COR_DO_JOGADOR2;
    movimentosDoJogador2.add(campo.id);
    jogadorAtual = Jogador.jogador1;
  }

  bool _verificarJogadorVencedor(List<int> movimentos) {
    return regrasDoVencedor.any((regra) =>
        movimentos.contains(regra[0]) &&
        movimentos.contains(regra[1]) &&
        movimentos.contains(regra[2]));
  }

  Vencedor verificarVencedor() {
    if (_verificarJogadorVencedor(movimentosDoJogador1)) {
      return Vencedor.jogador1;
    }
    if (_verificarJogadorVencedor(movimentosDoJogador2)) {
      return Vencedor.jogador2;
    } else {
      return Vencedor.nenhum;
    }
  }

  int bot() {
    var lista = new List.generate(9, (valor) => valor + 1);
    lista.removeWhere((elemento) => movimentosDoJogador1.contains(elemento));
    lista.removeWhere((elemento) => movimentosDoJogador2.contains(elemento));

    var aleatorio = new Random();
    var endereco = aleatorio.nextInt(lista.length - 1);
    return campos.indexWhere((campo) => campo.id == lista[endereco]);
  }
}
