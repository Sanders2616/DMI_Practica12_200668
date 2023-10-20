import 'dart:async';
import 'package:practica12_200668/model/Media.dart';
import 'package:practica12_200668/common/HttpHandler.dart';

abstract class MediaProvider{
  Future<List<Media>> fetchMedia(String category);
}

class MovieProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
    Future<List<Media>> fetchMedia(String category){
      return _client.fetchShow(category: category);
    }
}