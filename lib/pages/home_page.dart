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
              onPressed: () {
                context.read<FavoritosCubit>().devolverVideos();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavoritesPage()));
              },
              icon: Icon(Icons.star)),
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
                            context.read<VideosCubit>().buscar(controllerPesquisa.text);
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
