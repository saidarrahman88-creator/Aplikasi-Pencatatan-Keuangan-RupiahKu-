import 'package:flutter/material.dart';
import '../data/user_data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  String info = "";

  String gender = "Laki-laki";
  bool setuju = false;

  void register() {
    if (namaController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      setState(() {
        info = "Semua data harus diisi";
      });
      return;
    }

    if (!setuju) {
      setState(() {
        info = "Harus setuju syarat & ketentuan!";
      });
      return;
    }

    if (passwordController.text != confirmController.text) {
      setState(() {
        info = "Password tidak sama!";
      });
      return;
    }

    UserData.nama = namaController.text;
    UserData.email = emailController.text;
    UserData.password = passwordController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Register berhasil"),
        backgroundColor: Colors.green,
      ),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildInput(
                "Nama Lengkap",
                controller: namaController,
              ),

              const SizedBox(height: 15),

              buildInput(
                "Email",
                controller: emailController,
              ),

              const SizedBox(height: 15),

              buildInput(
                "Password",
                controller: passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 15),

              buildInput(
                "Konfirmasi Password",
                controller: confirmController,
                isPassword: true,
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Laki-laki"),
                      value: "Laki-laki",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                  ),

                  Expanded(
                    child: RadioListTile(
                      title: const Text("Perempuan"),
                      value: "Perempuan",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              CheckboxListTile(
                title: const Text(
                  "Saya setuju dengan syarat & ketentuan",
                ),
                value: setuju,
                onChanged: (value) {
                  setState(() {
                    setuju = value!;
                  });
                },
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: register,
                  child: const Text("Register"),
                ),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Sudah punya akun? Login",
                ),
              ),

              if (info.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    info,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput(
    String label, {
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}