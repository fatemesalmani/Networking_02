import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:dio/dio.dart';

class Album {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Album({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Album.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }
}

class HttpClient{
  static Dio instance=Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com/'
  ));
}

Future<List<Album>> getAlbums() async{
  final response= await HttpClient.instance.get('photos');
  final List<Album> students=[];
  if (response.data is List<dynamic>){
    for (var element in (response.data as List<dynamic>)) { 
      students.add(Album.fromJson(element));
    }
  }
  return students;
}
