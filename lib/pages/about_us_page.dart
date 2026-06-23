import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          buildMemberCard(
            image: "assets/images/said.jpg",
            nama: "Said Arrahman",
            nim: "0701232091",
            alamat: "Melati II, Kec.Perbaungan",
            noHp: "085761290934",
          ),

          buildMemberCard(
            image: "assets/images/irham.jpg",
            nama: "Muhammad Irham Mubaroq",
            nim: "0701233158",
            alamat: "LK III JLN. KELUARGA SIMPANG TANGSI GG.BERSAMA",
            noHp: "085267463168",
          ),

          buildMemberCard(
            image: "assets/images/azhari.jpg",
            nama: "Muhammad Azhari Musthofa",
            nim: "0701232094",
            alamat: "DUSUN IV GG.LANGGAR TEMBUNG",
            noHp: "082163233771",
          ),

          buildMemberCard(
            image: "assets/images/reza.jpg",
            nama: "Muhammad Reza",
            nim: "0701232092",
            alamat: "Jalan Enau 1. Perumnas Batu VI",
            noHp: "083197867531",
          ),
        ],
      ),
    );
  }

  Widget buildMemberCard({
    required String image,
    required String nama,
    required String nim,
    required String alamat,
    required String noHp,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(image),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Nama : $nama",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "NIM : $nim",
                    style: const TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "Alamat : $alamat",
                    style: const TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "No HP : $noHp",
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}