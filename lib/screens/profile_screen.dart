import 'package:flutter/material.dart';
import 'package:wisata_candi_devintanjungan/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = 'Devin Tanjungan';
  String userName = 'devin_t';
  int favoriteCandiCount = 5;

  // TODO: 5. Implementasi fungsi signIn
  void signIn() {
    setState(() {
      isSignedIn = true;
    });
  }

  // TODO: 6. Implementasi fungsi signOut
  void signOut() {
    setState(() {
      isSignedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Header
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),

          // Konten Utama
          SingleChildScrollView(
            child: Column(
              children: [
                // TODO: 2. Buat ProfileHeader (foto profil)
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // TODO: 3. Buat ProfileInfo (info pengguna)
                ProfileInfoItem(
                  icon: Icons.lock,
                  label: 'Pengguna',
                  value: userName,
                  iconColor: Colors.amber,
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 10),

                ProfileInfoItem(
                  icon: Icons.person,
                  label: 'Nama',
                  value: fullName,
                  showEditIcon: isSignedIn,
                  onEditPressed: () => debugPrint('Icon edit ditekan'),
                  iconColor: Colors.blue,
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 10),

                ProfileInfoItem(
                  icon: Icons.favorite,
                  label: 'Favorit',
                  value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '0',
                  iconColor: Colors.red,
                ),

                // TODO: 4. Buat ProfileActions (tombol sign in/out)
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 20),

                isSignedIn
                    ? ElevatedButton(
                  onPressed: signOut,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Sign Out'),
                )
                    : ElevatedButton(
                  onPressed: signIn,
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

