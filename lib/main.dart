import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.black, // Netflix primary color
      ),
      debugShowCheckedModeBanner: false,
      home: const NetflixHomePage(),
    ),
  );
}

class NetflixHomePage extends StatefulWidget {
  const NetflixHomePage({Key? key}) : super(key: key);

  @override
  _NetflixHomePageState createState() => _NetflixHomePageState();
}

class _NetflixHomePageState extends State<NetflixHomePage> {
  // Movie lists
  List<Map<String, String>> trendingMovies = [
    {
      'imageUrl':
      'https://image.tmdb.org/t/p/original/9b9XJQElx8TD7oJT5rDaK1kWnF7.jpg',
      'name': 'Train to Busan',
    },
    {
      'imageUrl':
      'https://4.bp.blogspot.com/-uTD-3t7Yny8/TmGHpCxqcII/AAAAAAAAAH0/1CKbCEzOagw/s1600/Mediafire+One+Piece+Movie+03+Download+Anime.jpg',
      'name': 'One Piece',
    },
    {
      'imageUrl':
      'https://image.tmdb.org/t/p/original/qD9swRIaCCPQlnH6GkHyqO8E6E9.jpg',
      'name': 'Naruto',
    },
    {
      'imageUrl':
      'https://img3.wikia.nocookie.net/__cb20141118000029/dragonball/images/d/d2/Dbz_movie_2015_poster.jpg',
      'name': 'Dragon Ball Z',
    },
    {
      'imageUrl':
      'https://image.tmdb.org/t/p/original/8Y7WrRK1iQHEX7UIftBeBMjPjWD.jpg',
      'name': 'Avatar',
    },
    {
      'imageUrl':
      'https://image.tmdb.org/t/p/original/ujMbCKTmfV8rP6IGWfTSjXwr3mG.jpg',
      'name': 'Beekeeper',
    },
    {
      'imageUrl':
      'https://image.tmdb.org/t/p/original/1SlhjVF0QYYd3c8fJehGDrFfrQI.jpg',
      'name': 'Dead Pool 3',
    },
    {
      'imageUrl':
      'https://1.bp.blogspot.com/-uzRa3MaysHQ/VEcjx8Gpi8I/AAAAAAAAeWg/B_n6dtZM2dM/s1600/FURY%2Bposter.jpg',
      'name': 'Fury',
    },
  ];

  List<Map<String, String>> continueWatchingMovies = [
    {
      'imageUrl':
      'https://4.bp.blogspot.com/-uTD-3t7Yny8/TmGHpCxqcII/AAAAAAAAAH0/1CKbCEzOagw/s1600/Mediafire+One+Piece+Movie+03+Download+Anime.jpg',
      'name': 'One Piece',
    },
    {
      'imageUrl':
      'https://img3.wikia.nocookie.net/__cb20141118000029/dragonball/images/d/d2/Dbz_movie_2015_poster.jpg',
      'name': 'Dragon Ball Z',
    },
    {
      'imageUrl':
      'https://1.bp.blogspot.com/-uzRa3MaysHQ/VEcjx8Gpi8I/AAAAAAAAeWg/B_n6dtZM2dM/s1600/FURY%2Bposter.jpg',
      'name': 'Fury',
    },
    {
      'imageUrl':
      'https://image.tmdb.org/t/p/original/1SlhjVF0QYYd3c8fJehGDrFfrQI.jpg',
      'name': 'Dead Pool 3',
    },
  ];

  // Method to build movie poster widget
  Widget _buildMoviePoster(Map<String, String> movie) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(movie['imageUrl']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(😎,
              color: Colors.black.withOpacity(0.5),
              child: Text(
                movie['name']!,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "NETFLIX",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Continue Watching',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'View All',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: continueWatchingMovies.map((movie) => _buildMoviePoster(movie)).toList(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Trending Now',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: trendingMovies.map((movie) => _buildMoviePoster(movie)).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
