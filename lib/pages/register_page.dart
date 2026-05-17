import 'package:flutter/material.dart';

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

  // 🔥 TAMBAHAN
  String gender = "Laki-laki";
  bool setuju = false;

  void register() {
    setState(() {
      if (!setuju) {
        info = "Harus setuju syarat!";
      } else if (passwordController.text != confirmController.text) {
        info = "Password tidak sama!";
      } else {
        info = "Register berhasil: ${namaController.text} ($gender)";
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [

              buildInput("Nama Lengkap", controller: namaController),
              const SizedBox(height: 15),

              buildInput("Email", controller: emailController),
              const SizedBox(height: 15),

              buildInput("Password",
                  controller: passwordController, isPassword: true),
              const SizedBox(height: 15),

              buildInput("Konfirmasi Password",
                  controller: confirmController, isPassword: true),

              const SizedBox(height: 20),

              // 🔥 RADIO BUTTON
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

              // 🔥 CHECKBOX
              CheckboxListTile(
                title: const Text("Saya setuju dengan syarat & ketentuan"),
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
                child: const Text("Sudah punya akun? Login"),
              ),

              const SizedBox(height: 15),

              Text(info),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput(String label,
      {required TextEditingController controller, bool isPassword = false}) {
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