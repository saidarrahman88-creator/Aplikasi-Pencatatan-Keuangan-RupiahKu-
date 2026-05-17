import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String data = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            data,
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () {
              setState(() {
                data = "Contoh data transaksi";
              });
            },
            child: const Text("Load Data"),
          ),
        ],
      ),
    );
  }
}