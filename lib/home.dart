import 'package:flutter/material.dart';
import 'package:you_tube/customSearchDelegate.dart';
import 'package:you_tube/telas/tela_folder.dart';
import 'package:you_tube/telas/tela_home.dart';
import 'package:you_tube/telas/tela_explore.dart';
import 'package:you_tube/telas/tela_subscriptions.dart';
import 'package:you_tube/telas/tela_add.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      telaHome(resultado),
      telaHot(),
      telaAdd(),
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
            /*IconButton(
                onPressed: () {
                  print("acao video cam");
                },
                icon: Icon(Icons.videocam)),*/
            IconButton(
                onPressed: () async {
                  String res = await showSearch(context: context, delegate: CustomSearchDelegate()) ?? "";
                setState(() {
                  resultado = res;
                });
                  print("acao search" + res);
                },
                icon: Icon(Icons.search)),
           /* IconButton(
                onPressed: () {
                  print("acao circle");
                },
                icon: Icon(Icons.account_circle)),*/
          ]),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
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
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            label: "Explore",
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
          ),
      BottomNavigationBarItem(
        // backgroundColor: Colors.red,
        label: "Add",
        icon: Icon(Icons.add_circle_outlined),
        activeIcon: Icon(Icons.add_circle),
      ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            label: "Inscrições",
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            label: "Biblioteca",
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
          ),
        ],
      ),
    );
  }
}
