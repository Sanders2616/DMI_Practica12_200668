import 'package:practica12_200668/common/Util.dart';
import 'package:practica12_200668/common/MediaProvider.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getbackDropUrl() => getLargePictureUrl(backdropPath);
  // List<String?> getGenres() => genresToList(genreIds);
  String getGenres() => getGenreValues(genreIds);
  int getReleaseYear() {
    if (releaseDate == null || releaseDate == "") {
      return 0;
    }
    return DateTime.parse(releaseDate).year;
  }

  factory Media(Map jsonMap, MediaType mediaType) {
    try {
      return Media.deserialize(jsonMap, mediaType);
    } catch (ex) {
      throw ex;
    }
  }

  Media.deserialize(Map json, MediaType mediaType)
      : id = json["id"].toInt(),
        voteAverage = json["vote_average"].toDouble(),
        title = json[mediaType == MediaType.movie ? "title" : "name"],
        posterPath = json["poster_path"] ?? "",
        backdropPath = json["backdrop_path"] ?? "",
        overview = json["overview"],
        releaseDate = json[mediaType == MediaType.movie ? "release_date" : "first_air_date"],
        genreIds = json["genre_ids"].toList();

  // Media.deserialize(Map json)
  //     : id = json["id"].toInt(),
  //       voteAverage = json["vote_average"].toDouble(),
  //       title = json["title"],
  //       posterPath = json["poster_path"] ?? "",
  //       backdropPath = json["backdrop_path"] ?? "",
  //       overview = json["overview"],
  //       releaseDate = json["release_date"], // Corrected field name
  //       genreIds = List<int>.from(json["genre_ids"]);
}

enum MediaType {movie, show}