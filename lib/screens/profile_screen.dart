import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_devintanjungan/providers/favorite_provider.dart';
import 'package:wisata_candi_devintanjungan/widgets/profile_info_item.dart';
import 'package:wisata_candi_devintanjungan/providers/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  // TODO: 5. Implementasi fungsi signIn
  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  // TODO: 6. Implementasi fungsi signOut
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCount =
        context.watch<FavoriteProvider>().count;
    final auth =
        context.watch<AuthProvider>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          SizedBox(height: 20,),
          Divider(color: Colors.deepPurple[100],),
          SizedBox(height: 4,),
          Column(
            children: [
              // TODO: 2. Buat ProfileHeader (foto profil)
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200 - 50),
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
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/placeholder_image.png'),
                        ),
                      ),
                      if (isSignedIn)
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt,
                              color: Colors.deepPurple[50]),
                        ),
                    ],
                  ),
                ),
              ),
              // TODO: 3. Buat ProfileInfo (info pengguna)
              ProfileInfoItem(
                icon: Icons.lock,
                label: 'Pengguna',
                value: userName,
                iconColor: Colors.amber,
              ),
              // SizedBox, Divider, SizedBox
              SizedBox(height: 4,),
              Divider(color: Colors.deepPurple[100]),
              SizedBox(height: 20,),
              ProfileInfoItem(
                icon: Icons.person,
                label: 'Nama',
                value: fullName,
                showEditIcon: isSignedIn,
                onEditPressed: () => debugPrint('Icon edit ditekan'),
                iconColor: Colors.blue,
              ),
              // SizedBox, Divider, SizedBox
              SizedBox(height: 4,),
              Divider(color: Colors.deepPurple[100]),
              SizedBox(height: 20,),
              ProfileInfoItem(
                icon: Icons.favorite,
                label: 'Favorit',
                value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                iconColor: Colors.red,
              ),

              // TODO: 4. Buat ProfileActions (tombol sign in/out)
              SizedBox(height: 4,),
              Divider(color: Colors.deepPurple[100]),
              SizedBox(height: 20,),
              auth.isSignedIn
                  ? TextButton(onPressed: () =>
                  context.read<AuthProvider>().signOut(),
                  child: const Text('Sign Out'))
                  : TextButton(onPressed: signIn, child: const Text('Sign In')),
            ],
          ),
        ],
      ),
    );
  }
}

