import 'package:tmdb_app/app/modules/tmdb_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    super.title,
    super.overview,
    super.posterPath,
    super.releaseDate,
     super.voteAverage,
     super.voteCount,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
        id: map['id'],
        title: map['title'],
        overview: map['overview'],
        posterPath: map['poster_path'],
        voteAverage: map['vote_average'],
        voteCount: map['vote_count'],
        releaseDate: map['release_date']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'vote_count': voteCount
    };
  }
}
