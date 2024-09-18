import 'package:flutter/material.dart';
import 'package:movies/pages/favorite_movies_page.dart';
import 'package:movies/pages/movie_db_page.dart';
import 'package:movies/pages/my_movies_page.dart';
import 'package:movies/pages/profile_page.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
     MyMoviesPage(),
    MovieDbPage(),
    FavoriteMoviesPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
       title: Text('Movies'),
     ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Mis Peliculas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Movie DB',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Peliculas Favoritas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
           unselectedItemColor: Colors.grey,
           onTap: _onItemTapped
      ),
    );
  }
}
