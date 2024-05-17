import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cubit_favoritos.dart';
import '../models/video.dart';
import '../widgets/card_favorito.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        centerTitle: true,
      ),
        body: BlocBuilder<FavoritosCubit, List<Video>>(
          builder: (context, lista) {
            return Center(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return CardFavorito(video: lista[index]);
                },
              ),
            );
          },
        )
    );
  }
}
