import 'package:bloc_youtube/blocs/cubit_favoritos.dart';
import 'package:bloc_youtube/pages/video_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/video.dart';

class CardVideo extends StatelessWidget {
  CardVideo({required this.video, super.key});

  Video video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPage(videoId: video.id)));
      },
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(video.thumb),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          video.titulo,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(video.canal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      context.read<FavoritosCubit>().adicionarFavoritoLista(video);
                    },
                    icon: Icon(
                      Icons.star_border,
                      size: 30,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
