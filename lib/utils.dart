/*
    "https://www.googleapis.com/youtube/v3/search?part=
    snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
    "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
    "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"
 */

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'models/video.dart';

class Utils {
  static Future<List<Video>> buscarVideos(String termoBuscado) async {
    await dotenv.load(fileName: "keys.env");
    var apiKey = dotenv.env["API_KEY"];
    var url = Uri.https("www.googleapis.com", "/youtube/v3/search", {
      "part": "snippet",
      "q": termoBuscado,
      "type": "video",
      "key": apiKey,
      "maxResults": "10"
    });
    http.Response response = await http.get(url);
    return decodificar(response);
  }

  static List<Video> decodificar(http.Response response) {
    List<Video> videos = [];
    if (response.statusCode == 200) {
      var decodificado = json.decode(response.body);
      //_nextToken = decodificado["nextPageToken"];
      for (int i = 0; i < 8; i++) {
        videos.add(Video.fromJson(decodificado, i));
      }
      return videos;
    } else {
      throw Exception("Falha ao carregar os videos");
    }
  }

  Future<List> sugestoes(String termoBuscado) async {
    var url = Uri.http("suggestqueries.google.com", "/complete/search", {
      "hl": "en",
      "ds": "yt",
      "client": "youtube",
      "hjson": "t",
      "cp": "1",
      "q": termoBuscado,
      "format": "5",
      "alt": "json"
    });
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body)[1].map((v) {
        return v[0];
      }).toList();
    } else {
      throw Exception("Não foi possível carregar as sugestões");
    }
  }
}
