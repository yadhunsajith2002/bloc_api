import 'package:bloc_api/bloc/user_bloc.dart';
import 'package:bloc_api/bloc/user_event.dart';
import 'package:bloc_api/bloc/user_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  AlbumBloc userBloc = AlbumBloc();

  @override
  void initState() {
    userBloc.add(GetDataList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(" Bloc API")),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (_) => userBloc,
            child: BlocListener<AlbumBloc, UserState>(
              listener: (context, state) {
                if (state is DataError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
              },
              child: BlocBuilder<AlbumBloc, UserState>(
                builder: (context, state) {
                  if (state is InitialData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadingData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AlbumLoadedData) {
                    return ListView.builder(
                      itemCount: state.usermodel.length,
                      itemBuilder: (context, index) {
                        final data = state.usermodel[index]!;
                        return ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  NetworkImage(data.url.toString()),
                            ),
                            title: Text(
                              data.title.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Container(
                              width: 250.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  image: NetworkImage(data.thumbnailUrl
                                      .toString()), // Replace with your image asset path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ));
                      },
                    );
                  } else if (state is DataError) {
                    return Center(
                      child: Text(state.message.toString()),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
        ));
  }
}
