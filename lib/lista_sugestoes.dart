import 'package:flutter/material.dart';
import 'package:you_tube/api.dart';
import 'models/pesquisa.dart';

class ListaSugestoes extends StatefulWidget {
  ListaSugestoes(this.query, {Key? key}) : super(key: key);
  String query;

  @override
  State<ListaSugestoes> createState() => _ListaSugestoesState();
}

class _ListaSugestoesState extends State<ListaSugestoes> {
  _sugestoes() async {
    ApiPesquisa api = ApiPesquisa();

    autocomplete = await api.pesquisarp(widget.query) ?? [];
    setState(() {
      carregando = false;
      return setState(() {

      });
    });
  }
 late List<Pesquisa> autocomplete;
  bool carregando = true;
  @override
  initState() {
    super.initState();
    print("widget.query: ${widget.query}");
    _sugestoes();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return carregando == true ? CircularProgressIndicator() : ListView.builder(
      itemCount: autocomplete.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(autocomplete[index].sugestoes ?? ""),
        );
      },
    );
  }
}
