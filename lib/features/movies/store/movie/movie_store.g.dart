// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviesStore on _MoviesStore, Store {
  Computed<List<MovieModel>>? _$bookmarkedMoviesComputed;

  @override
  List<MovieModel> get bookmarkedMovies =>
      (_$bookmarkedMoviesComputed ??= Computed<List<MovieModel>>(
            () => super.bookmarkedMovies,
            name: '_MoviesStore.bookmarkedMovies',
          ))
          .value;

  late final _$moviesAtom = Atom(name: '_MoviesStore.movies', context: context);

  @override
  ObservableList<MovieModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<MovieModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_MoviesStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingMoreAtom = Atom(
    name: '_MoviesStore.isLoadingMore',
    context: context,
  );

  @override
  bool get isLoadingMore {
    _$isLoadingMoreAtom.reportRead();
    return super.isLoadingMore;
  }

  @override
  set isLoadingMore(bool value) {
    _$isLoadingMoreAtom.reportWrite(value, super.isLoadingMore, () {
      super.isLoadingMore = value;
    });
  }

  late final _$sortTypeAtom = Atom(
    name: '_MoviesStore.sortType',
    context: context,
  );

  @override
  SortType get sortType {
    _$sortTypeAtom.reportRead();
    return super.sortType;
  }

  @override
  set sortType(SortType value) {
    _$sortTypeAtom.reportWrite(value, super.sortType, () {
      super.sortType = value;
    });
  }

  late final _$currentPageAtom = Atom(
    name: '_MoviesStore.currentPage',
    context: context,
  );

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$isLastPageAtom = Atom(
    name: '_MoviesStore.isLastPage',
    context: context,
  );

  @override
  bool get isLastPage {
    _$isLastPageAtom.reportRead();
    return super.isLastPage;
  }

  @override
  set isLastPage(bool value) {
    _$isLastPageAtom.reportWrite(value, super.isLastPage, () {
      super.isLastPage = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_MoviesStore.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$selectedYearAtom = Atom(
    name: '_MoviesStore.selectedYear',
    context: context,
  );

  @override
  int? get selectedYear {
    _$selectedYearAtom.reportRead();
    return super.selectedYear;
  }

  @override
  set selectedYear(int? value) {
    _$selectedYearAtom.reportWrite(value, super.selectedYear, () {
      super.selectedYear = value;
    });
  }

  late final _$ratingAtom = Atom(name: '_MoviesStore.rating', context: context);

  @override
  double? get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(double? value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$bookmarkedIdsAtom = Atom(
    name: '_MoviesStore.bookmarkedIds',
    context: context,
  );

  @override
  ObservableSet<int> get bookmarkedIds {
    _$bookmarkedIdsAtom.reportRead();
    return super.bookmarkedIds;
  }

  @override
  set bookmarkedIds(ObservableSet<int> value) {
    _$bookmarkedIdsAtom.reportWrite(value, super.bookmarkedIds, () {
      super.bookmarkedIds = value;
    });
  }

  late final _$changeSortAsyncAction = AsyncAction(
    '_MoviesStore.changeSort',
    context: context,
  );

  @override
  Future<void> changeSort(SortType type) {
    return _$changeSortAsyncAction.run(() => super.changeSort(type));
  }

  late final _$refreshMoviesAsyncAction = AsyncAction(
    '_MoviesStore.refreshMovies',
    context: context,
  );

  @override
  Future<void> refreshMovies() {
    return _$refreshMoviesAsyncAction.run(() => super.refreshMovies());
  }

  late final _$setYearAsyncAction = AsyncAction(
    '_MoviesStore.setYear',
    context: context,
  );

  @override
  Future<void> setYear(int? year) {
    return _$setYearAsyncAction.run(() => super.setYear(year));
  }

  late final _$_MoviesStoreActionController = ActionController(
    name: '_MoviesStore',
    context: context,
  );

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_MoviesStoreActionController.startAction(
      name: '_MoviesStore.setSearch',
    );
    try {
      return super.setSearch(value);
    } finally {
      _$_MoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleBookmark(int movieId) {
    final _$actionInfo = _$_MoviesStoreActionController.startAction(
      name: '_MoviesStore.toggleBookmark',
    );
    try {
      return super.toggleBookmark(movieId);
    } finally {
      _$_MoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
isLoading: ${isLoading},
isLoadingMore: ${isLoadingMore},
sortType: ${sortType},
currentPage: ${currentPage},
isLastPage: ${isLastPage},
searchQuery: ${searchQuery},
selectedYear: ${selectedYear},
rating: ${rating},
bookmarkedIds: ${bookmarkedIds},
bookmarkedMovies: ${bookmarkedMovies}
    ''';
  }
}
