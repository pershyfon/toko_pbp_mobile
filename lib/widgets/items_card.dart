import 'package:flutter/material.dart';

class Ramuan {
  final String name;
  final int amount;
  final int price;
  final String description;

  Ramuan(this.name, this.amount, this.price, this.description);
}

// List untuk menyimpan produk
List<Ramuan> ramuanList = [];

class RamuanCard extends StatelessWidget {
  final Ramuan item;

  const RamuanCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.pink[100],
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text(item.name)));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.deepPurple),
                ),
                Text(
                  item.amount.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.deepPurple),
                ),
                Text(
                  "Rp${item.price.toString()}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.deepPurple),
                ),
                Text(
                  item.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.deepPurple),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}