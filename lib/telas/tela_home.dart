import 'package:flutter/material.dart';
import 'package:you_tube/api.dart';
import 'package:you_tube/models/video.dart';
import 'package:image_network/image_network.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube/youtube.dart';

class telaHome extends StatefulWidget {
  String pesquisa;

  telaHome(this.pesquisa);

  @override
  State<telaHome> createState() => _telaHomeState();
}

class _telaHomeState extends State<telaHome> {
  _listarVideos(String pesquisa) {
    Future<List<Video>?> videos;

    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>?>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
                  List<Video> videos = snapshot.data ?? [];
                  if (snapshot.data == null) {
                    return Center(
                      child: Text('DEU RUIM'),
                    );
                  } else {
                    switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;

          case ConnectionState.active:
            break;
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            return ListView.separated(
                itemBuilder: (context, index) {
                  Video video = videos[index];
                  return GestureDetector(
                    onTap: (){
                      
                    },
                    child: Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(video.imagem ?? ""),
                        )),
                      ),
                      ListTile(
                        title: Text(
                          video.titulo ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(video.canal ?? ""),
                      )
                    ],
                  ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                itemCount: snapshot.data!.length);
            break;
        }
                  }
              return const AlertDialog();
      },
    );
  }
}