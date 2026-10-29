import 'package:flutter/material.dart';
import 'package:wisata_candi_devintanjungan/data/candi_data.dart';
import 'package:wisata_candi_devintanjungan/screens/detail_screen.dart';
import 'package:provider/provider.dart';
import 'providers/favorite_provider.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
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
      home: DetailScreen(candi: candiList[0],),
    );
  }
}
