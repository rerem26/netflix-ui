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
  const NetflixHomePage({super.key});

  @override
  _NetflixHomePageState createState() => _NetflixHomePageState();
}
class _NetflixHomePageState extends State<NetflixHomePage> {
  // Movie lists
  List<String> trendingMovies = [
    'https://image.tmdb.org/t/p/original/9b9XJQElx8TD7oJT5rDaK1kWnF7.jpg', // Assuming 'movie1.png' is in your assets/images directory
    'https://4.bp.blogspot.com/-uTD-3t7Yny8/TmGHpCxqcII/AAAAAAAAAH0/1CKbCEzOagw/s1600/Mediafire+One+Piece+Movie+03+Download+Anime.jpg', // Assuming 'movie2.png' is in your assets/images directory
    'https://image.tmdb.org/t/p/original/qD9swRIaCCPQlnH6GkHyqO8E6E9.jpg', // Assuming 'movie3.png' is in your assets/images directory
    'https://img3.wikia.nocookie.net/__cb20141118000029/dragonball/images/d/d2/Dbz_movie_2015_poster.jpg',
    'https://image.tmdb.org/t/p/original/8Y7WrRK1iQHEX7UIftBeBMjPjWD.jpg',
    'https://image.tmdb.org/t/p/original/ujMbCKTmfV8rP6IGWfTSjXwr3mG.jpg',
    'https://image.tmdb.org/t/p/original/1SlhjVF0QYYd3c8fJehGDrFfrQI.jpg',
    'https://1.bp.blogspot.com/-uzRa3MaysHQ/VEcjx8Gpi8I/AAAAAAAAeWg/B_n6dtZM2dM/s1600/FURY%2Bposter.jpg',
  ];

  List<String> continueWatchingMovies = [
    'https://4.bp.blogspot.com/-uTD-3t7Yny8/TmGHpCxqcII/AAAAAAAAAH0/1CKbCEzOagw/s1600/Mediafire+One+Piece+Movie+03+Download+Anime.jpg',
    'https://img3.wikia.nocookie.net/__cb20141118000029/dragonball/images/d/d2/Dbz_movie_2015_poster.jpg',
    'https://1.bp.blogspot.com/-uzRa3MaysHQ/VEcjx8Gpi8I/AAAAAAAAeWg/B_n6dtZM2dM/s1600/FURY%2Bposter.jpg',
    'https://image.tmdb.org/t/p/original/1SlhjVF0QYYd3c8fJehGDrFfrQI.jpg',
  ];

  // Method to build movie poster widget
  Widget _buildMoviePoster(String imageUrl) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
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
                children: continueWatchingMovies.map((imageUrl) => _buildMoviePoster(imageUrl)).toList(),
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
                children: trendingMovies.map((imageUrl) => _buildMoviePoster(imageUrl)).toList(),
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
