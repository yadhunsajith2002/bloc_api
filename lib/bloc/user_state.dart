import 'package:bloc_api/model/album_model.dart';
import 'package:bloc_api/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class InitialData extends UserState {}

class LoadingData extends UserState {}

class LoadedData extends UserState {
  final UserModel usermodel;
  const LoadedData(this.usermodel);
}

class AlbumLoadedData extends UserState {
  final List<AlbumModel?> usermodel;

  AlbumLoadedData(this.usermodel);
}

class DataError extends UserState {
  final String? message;
  const DataError(this.message);
}
