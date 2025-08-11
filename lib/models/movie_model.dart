class MovieModel {
  final String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title;

  final bool adult, video;
  final List<dynamic> genreIds;
  final int id, voteCount;
  final double popularity, voteAverage;

  MovieModel.fromJson(Map<String, dynamic> json)
    : adult = json['adult'],
      genreIds = json['genre_ids'],
      id = json['id'],
      backdropPath = json['backdrop_path'],
      originalLanguage = json['original_language'],
      originalTitle = json['original_title'],
      overview = json['overview'],
      popularity = (json['popularity'] ?? 0).toDouble(),
      posterPath = json['poster_path'],
      releaseDate = json['release_date'],
      title = json['title'],
      video = json['video'],
      voteAverage = (json['vote_average'] ?? 0).toDouble(),
      voteCount = json['vote_count'];
}
