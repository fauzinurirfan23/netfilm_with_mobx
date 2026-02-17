import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:netfilm_with_mobx/core/theme/theme_store.dart';
import 'package:netfilm_with_mobx/core/utils/colors.dart';
import 'package:netfilm_with_mobx/features/movies/presentation/bookmark_page.dart';
import 'package:netfilm_with_mobx/generated/app_localizations.dart';
import 'package:netfilm_with_mobx/shared/widgets/app_text.dart';

import '../store/movie/movie_store.dart';

class MoviesPage extends StatefulWidget {
  final ThemeStore themeStore;
  const MoviesPage({super.key, required this.themeStore});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final store = MoviesStore();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store.fetchMoviesPagination();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        store.onScrollReachedBottom();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: AppText(
          text: AppLocalizations.of(context)!.bookmark,
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.themeStore.toggleTheme();
            },
            icon: Observer(
              builder: (_) {
                return Icon(
                  widget.themeStore.isDark ? Icons.light_mode : Icons.dark_mode,
                );
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BookmarkPage(store: store)),
              );
            },
            icon: const Icon(Icons.bookmark),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.searchHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: store.setSearch,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: AppLocalizations.of(context)!.filterYear,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      Observer(
                        builder: (_) {
                          return DropdownButton<int?>(
                            value: store.selectedYear,
                            hint: const Text("Select Year"),
                            items: [
                              DropdownMenuItem<int?>(
                                value: null,
                                child: AppText(
                                  text: AppLocalizations.of(context)!.allYears,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              ...List.generate(20, (index) {
                                final year = DateTime.now().year - index;
                                return DropdownMenuItem<int?>(
                                  value: year,
                                  child: Text(year.toString()),
                                );
                              }),
                            ],
                            onChanged: (value) {
                              store.setYear(value);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: AppLocalizations.of(context)!.sortByPopularity,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      Observer(
                        builder: (context) {
                          return DropdownButton<SortType>(
                            value: store.sortType,
                            hint: Text('selected Sort'),
                            items: [
                              DropdownMenuItem(
                                value: SortType.none,
                                child: AppText(
                                  text:
                                      AppLocalizations.of(
                                        context,
                                      )!.defaultLabel,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              DropdownMenuItem(
                                value: SortType.descending,
                                child: AppText(
                                  text: AppLocalizations.of(context)!.highToLow,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              DropdownMenuItem(
                                value: SortType.ascending,
                                child: AppText(
                                  text: AppLocalizations.of(context)!.lowToHigh,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                store.changeSort(value);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Expanded(
              child: Observer(
                builder: (_) {
                  if (store.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Stack(
                    children: [
                      ListView.builder(
                        controller: _scrollController,
                        itemCount: store.movies.length,
                        itemBuilder: (_, index) {
                          final movie = store.movies[index];

                          return ListTile(
                            leading:
                                movie.posterPath.isNotEmpty
                                    ? Image.network(
                                      "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                                    )
                                    : const Icon(Icons.image),
                            title: Text(movie.title),
                            subtitle: Text(
                              movie.releaseDate.isNotEmpty
                                  ? movie.releaseDate.substring(0, 4)
                                  : '-',
                            ),
                            trailing: Observer(
                              builder: (context) {
                                final isSaved = store.isBookmarked(movie.id);
                                return IconButton(
                                  onPressed: () {
                                    store.toggleBookmark(movie.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          isSaved
                                              ? AppLocalizations.of(
                                                context,
                                              )!.successRemoveBookmark
                                              : AppLocalizations.of(
                                                context,
                                              )!.successAddBookmark,
                                        ),
                                        duration: const Duration(seconds: 1),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.bookmark,
                                    color:
                                        isSaved
                                            ? AppColors.btnPrimary
                                            : AppColors.btnSecondary,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
