import 'dart:convert';

class Pesquisa {
  String? sugestoes;
  Pesquisa({
    this.sugestoes
  });

 factory Pesquisa.fromJson(List<dynamic> json) {
    return Pesquisa(
        sugestoes: json[0],
        
        );
  }
  }