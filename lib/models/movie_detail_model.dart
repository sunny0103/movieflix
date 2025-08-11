class Genre {
  final String name;
  final int id;

  Genre({required this.name, required this.id});

  Genre.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      id = json['id'];
}

class MovieDetailModel {
  final String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      releaseDate,
      title;

  final bool adult, video;
  final List<Genre> genres;
  final int id, voteCount;
  final double popularity, voteAverage;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
    : adult = json['adult'],
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
      voteCount = json['vote_count'],
      genres =
          (json['genres'] as List)
              .map((genre) => Genre.fromJson(genre as Map<String, dynamic>))
              .toList();
}
