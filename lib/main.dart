import 'package:bloc_api/bloc/user_bloc.dart';
import 'package:bloc_api/repository/repository.dart';
import 'package:bloc_api/view/home_screen/album_screen/album_screen.dart';

import 'package:bloc_api/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlbumBloc>(
          create: (BuildContext context) => AlbumBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(),
        ),
      ],
      // create: (context) => UserBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomePage()),
    );
  }
}
