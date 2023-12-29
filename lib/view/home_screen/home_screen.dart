import 'package:bloc_api/bloc/user_bloc.dart';
import 'package:bloc_api/bloc/user_event.dart';
import 'package:bloc_api/bloc/user_state.dart';

import 'package:bloc_api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc userBloc = UserBloc();

  @override
  void initState() {
    userBloc.add(GetDataList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Bloc API")),
      body: _BuildBody(),
    );
  }

  Widget _BuildBody() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => userBloc,
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is DataError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is InitialData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadingData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadedData) {
                return ListView.builder(
                  itemCount: state.usermodel.data!.length,
                  itemBuilder: (context, index) {
                    final data = state.usermodel.data![index];
                    return ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/474x/98/51/1e/98511ee98a1930b8938e42caf0904d2d.jpg"),
                      ),
                      title: Text(
                        data.employeeName.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Age : ${data.employeeAge.toString()}"),
                          Text("Salary : ${data.employeeSalary.toString()}"),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is DataError) {
                return Center(
                  child: Text(state.message.toString()),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
