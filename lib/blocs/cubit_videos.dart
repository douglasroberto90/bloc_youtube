import 'package:bloc_youtube/models/video.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_youtube/utils.dart';

class VideosCubit extends Cubit<List<Video>> {
  VideosCubit() : super([]);

  //entrada: um termo a ser pesquisado
  //saida: uma lista de videos

  Future<void> buscar(String buscar) async {
    List<Video> videos = await Utils.buscarVideos(buscar);
    emit(videos);
  }

}


