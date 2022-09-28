import 'package:flutter/material.dart';

class telaFolder extends StatefulWidget {
  const telaFolder({super.key});

  @override
  State<telaFolder> createState() => _telaFolderState();
}

class _telaFolderState extends State<telaFolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Biblioteca",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
