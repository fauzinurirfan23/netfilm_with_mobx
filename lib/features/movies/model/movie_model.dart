class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final List<int> genreIds;
  final double voteAverage;
  final String releaseDate;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    this.voteAverage = 0,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"],
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      genreIds: List<int>.from(json["genre_ids"] ?? []),
      voteAverage: (json["vote_average"] ?? 0).toDouble(),
      releaseDate: json["release_date"] ?? "",
    );
  }
}
