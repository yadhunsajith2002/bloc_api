import 'package:bloc/bloc.dart';
import 'package:bloc_api/bloc/user_event.dart';
import 'package:bloc_api/bloc/user_state.dart';
import 'package:bloc_api/repository/repository.dart';

import 'package:equatable/equatable.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialData()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetDataList>((event, emit) async {
      try {
        emit(LoadingData());
        final mList = await _apiRepository.fetchDataList();
        emit(LoadedData(mList!));
      } on NetworkError {
        emit(DataError("Failed to fetch data. is your device online?"));
      }
    });
  }
}

class AlbumBloc extends Bloc<UserEvent, UserState> {
  AlbumBloc() : super(InitialData()) {
    final AlbumRepository _apiRepository = AlbumRepository();

    on<GetDataList>((event, emit) async {
      try {
        emit(LoadingData());
        final mList = await _apiRepository.fetchDataList();
        emit(AlbumLoadedData(mList));
      } on NetworkError {
        emit(DataError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
