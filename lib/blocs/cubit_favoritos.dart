import 'package:bloc_youtube/repositories/repositorio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/video.dart';

class FavoritosCubit extends Cubit<List<Video>> {
  FavoritosCubit() : super([]);

  List<Video> favoritos = [];

  //entrada: uma id de video a ser favoritado ou desfavoritado
  //saida: uma lista de videos

  Future<void> adicionarFavoritoLista(Video video) async {
    favoritos.add(video);
    await Repositorio.salvarListaFavoritos(favoritos);
  }

  Future<void> removerFavoritoLista(Video video) async {
    favoritos.remove(video);
    await Repositorio.salvarListaFavoritos(favoritos);
  }

  Future<void> devolverVideos() async {
      favoritos= (await Repositorio.devolverVideos())!;
      emit(favoritos);
    }
  }

