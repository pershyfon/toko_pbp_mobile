import 'package:flutter/material.dart';
import 'package:toko_pbp_mobile/widgets/left_drawer.dart';
import 'package:toko_pbp_mobile/widgets/items_card.dart';

class ShowRamuanPage extends StatelessWidget {
  ShowRamuanPage({Key? key}) : super(key: key);

  final List<Ramuan> items = ramuanList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Daftar Ramuan',
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((Ramuan item) {
                  return RamuanCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
