import 'package:flutter/material.dart';
import 'scan_page.dart';
import 'dashboard_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final nominalController = TextEditingController();
  final tanggalController = TextEditingController();

  String hasil = "";

  bool pemasukan = false;
  bool pengeluaran = true;

  String selectedKategori = "Makanan";

  int selectedIndex = 0;

  void simpanData() {
    setState(() {
      hasil =
          "Nominal: ${nominalController.text}\nKategori: $selectedKategori\nTanggal: ${tanggalController.text}\nTipe: ${pengeluaran ? "Pengeluaran" : "Pemasukan"}";
    });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    }

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HistoryPage()),
      );
    }

    if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePage()),
      );
    }
  }

  // 🔥 BOTTOM SHEET
  void showScanOptions() {
    showModalBottomSheet(
      context: context,

      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Text(
                "Pilih Metode Scan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Scan Kamera"),

                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ScanPage(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Upload Gallery"),

                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Fitur upload gallery"),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 🔥 APP BAR
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Tambah Transaksi"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: SingleChildScrollView(
          child: Column(
            children: [

              TextField(
                controller: nominalController,
                decoration: const InputDecoration(
                  labelText: "Nominal",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // 🔥 DROPDOWN
              DropdownButtonFormField<String>(
                value: selectedKategori,

                items: ["Makanan", "Transport", "Belanja", "Lainnya"]
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),

                onChanged: (value) {
                  setState(() {
                    selectedKategori = value!;
                  });
                },

                decoration: const InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: tanggalController,
                decoration: const InputDecoration(
                  labelText: "Tanggal",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              // 🔥 CHECKBOX
              Row(
                children: [

                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Pengeluaran"),
                      value: pengeluaran,

                      onChanged: (value) {
                        setState(() {
                          pengeluaran = true;
                          pemasukan = false;
                        });
                      },
                    ),
                  ),

                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Pemasukan"),
                      value: pemasukan,

                      onChanged: (value) {
                        setState(() {
                          pemasukan = true;
                          pengeluaran = false;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 🔥 BUTTON SCAN + BOTTOM SHEET
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: showScanOptions,
                  child: const Text("Scan Struk"),
                ),
              ),

              const SizedBox(height: 10),

              // 🔥 BUTTON SIMPAN & KEMBALI
              Row(
                children: [

                  Expanded(
                    child: ElevatedButton(
                      onPressed: simpanData,
                      child: const Text("Simpan"),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text("Kembali"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                hasil,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),

      // 🔥 BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        currentIndex: selectedIndex,
        onTap: onItemTapped,

        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}