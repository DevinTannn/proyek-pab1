import 'package:flutter/material.dart';
import 'package:wisata_candi_devintanjungan/models/candi.dart';
import 'package:wisata_candi_devintanjungan/data/candi_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  //List<Candi> _filteredCandis = [];
  List<Candi> _filteredCandis = List<Candi>.from(candiList);
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat Appbar dengan judul Pencarian Candi
      appBar: AppBar(
        title: Text(
            'Pencarian Candi'
        ),
      ),
      // TODO: 3. Buat Body berupa Column
      body: Column(
        children: [
          // TODO: 4. Buat TextField pencarian sebagai anak dari Column
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Cari candi',
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ), // Perbaikan: Ditambahkan tanda koma (,)
          // TODO: 5. Buat ListView hasil pencarian sebagai anak dari Column
          Expanded( // Perbaikan: Dibungkus Expanded agar ListView tidak overflow di dalam Column
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index) {
                final candi = _filteredCandis[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            candi.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                candi.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(candi.location),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}