import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _resultado = 'Aguardando';
  var _imagemAdversario = AssetImage("images/padrao.png");
  var _score = 0;

  void _jogaPartida(int x) {
    var _opcaoMaquina;
    var opcaoJogador = x;

    _opcaoMaquina = Random().nextInt(3);

    switch (_opcaoMaquina) {
      case 0:
        setState(() {
          this._imagemAdversario = AssetImage("images/papel.png");
        });
        break;
      case 1:
        setState(() {
          this._imagemAdversario = AssetImage("images/pedra.png");
        });
        break;
      case 2:
        setState(() {
          this._imagemAdversario = AssetImage("images/tesoura.png");
        });
        break;
    }

    if (_opcaoMaquina == 0 && opcaoJogador == 2 ||
        _opcaoMaquina == 1 && opcaoJogador == 3 ||
        _opcaoMaquina == 2 && opcaoJogador == 1) {
      setState(() {
        this._resultado = 'Você perdeu';
        if(this._score>0)this._score --;
      });
    } else if (opcaoJogador == 1 && _opcaoMaquina == 1 ||
        opcaoJogador == 2 && _opcaoMaquina == 2 ||
        opcaoJogador == 3 && _opcaoMaquina == 3) {
      setState(() {
        this._resultado = 'Você ganhou';
        this._score ++;
      });
    } else {
      setState(() {
        this._resultado = 'Empatou';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Jokenpo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //text,
            Text(
              "Adversário",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            //imagem,
            Image(
              image: this._imagemAdversario,
              height: 120,
              width: 120,
            ),
            //text,
            Text(
              _resultado,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            //Linha 4 3 imagens,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _jogaPartida(1),
                  child: Image.asset("images/papel.png", height: 90),
                ),
                GestureDetector(
                  onTap: () => _jogaPartida(2),
                  child: Image.asset("images/pedra.png", height: 90),
                ),
                GestureDetector(
                  onTap: () => _jogaPartida(3),
                  child: Image.asset("images/tesoura.png", height: 90),
                ),
              ],
            ),
            //texto,
            Text(
              "Escolha uma opção",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            //score
            Text(
              "Score: $_score",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
