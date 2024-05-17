import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cubit_favoritos.dart';
import '../models/video.dart';
import '../pages/video_page.dart';

class CardFavorito extends StatelessWidget {
  CardFavorito({required this.video, super.key});

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
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.network(video.thumb),
            ),
            Expanded(
              child: Text(video.titulo),
            ),
            Container(
                width: 100,
                height: 100,
                child: IconButton(
                    onPressed: () {
                      context.read<FavoritosCubit>().removerFavoritoLista(video);
                      context.read<FavoritosCubit>().devolverVideos();
                    },
                    icon: Icon(Icons.delete_outlined))),
          ],
        ),
      ),
    );
  }
}
