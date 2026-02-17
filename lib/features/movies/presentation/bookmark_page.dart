import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:netfilm_with_mobx/generated/app_localizations.dart';
import 'package:netfilm_with_mobx/shared/widgets/app_text.dart';
import '../store/movie/movie_store.dart';

class BookmarkPage extends StatelessWidget {
  final MoviesStore store;

  const BookmarkPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "Bookmarks",
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (store.bookmarkedMovies.isEmpty) {
            return Center(
              child: AppText(
                text: AppLocalizations.of(context)!.noBookmark,
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            );
          }

          return ListView.builder(
            itemCount: store.bookmarkedMovies.length,
            itemBuilder: (_, index) {
              final movie = store.bookmarkedMovies[index];

              return ListTile(
                leading:
                    movie.posterPath.isNotEmpty
                        ? Image.network(
                          "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                        )
                        : const Icon(Icons.image),
                title: AppText(
                  text: movie.title,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                subtitle: AppText(
                  text: movie.overview,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
