import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste2/widgets/widget_avatar_dois.dart';
import 'package:teste2/widgets/widget_avatar_um.dart';
import 'package:teste2/widgets/widget_page.dart';

class CobrasEscadas extends StatefulWidget {
  const CobrasEscadas({Key? key}) : super(key: key);

  @override
  _CobrasEscadasState createState() => _CobrasEscadasState();
}

class _CobrasEscadasState extends State<CobrasEscadas> {
  Map<String, double> Posicaojogador1 = {"bottom": 15, "left": 0};
  Map<String, double> Posicaojogador2 = {"bottom": 15, "left": 6};
  bool Gamer = true;
  int posicaonotabuleiro1 = 1;
  int posicaonotabuleiro2 = 1;
  String direcao1 = "right";
  String direcao2 = "right";
  bool escada1 = false;
  bool escada2 = false;
  int dados = 0;

  void Escadas() {
    var value = posicaonotabuleiro1 + dados;
    String oldPos = posicaonotabuleiro1.toString().padLeft(2, '0');
    String newPos = value.toString().padLeft(2, '0');
    if (int.parse(newPos[0]) > int.parse(oldPos[0])) {
      escada1 = true;
    } else {
      escada1 = false;
    }
  }




  Future<void> jogandoDados() async {
    var sorteio1 = Random().nextInt(6);
    if(sorteio1 == 6){
      sorteio1 == 1;
    }else{
      null;
    }
    dados = dados + dados;
    var sorteio2 = Random().nextInt(6);
    if(sorteio2 == 6){
      sorteio2 == 1;
    }else{
      null;
    }
    dados = dados + sorteio2;

    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
                'Dados Sorteados',style: TextStyle(fontWeight: FontWeight.bold),
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  'Dado : $sorteio1',
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
                Text(
                  'Dado : $sorteio2',
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.play_arrow, size: 30,))
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cobras e Escadas'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 177, 41),
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CobrasEscadas()),
                (route) => false,
              );
            },
            icon: Icon(Icons.cached)),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 265),
              child: Image.asset('assets/tabuleiro.jpg'),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              bottom: Posicaojogador1['bottom'],
              left: Posicaojogador1['left'],
              child: Container(
                child: Image.asset(
                  'assets/avatar1.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              bottom: Posicaojogador2['bottom'],
              left: Posicaojogador2['left'],
              child: Container(
                child: Image.asset(
                  'assets/avatar2.png',
                  width: 50,
                  height: 40,
                ),
              ),
            ),
            SizedBox(
              height: 266,
              width: size.width,
              child: WidgetPages(child:
              Container(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.orange,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: AvatarUm(lugar: posicaonotabuleiro1,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Jogador n°1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 180,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.orange,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: AvatarDois(lugar: posicaonotabuleiro2,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Jogador n°2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 20, 410),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {
                      dados = 0;
                      await jogandoDados();
                      setState(() {
                        if (Gamer) {
                          Escadas();
                          if (escada1) {
                            Posicaojogador1['bottom'] =
                                Posicaojogador1['bottom']! + 30;
                            direcao1 == 'right'
                                ? direcao1 = 'left'
                                : direcao1 = 'right';
                          }
                          Posicaojogador1['left'] = direcao1 == 'right'
                              ? Posicaojogador1['left']! + (30.0 * dados)
                              : Posicaojogador1['left']! -
                              (40.0 * dados);
                          posicaonotabuleiro1 = posicaonotabuleiro1 + dados;
                        } else {
                          Posicaojogador2['left'] =
                              Posicaojogador2['left']! + (30.0 * dados);
                          posicaonotabuleiro2 = posicaonotabuleiro2 + dados;
                        }
                        Gamer = !Gamer;
                      });
                    },
                    child: const Text(
                      'Dados',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
