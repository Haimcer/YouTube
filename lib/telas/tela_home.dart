import 'package:flutter/material.dart';
import 'package:you_tube/api.dart';
import 'package:you_tube/models/video.dart';
import 'package:image_network/image_network.dart';

class telaHome extends StatefulWidget {
  const telaHome({super.key});

  @override
  State<telaHome> createState() => _telaHomeState();
}

class _telaHomeState extends State<telaHome> {
  _listarVideos() {
    Future<List<Video>> videos;

    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;

          case ConnectionState.active:
            break;
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.done:
            return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video> videos = snapshot.data!;
                  Video video = videos[index];
                  return Column(
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(video.canal ?? ""),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                itemCount: snapshot.data!.length);
            break;
        }
        return AlertDialog();
      },
    );
  }
}
