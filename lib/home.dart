import 'package:flutter/material.dart';
import 'package:netfilm_with_mobx/core/theme/theme_store.dart';
import 'package:netfilm_with_mobx/features/movies/presentation/movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TheMovieDB")),
      body: MoviesPage(themeStore: ThemeStore()),
    );
  }
}
