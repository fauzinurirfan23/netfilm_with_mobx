import 'package:mobx/mobx.dart';
import '../../model/movie_model.dart';
import '../../service/movie_service.dart';
import 'package:rxdart/rxdart.dart';

part 'movie_store.g.dart';

class MoviesStore = _MoviesStore with _$MoviesStore;

enum SortType { none, ascending, descending }

abstract class _MoviesStore with Store {
  final MoviesService service = MoviesService();
  final PublishSubject<String> _searchSubject = PublishSubject<String>();
  final PublishSubject<void> _scrollSubject = PublishSubject<void>();

  _MoviesStore() {
    _searchSubject
        .debounceTime(const Duration(milliseconds: 500))
        .distinct()
        .listen((query) async {
          searchQuery = query;
          await refreshMovies();
        });

    _scrollSubject.throttleTime(const Duration(milliseconds: 500)).listen((_) {
      fetchMoviesPagination();
    });
  }

  void dispose() {
    _searchSubject.close();
    _scrollSubject.close();
  }

  @observable
  ObservableList<MovieModel> movies = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMore = false;

  @observable
  SortType sortType = SortType.none;

  @observable
  int currentPage = 1;

  @observable
  bool isLastPage = false;

  @observable
  String searchQuery = "";

  @observable
  int? selectedYear;

  @observable
  double? rating;

  @observable
  ObservableSet<int> bookmarkedIds = ObservableSet();

  Future<void> fetchMoviesPagination() async {
    if (isLoading || isLoadingMore || isLastPage) return;

    if (currentPage == 1) {
      isLoading = true;
    } else {
      isLoadingMore = true;
    }

    final result =
        searchQuery.isEmpty
            ? await service.discoverMovies(
              page: currentPage,
              sortType: sortType,
              rating: rating ?? 0,
              year: selectedYear,
            )
            : await service.searchMoviesWithFilter(
              query: searchQuery,
              page: currentPage,
              minRating: rating ?? 0,
              year: selectedYear,
            );

    if (result.isEmpty) {
      isLastPage = true;
    } else {
      movies.addAll(result);
      currentPage++;
    }
    isLoading = false;
    isLoadingMore = false;
  }

  @action
  Future<void> changeSort(SortType type) async {
    sortType = type;
    await refreshMovies();
  }

  @action
  void setSearch(String value) {
    _searchSubject.add(value);
  }

  @action
  Future<void> refreshMovies() async {
    currentPage = 1;
    isLastPage = false;
    movies.clear();

    await fetchMoviesPagination();
  }

  @action
  void toggleBookmark(int movieId) {
    if (bookmarkedIds.contains(movieId)) {
      bookmarkedIds.remove(movieId);
    } else {
      bookmarkedIds.add(movieId);
    }
  }

  @action
  Future<void> setYear(int? year) async {
    selectedYear = year;
    await refreshMovies();
  }

  bool isBookmarked(int movieId) {
    return bookmarkedIds.contains(movieId);
  }

  @computed
  List<MovieModel> get bookmarkedMovies {
    return movies.where((movie) => bookmarkedIds.contains(movie.id)).toList();
  }

  void onScrollReachedBottom() {
    _scrollSubject.add(null);
  }
}
