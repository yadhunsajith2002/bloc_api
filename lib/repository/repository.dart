import 'package:bloc_api/model/album_model.dart';
import 'package:bloc_api/model/user_model.dart';
import 'package:bloc_api/services/api_services.dart';

class ApiRepository {
  final _provider = ApiServices();

  Future<UserModel?> fetchDataList() {
    return _provider.getDetails();
  }
}

class AlbumRepository {
  final _provider = AlbumApiServices();

  Future<List<AlbumModel?>> fetchDataList() {
    return _provider.getDetails();
  }
}

class NetworkError extends Error {}
