import 'dart:convert';

import 'package:bloc_api/model/album_model.dart';
import 'package:bloc_api/model/user_model.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiServices {
  Future<UserModel?> getDetails() async {
    String uri = 'https://dummy.restapiexample.com/api/v1/employees';
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      UserModel userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }
}

class AlbumApiServices {
  Future<List<AlbumModel?>> getDetails() async {
    List<AlbumModel> album = [];
    String uri = 'https://jsonplaceholder.typicode.com/photos';
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      var data = response.body;

      var decodedData = jsonDecode(data);
      album = List<AlbumModel>.from(
          decodedData.map((data) => AlbumModel.fromJson(data)));

      return album;
    }
    return album;
  }
}
