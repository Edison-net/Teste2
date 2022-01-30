import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste2/widgets/widget_jogar_page.dart';

import 'cobras_escadas.dart';

class Jogar extends StatefulWidget {
  @override
  _JogarState createState() => _JogarState();
}

class _JogarState extends State<Jogar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cobras e Escadas'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 177, 41),
      ),
      body: WidgetJogarPage(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: Center(
                child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Image.asset('assets/logocobras.png')),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CobrasEscadas(),
                    ),
                    (route) => false,
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    gradient: new LinearGradient(
                        begin: Alignment.centerLeft,
                        colors: [Colors.orange, Colors.orangeAccent]),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Jogar",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
