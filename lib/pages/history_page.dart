import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  String pemasukanData = "Belum ada data pemasukan";
  String pengeluaranData = "Belum ada data pengeluaran";

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // 🔥 TAB BAR
        Container(
          color: Colors.blue,

          child: TabBar(
            controller: tabController,

            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,

            tabs: const [

              Tab(
                icon: Icon(Icons.arrow_downward),
                text: "Pemasukan",
              ),

              Tab(
                icon: Icon(Icons.arrow_upward),
                text: "Pengeluaran",
              ),
            ],
          ),
        ),

        // 🔥 ISI TAB
        Expanded(
          child: TabBarView(
            controller: tabController,

            children: [

              // 🔥 TAB PEMASUKAN
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      pemasukanData,
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 15),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          pemasukanData =
                              "Gaji Bulanan - Rp 5.000.000";
                        });
                      },

                      child: const Text("Load Pemasukan"),
                    ),
                  ],
                ),
              ),

              // 🔥 TAB PENGELUARAN
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      pengeluaranData,
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 15),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          pengeluaranData =
                              "Belanja Bulanan - Rp 1.000.000";
                        });
                      },

                      child: const Text("Load Pengeluaran"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}