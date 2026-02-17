import 'package:netfilm_with_mobx/core/network/api_service.dart';
import 'package:netfilm_with_mobx/features/movies/model/movie_model.dart';
import 'package:netfilm_with_mobx/features/movies/store/movie/movie_store.dart';

class MoviesService {
  final ApiService _service = ApiService();

  Future<List<MovieModel>> discoverMovies({
    required int page,
    required SortType sortType,
    required double rating,
    int? year,
  }) async {
    final sortValue =
        sortType == SortType.ascending ? "popularity.asc" : "popularity.desc";

    final data = await _service.get(
      "/discover/movie",
      params: {
        "page": page.toString(),
        "sort_by": sortValue,
        "vote_average.gte": rating.toString(),
        if (year != null) "primary_release_year": year.toString(),
      },
    );

    final results = data["results"] as List?;
    if (results == null) return [];

    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> searchMoviesWithFilter({
    required String query,
    required int page,
    required double minRating,
    int? year,
  }) async {
    final data = await _service.get(
      "/search/movie",
      params: {
        "query": query,
        "page": page.toString(),
        if (year != null) "primary_release_year": year.toString(),
      },
    );

    final results = data["results"] as List?;
    if (results == null) return [];

    final movies = results.map((e) => MovieModel.fromJson(e)).toList();

    return movies.where((movie) => movie.voteAverage >= minRating).toList();
  }
}
