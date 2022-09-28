import 'package:flutter/material.dart';

class telaHome extends StatefulWidget {
  const telaHome({super.key});

  @override
  State<telaHome> createState() => _telaHomeState();
}

class _telaHomeState extends State<telaHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Início",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
