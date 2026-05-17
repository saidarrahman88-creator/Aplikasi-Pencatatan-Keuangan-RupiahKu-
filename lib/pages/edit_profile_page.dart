import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();

  String hasil = "";

  void simpanData() {
    setState(() {
      hasil =
          "Nama: ${namaController.text}\nEmail: ${emailController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 🔥 APP BAR
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Edit Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: SingleChildScrollView(
          child: Column(
            children: [

              const CircleAvatar(
                radius: 45,
                child: Icon(
                  Icons.person,
                  size: 45,
                ),
              ),

              const SizedBox(height: 25),

              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [

                  Expanded(
                    child: SizedBox(
                      height: 50,

                      child: ElevatedButton(
                        onPressed: simpanData,
                        child: const Text("Simpan"),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: SizedBox(
                      height: 50,

                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text("Batal"),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Text(
                hasil,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}