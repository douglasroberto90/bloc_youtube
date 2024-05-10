import 'package:bloc_youtube/widgets/card_video.dart';
import 'package:flutter/material.dart';
import 'package:bloc_youtube/utils.dart';
import '../models/video.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Video> videos =[];
  TextEditingController controllerPesquisa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Image.asset("assets/yt_logo_rgb_dark.png"),
          height: 25,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.star)),
          IconButton(
              onPressed: () {
                MaterialBanner material = MaterialBanner(
                    content: TextField(
                      controller: controllerPesquisa,
                      decoration:
                          InputDecoration(labelText: "Digite sua pesquisa"),
                    ),
                    actions: [
                      IconButton(
                          onPressed: () async {
                            //colocar o metodo de pesquisa aqui
                            videos= await Utils.buscarVideos(controllerPesquisa.text);
                            print(videos);
                            ScaffoldMessenger.of(context)
                                .clearMaterialBanners();
                          },
                          icon: Icon(Icons.send))
                    ]);
                ScaffoldMessenger.of(context).showMaterialBanner(material);
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: CardVideo(video: Video(id: "0OmRrFD8zJk",
          titulo: "Anitta feat. Becky G - Banana [Official Music Video]",
          thumb: 	"https://i.ytimg.com/vi/0OmRrFD8zJk/hqdefault.jpg",
          canal: "Anitta")),
    );
  }
}
