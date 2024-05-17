import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/video.dart';

class Repositorio{

  static Future<SharedPreferences> _pegarLista() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> salvarListaFavoritos(List<Video> videos) async {
    SharedPreferences prefs = await _pegarLista();
    List<String> listaSalvar = [];
    for(Video video in videos){
      Map<String, dynamic> json = Video.toJson(video);
      listaSalvar.add(jsonEncode(json));
    }
    await prefs.setStringList('favoritos', listaSalvar);
  }

  static Future<List<Video>?> devolverVideos() async {
    SharedPreferences prefs = await _pegarLista();
    List<Video> favoritos = [];
    List<String>? favoritosString = prefs.getStringList('favoritos');
    if (favoritosString != null) {
      for (String favorito in favoritosString) {
        Map<String, dynamic> json = jsonDecode(favorito);
        Video video = Video(
            id: json["id"],
            titulo: json["titulo"],
            thumb: json["thumb"],
            canal: json["canal"]);
        favoritos.add(video);
      }
      return favoritos;
    }
  }
}