import 'package:bloc_youtube/blocs/cubit_videos.dart';
import 'package:bloc_youtube/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/cubit_favoritos.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VideosCubit>(create: (_) => VideosCubit()),
        BlocProvider<FavoritosCubit>(create: (_) => FavoritosCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}

