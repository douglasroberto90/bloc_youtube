import 'package:bloc_youtube/pages/video_page.dart';
import 'package:flutter/material.dart';
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      video.titulo,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(video.canal),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
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
