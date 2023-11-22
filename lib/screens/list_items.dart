import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toko_pbp_mobile/widgets/left_drawer.dart';
import 'package:toko_pbp_mobile/models/items.dart';
import 'package:toko_pbp_mobile/screens/detail_item.dart';
import 'package:toko_pbp_mobile/screens/login.dart';

class ShowItemPage extends StatefulWidget {
  const ShowItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ShowItemPage> {
  Future<List<Item>> fetchProduct() async {
    String uname = LoginPage.uname;
    var url = Uri.parse('http://127.0.0.1:8000/json-user/$uname/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> listItem = [];
    for (var d in data) {
      if (d != null) {
        listItem.add(Item.fromJson(d));
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Item'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style: TextStyle(color: Colors.redAccent, fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemDetailPage(
                                          item: snapshot.data![index],
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.name}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.amount}"),
                                const SizedBox(height: 10),
                                Text(
                                    "${snapshot.data![index].fields.description}")
                              ],
                            ),
                          )));
                }
              }
            }));
  }
}
