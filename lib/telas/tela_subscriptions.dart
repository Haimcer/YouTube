import 'package:flutter/material.dart';

class telaSub extends StatefulWidget {
  const telaSub({super.key});

  @override
  State<telaSub> createState() => _telaSubState();
}

class _telaSubState extends State<telaSub> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Inscrições",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
