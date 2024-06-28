class MovieEntity {
  final int id;
  final String? title;
  final String? releaseDate;
  final String? overview;
  final String? posterPath;
  final int ? voteCount;
  final double ? voteAverage;

  MovieEntity({
    required this.id,
    this.title,
    this.releaseDate,
    this.overview,
    this.posterPath,
     this.voteAverage,
     this.voteCount,
  });
}
