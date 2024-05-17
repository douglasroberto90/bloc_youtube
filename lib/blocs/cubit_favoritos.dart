import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/video.dart';

class FavoritosCubit extends Cubit<List<Video>> {
  FavoritosCubit() : super([]);

  List<Video> favoritos = [];

  //entrada: uma id de video a ser favoritado ou desfavoritado
  //saida: uma lista de videos

  Future<SharedPreferences> _pegarLista() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<void> _salvarListaFavoritos(List<Video> videos) async {
    SharedPreferences prefs = await _pegarLista();
    List<String> listaSalvar = [];
    for(Video video in videos){
        Map<String, dynamic> json = Video.toJson(video);
        listaSalvar.add(jsonEncode(json));
    }
    await prefs.setStringList('favoritos', listaSalvar);
  }

  Future<void> adicionarFavoritoLista(Video video) async {
    favoritos.add(video);
    _salvarListaFavoritos(favoritos);
  }

  void removerFavoritoLista(Video video){
    favoritos.remove(video);
    _salvarListaFavoritos(favoritos);
  }

  Future<void> devolverVideos() async {
    SharedPreferences prefs = await _pegarLista();
    List<Video> favoritosInterna = [];
    List<String>? favoritosString = prefs.getStringList('favoritos');
    if (favoritosString != null) {
      for (String favorito in favoritosString) {
        Map<String, dynamic> json = jsonDecode(favorito);
        Video video = Video(
            id: json["id"],
            titulo: json["titulo"],
            thumb: json["thumb"],
            canal: json["canal"]);
        favoritosInterna.add(video);
      }
      favoritos=favoritosInterna;
      emit(favoritos);
    }
  }
}
