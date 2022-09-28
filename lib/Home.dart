import 'package:flutter/material.dart';
import 'package:you_tube/telas/tela_folder.dart';
import 'package:you_tube/telas/tela_home.dart';
import 'package:you_tube/telas/tela_hot.dart';
import 'package:you_tube/telas/tela_subscriptions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      telaHome(),
      telaHot(),
      telaSub(),
      telaFolder(),
    ];
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(opacity: 1, color: Colors.grey),
          backgroundColor: Colors.white,
          title: Image.asset(
            "assets/images/youtube.png",
            width: 98,
            height: 22,
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  print("acao video cam");
                },
                icon: Icon(Icons.videocam)),
            IconButton(
                onPressed: () {
                  print("acao search");
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  print("acao circle");
                },
                icon: Icon(Icons.account_circle)),
          ]),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
