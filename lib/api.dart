import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/video.dart';
import 'models/pesquisa.dart';

const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const CHAVE_YOUTUBE_API = "AIzaSyAar3uElU9kC3i-p3uqIALdFKLl-8NPsPk";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";
const URL_PESQUISA = "https://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&format=5&alt=json";

class Api {
  Future<List<Video>?> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse("${URL_BASE}search?part=snippet&type=video&maxResults=20&order=date&key=$CHAVE_YOUTUBE_API&q=$pesquisa"));
    try {
      
      print("dadosJson");
      //print(response.body);
    //if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      print("dadosJson");
      //print(dadosJson);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
/*
      for (var video in dadosJson["items"]) {
        print("resultado" + dadosJson["items"].toString());
      }*/
    //} else {}
    } catch (err) {
      print("err: $err");
    }
  }
}

class ApiPesquisa {
  Future<List<Pesquisa>?> pesquisarp(String pesquisap) async {
    http.Response response = await http.get(Uri.parse('$URL_PESQUISA&q=$pesquisap'));
    if (response.statusCode == 200) {
      List<dynamic> dadosJsonp = await json.decode(response.body);
      print("dadosJsonp: $dadosJsonp");

      List<Pesquisa> p = dadosJsonp[1].map<Pesquisa>((map) {
        print('map: $map');
        return Pesquisa.fromJson(map);
      }).toList();
      print("p: ${p[0].sugestoes}");

      return p;
/*
      for (var video in dadosJson["items"]) {
        print("resultado" + dadosJson["items"].toString());
      }*/
    } else {}
  }
}