// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:jogo_da_velha/controladores/controlador_do_jogo.dart';
import 'package:jogo_da_velha/enums/jogador.dart';
import 'package:jogo_da_velha/enums/vencedor.dart';
import 'package:jogo_da_velha/nucleo/constantes.dart';
import 'package:jogo_da_velha/widgets/dialogos.dart';

class TelaDoJogo extends StatefulWidget {
  const TelaDoJogo({Key? key}) : super(key: key);

  @override
  State<TelaDoJogo> createState() => _TelaDoJogoState();
}

class _TelaDoJogoState extends State<TelaDoJogo> {
  final _controlador = ControladorDoJogo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _construirAppBar(),
      body: _construirCorpo(),
    );
  }

  _construirAppBar() {
    return AppBar(
      leading: Hero(tag: "jVelha", child: Image.asset("assets/jogo-da-velha.png")),
      title: Hero(tag: "animacao", child: Text(TITULO_DO_JOGO)),
      centerTitle: true,
    );
  }

  _construirCorpo() {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _construirTabuleiro(),
            _modoDeJogo(),
            _construirBotaoReiniciar(),
          ]),
    );
  }

  _construirBotaoReiniciar() {
    return TextButton(
      child: Text(TEXTO_DENOVO),
      onPressed: _resetarJogo,
    );
  }

  _construirTabuleiro() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: TAMANHO_TABULEIRO,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: _construirCampo,
      ),
    );
  }

  Widget _construirCampo(conteudo, endereco) {
    return GestureDetector(
      onTap: () => _aoMarcarCampo(endereco),
      child: Container(
        color: _controlador.campos[endereco].cor,
        child: Center(
          child: Text(
            _controlador.campos[endereco].simbolo,
            style: TextStyle(fontSize: 72.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _resetarJogo() {
    setState(() {
      _controlador.reiniciar();
    });
  }

  _aoMarcarCampo(endereco) {
    if (!_controlador.campos[endereco].vazio) {
      return;
    }
    setState(() {
      _controlador.marcarCampoPorEndereco(endereco);
    });

    _verificarVencedor();
  }

  _verificarVencedor() {
    var vencedor = _controlador.verificarVencedor();

    if (vencedor == Vencedor.nenhum) {
      if (!_controlador.temMovimentos) {
        _mostrarMensagemDeEmpate();
      } else if (_controlador.eUmJogador &&
          _controlador.jogadorAtual == Jogador.jogador2) {
        final endereco = _controlador.bot();
        _aoMarcarCampo(endereco);
      }
    } else {
      String simbolo = vencedor == Vencedor.jogador1
          ? SIMBOLO_DO_JOGADOR1
          : SIMBOLO_DO_JOGADOR2;
      _mostrarMensagemDeVitoria(simbolo);
    }
  }

  _mostrarMensagemDeEmpate() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialogos(
            titulo: EMPATE,
            mensagem: MENSAGEM_DE_DIALOGO,
            estaPressionado: _resetarJogo,
          );
        });
  }

  _mostrarMensagemDeVitoria(String simbolo) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialogos(
            titulo: VITORIA,
            mensagem: MENSAGEM_DE_DIALOGO,
            estaPressionado: _resetarJogo,
          );
        });
  }

  _modoDeJogo() {
    return SwitchListTile(
      title: Text(_controlador.eUmJogador
          ? TEXTO_DE_UM_JOGADOR
          : TEXTO_DE_MAIS_JOGADORES),
      secondary: Icon(_controlador.eUmJogador ? Icons.person : Icons.people),
      value: _controlador.eUmJogador,
      onChanged: (valor) {
        setState(() {
          _controlador.eUmJogador = valor;
        });
      },
    );
  }
}
