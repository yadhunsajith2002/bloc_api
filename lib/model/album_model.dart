// To parse this JSON data, do
//
//     final albumModel = albumModelFromJson(jsonString);

import 'dart:convert';

class AlbumModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  AlbumModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}
