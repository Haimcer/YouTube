import 'package:flutter/material.dart';

class telaHot extends StatefulWidget {
  const telaHot({super.key});

  @override
  State<telaHot> createState() => _telaHotState();
}

class _telaHotState extends State<telaHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Em alta",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
