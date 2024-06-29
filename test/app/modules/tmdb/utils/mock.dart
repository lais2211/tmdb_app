import 'package:tmdb_app/app/modules/tmdb/domain/entities/cast_entity.dart';
import 'package:tmdb_app/app/modules/tmdb/domain/entities/movie_entity.dart';

Map<String, Object> movieResult = {
  "results": [
    {
      "adult": false,
      "backdrop_path": "/xg27NrXi7VXCGUr7MG75UqLl6Vg.jpg",
      "genre_ids": [16, 10751, 12, 35],
      "id": 1022789,
      "original_language": "en",
      "original_title": "Inside Out 2",
      "overview":
          "Divertida Mente 2, da Disney e Pixar, volta a entrar na mente da agora adolescente Riley, no momento em que a Sala de Comando passa por uma repentina demolição para dar lugar a algo totalmente inesperado: novas Emoções. Alegria, Tristeza, Raiva, Medo e Nojinho, que há muito tempo comandam uma operação de sucesso, não sabem ao certo como se sentem quando a Ansiedade, a Inveja, o Tédio e a Vergonha chegam.",
      "popularity": 6047.321,
      "poster_path": "/9h2KgGXSmWigNTn3kQdEFFngj9i.jpg",
      "release_date": "2024-06-11",
      "title": "Divertida Mente 2",
      "video": false,
      "vote_average": 7.759,
      "vote_count": 851
    },
  ]
};

Map<String, Object> castResult = {
  "cast": [
    {
      "adult": false,
      "gender": 2,
      "id": 16270,
      "known_for_department": "Acting",
      "name": "Christopher Guard",
      "original_name": "Christopher Guard",
      "popularity": 5.494,
      "profile_path": "/9fiBRqKot5xXngtjQGJq0CdZvYp.jpg",
      "cast_id": 1,
      "character": "Frodo (voice)",
      "credit_id": "52fe421bc3a36847f80047df",
      "order": 0
    },
  ]
};

List<MovieEntity> getMovies() {
  return [
    MovieEntity(
      id: 1,
      title: 'Movie 1',
      posterPath: '/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg',
      overview: 'overview',
      releaseDate: '2021-10-10',
      voteAverage: 1.0,
      voteCount: 1,
    ),
    MovieEntity(
      id: 2,
      title: 'Movie 2',
      posterPath: '/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg',
      overview: 'overview',
      releaseDate: '2021-10-10',
      voteAverage: 1.0,
      voteCount: 1,
    ),
  ];
}

List<CastEntity> getCast() {
  return [
    CastEntity(
      name: 'Name 1',
      profilePath: '/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg',
    ),
    CastEntity(
      name: 'Name 2',
      profilePath: '/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg',
    )
  ];
}
