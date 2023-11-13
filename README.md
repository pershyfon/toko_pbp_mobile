### Nama: Sabrina Aviana Dewi
### NPM: 2206030520
### Kelas: PBP-C

# Table of Contents
* [Tugas 7](https://github.com/pershyfon/toko_pbp_mobile/blob/master/README.md#pbp-tugas-7)
* [Tugas 8](https://github.com/pershyfon/toko_pbp_mobile/blob/master/README.md#pbp-tugas-8)

# PBP Tugas 8
## Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`
Untuk berpindah dari satu halaman ke halaman lainnya pada Flutter, kita bisa menggunakan widget Navigator, seperti `Navigator.push()` dan `Navigator.pushReplacement()`. Ketika `Navigator.push()` dijalankan, tampilan halaman aplikasi akan berganti ke halaman lain. Jika tombol back ditekan, akan kembali ke halaman sebelumnya. `push()` menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada user. Contohnya adalah pergantian halaman sederhana, seperti dari halaman 'Home' ke halaman 'Lihat Produk'. 
Namun, `Navigator.pushReplacement()` akan menampilkan halaman baru tanpa riwayat halaman sebelumnya atau tidak kembali ke halaman sebelumnya jika tombol back ditekan. Method pushReplacement() menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya (perhatikan urutan stack). Contoh penggunaannya adalah halaman 'Login', setelah user berhasil login akan masuk ke halaman 'Home'. Untuk itu kita tidak menginginkan user kembali ke halaman 'Login' jika tombol back ditekan.
## *Layout widget* pada Flutter
### Untuk mengatur ruang/jarak/posisi/penempatan widget-child:
- Container: Widget dasar untuk mengatur posisi, warna, dan ukuran layar dari beberapa widget-child
- Padding: Memberikan jarak dari dalam widget menuju widget lainnya
- Margin: Memberikan jarak di antara widget
- Align: Menempatkan widget di posisi topLeft, topRight, bottomLeft, bottomRight, dsb.
- Stack: Menempatkan widget di atas satu sama lain (bertumpuk)
### Untuk menampilkan data/item yang dapat digulir
- Row: Mengatur posisi widget yang berada dalam row secara vertikal atau ke kiri
- Column: Mengatur posisi widget yang berada dalam column secara horizontal atau ke bawah
- ListView: Mengatur widget dalam daftar gulir vertikal atau horizontal
### Untuk menampilkan data/item dalam bentuk tabel
- GridView: Mengatur widget dalam susunan dua dimensi
## Elemen Input Form yang Digunakan
Elemen-elemen input pada proyek ini menggunakan field `TextFormField` agar dapat dilakukan validasi dan integrasi, yaitu:
1) Nama Ramuan (String karena nama ramuan berupa teks)
2) Jumlah (int karena jumlah berupa digit angka)
3) Harga (int karena harga berupa digit angka)
4) Deskripsi (String karena deskripsi berupa teks)
## Penerapan *Clean Architecture* pada Flutter
*Clean Architecture* adalah pola desain perangkat lunak yang membantu para developer menulis kode yang dapat dipelihara dan dapat di-scale. Dengan memisahkan lapisan business logic, presenter/UI, state management, eksternal datasources, dan repository, menjadi lebih mudah untuk memodifikasi dan memperluas kode tanpa menambahkan kompleksitas yang tidak perlu. Seperti proyek ini memisahkan menu.dart dan shoplist-form.dart yang merupakan presenter/UI halaman dengan left_drawer.dart dan shop_card.dart yang merupakan business logic.
## Langkah Implementasi Checklist
1. Membuat shoplist_form.dart untuk halaman formulir tambah ramuan yang memiliki 4 elemen input: `name`, `amount`, `price`, dan `description`, tombol save, validasi tiap elemen, dan pop up data item setelah save form
2. Memindahkan class ShopItem dan ShopCard dari menu.dart ke file baru shop_card.dart
3. Pada shop_card.dart, mengatur Navigator.push() atau routing dari card `Tambah Ramuan` di halaman utama ke halaman formulir
4. Membuat left_drawer.dart untuk drawer yang memiliki opsi `Halaman Utama` yang akan routing ke halaman utama jika ditekan dan `Tambah Ramuan` yang akan routing ke halaman formulir jika ditekan
5. Membuat shop_card.dart untuk widget card yang menampilkan produk ramuan
6. Membuat items.dart untuk halaman daftar ramuan yang akan menampilkan card dari shop_card.dart
7. Menambahkan `ListTile` Lihat Ramuan di left_drawer.dart yang route ke halaman daftar ramuan
8. Menambahkan routing dari card Lihat Ramuan di halaman utama ke halaman daftar ramuan pada shop_card.dart
9. Membuat direktori baru `screens` dan `widgets` di direktori `lib`
10. Memindahkan items.dart, menu.dart, dan shoplist_form.dart ke direktori `screens`
11. Memindahkan items_card.dart, left_drawer.dart, dan shop_card.dart ke direktori `widgets`
12. Add, commit "menyelesaikan tugas 8", dan push ke Github
#### Referensi:
- https://ngasturi.id/2020/01/04/flutter-navigasi-antar-halaman/
- https://medium.com/komandro-ccit-ftui/tutorial-flutter-layout-be8cfb66904a

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
