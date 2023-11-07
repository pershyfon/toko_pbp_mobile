### Nama: Sabrina Aviana Dewi
### NPM: 2206030520
### Kelas: PBP-C

# PBP Tugas 7
## Perbedaan *Stateless* dan *Stateful Widget* dalam Flutter
Stateless dan stateful widget digunakan untuk membangun antarmuka pengguna (UI) pada pengembangan flutter. Perbedaan utama antara keduanya adalah dalam cara mereka mengelola dan merespons perubahan dalam data atau keadaan.
Stateless | Stateful
--- | ---
Tidak dapat berubah atau tidak dapat merespons perubahan data | Dapat berubah atau merespons perubahan data
Immutable atau tidak dapat diperbarui tampilannya | Mutable atau dapat diperbarui tampilannya
Contoh: title | Contoh: counter
## Widget yang Digunakan
Widget | Fungsi
--- | ---
Material | Mengatur halaman sesuai desain
Scaffold | Menyediakan kerangka halaman dengan AppBar, body, dan floating action button
SingleChildScrollView | Memungkinkan konten discroll
Padding | Menambahkan ruang di sekeliling widget
Column | Menampilkan widget-child secara vertikal dalam satu kolom
GridView.count | Menampilkan children dalam bentuk grid dengan jumlah baris dan kolom tertentu
InkWell | Membungkus widget agar dapat merespons sentuhan pengguna
Text | Menampilkan teks
Icon | Menampilkan ikon
AppBar | Menampilkan bilah aplikasi di bagian atas layar, seperti judul aplikasi
SnackBar | Menampilkan pesan singkat di bagian bawah layar, umumnya untuk memberikan informasi atau feedback

## Langkah Implementasi Checklist
### Membuat proyek flutter baru
1. Di command prompt direktori PBP menjalankan perintah:
```shell
flutter create toko_pbp_mobile
cd toko_pbp_mobile
```
2. Membuat repositori Github bernama "toko_pbp_mobile"
3. Melakukan `git init`
4. Melakukan `git add .`, git commit, `git remote add origin https://github.com/pershyfon/toko_pbp_mobile.git`, dan push ke Github
### Merapikan  Struktur Proyek
1. Membuat file baru bernama `menu.dart` dalam direktori `lib`
2. Memindahkan kode dari file `main.dart` ke file `menu.dart`sampai di `main.dart` tersisa:
```shell
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
3. Menambahkan `import 'package:shopping_list/menu.dart';` di awal file `main.dart`
### Membuat tombol yang menampilkan snackbar & mengganti warna tombol
1. Mendefinisikan class ShopItem di menu.dart
```shell
class ShopItem {
  final String name;
  final IconData icon;
  final Color color; // mendefinisikan warna

  ShopItem(this.name, this.icon, this.color);
}
```
2. Menambahkan list item yang dijual di class MyHomePage di menu.dart
```shell
  ...
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.pinkAccent), // warna tombol
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.redAccent), // warna tombol
    ShopItem("Logout", Icons.logout, Colors.purpleAccent), // warna tombol
  ];
  ...
```
3. Menambahkan widget untuk tampilan halaman & judul di class MyHomePage di menu.dart
```shell
  ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toko PBP',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'MAIN MENU', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  ...
```
4. Menambahkan class untuk menampilkan card tombol ShopItem dan snackbar di menu.dart
```shell
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
