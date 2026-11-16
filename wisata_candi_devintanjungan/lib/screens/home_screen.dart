import 'package:flutter/material.dart';
import 'package:wisata_candi_devintanjungan/data/candi_data.dart';
import 'package:wisata_candi_devintanjungan/models/candi.dart';
import 'package:wisata_candi_devintanjungan/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 1. Buat appbar dengan judul Wisata Candi
      appBar: AppBar(
        title: const Text('Wisata Candi'),
      ),
      // TODO: 2. Buat body dengan GridView.builder
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: const EdgeInsets.all(8),
        itemCount: candiList.length,
        itemBuilder: (context, index) {
          final Candi candi = candiList[index];
          // TODO: 3. Return ItemCard dengan mengirim parameter candi
          return ItemCard(candi: candi);
        },
      ),
    );
  }
}