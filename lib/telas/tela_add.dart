import 'package:flutter/material.dart';

class telaAdd extends StatefulWidget {
  const telaAdd({Key? key}) : super(key: key);

  @override
  State<telaAdd> createState() => _telaAddState();
}

class _telaAddState extends State<telaAdd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Add",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
