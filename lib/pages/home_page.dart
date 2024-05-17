import 'package:bloc_youtube/blocs/cubit_favoritos.dart';
import 'package:bloc_youtube/blocs/cubit_videos.dart';
import 'package:bloc_youtube/widgets/card_video.dart';
import 'package:flutter/material.dart';
import 'package:bloc_youtube/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/video.dart';
import 'favorites_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Video> videos = [];
  TextEditingController controllerPesquisa = TextEditingController();
  bool mostrandoBarraPesquisa = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: Image.asset("assets/yt_logo_rgb_dark.png"),
            height: 25,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                context.read<FavoritosCubit>().devolverVideos();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavoritesPage()));
              },
            ),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  if (mostrandoBarraPesquisa) {
                    ScaffoldMessenger.of(context)
                        .clearMaterialBanners();
                    mostrandoBarraPesquisa = false;
                  }
                  else {
                    MaterialBanner material = MaterialBanner(
                        content: TextField(
                          controller: controllerPesquisa,
                          decoration:
                          InputDecoration(labelText: "Digite sua pesquisa"),
                        ),
                        actions: [
                          IconButton(
                              onPressed: () async {
                                context.read<VideosCubit>().buscar(
                                    controllerPesquisa.text);
                                ScaffoldMessenger.of(context)
                                    .clearMaterialBanners();
                              },
                              icon: Icon(Icons.send))
                        ]);
                    ScaffoldMessenger.of(context).showMaterialBanner(material);
                    mostrandoBarraPesquisa = true;
                  }
                }
            ),
          ],
        ),
        body: BlocBuilder<VideosCubit, List<Video>>(
          builder: (context, lista) {
            return Center(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return CardVideo(video: lista[index]);
                },

              ),
            );
          },
        )
    );
  }
}

/*
https://www.googleapis.com/youtube/v3/search?part=snippet&q=banana&type=video&key=AIzaSyBvYkbXMz-qXux_c2x7G3Yv3vClrQdJ9KM&maxResults=10
 */
