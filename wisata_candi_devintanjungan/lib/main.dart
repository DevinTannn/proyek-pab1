import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_devintanjungan/providers/auth_provider.dart';
import 'package:wisata_candi_devintanjungan/screens/home_screen.dart';
import 'package:wisata_candi_devintanjungan/screens/profile_screen.dart';
import 'package:wisata_candi_devintanjungan/screens/search_screen.dart';
import 'package:wisata_candi_devintanjungan/screens/favorite_screen.dart';
import 'package:wisata_candi_devintanjungan/screens/sign_in_screen.dart';
import 'package:wisata_candi_devintanjungan/screens/sign_up_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: DetailScreen(candi: candiList[0],),
      //home: SearchScreen(),
      //home: HomeScreen(),
      home: const MainScreen(),
      routes: {
        '/main': (context) => const MainScreen(),
        '/homescreen': (context) => const HomeScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //TODO: 1. Deklrasikan variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Buat properti Body berupa Widget yang ditampilkan
      body: _children[_currentIndex],
      //TODO: 3. Buat properti bottomNavigationBar demgan nilai Theme
      bottomNavigationBar: Theme(
        //TODO: 4. Buat Data dan Child dari Theme
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
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
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
