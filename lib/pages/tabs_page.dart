import 'package:flutter/material.dart';
import 'package:movies/pages/favorite_movies_page.dart';
import 'package:movies/pages/movie_db_page.dart';
import 'package:movies/pages/my_movies_page.dart';
import 'package:movies/pages/profile_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Mis Peliculas'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.movie), text: 'Mis Peliculas'),
                Tab(icon: Icon(Icons.search), text: 'Movie DB'),
                Tab(icon: Icon(Icons.favorite), text: 'Peliculas Favoritas'),
                Tab(icon: Icon(Icons.person), text: 'Perfil'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MyMoviesPage(),
              MovieDbPage(),
              FavoriteMoviesPage(),
              ProfilePage(),
            ],
          ),
        ),
      ),
    );
  }
}
