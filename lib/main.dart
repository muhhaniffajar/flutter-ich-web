// ========================================================
// IMPORT PACKAGE DAN HALAMAN-HALAMAN
// Mengimpor package Flutter dan halaman-halaman untuk navigasi antar layar
// ========================================================

// Mengimpor package yang diperlukan untuk aplikasi
// 'package:flutter/material.dart' untuk menggunakan widget standar dari Flutter seperti Scaffold, AppBar, Icon, dan sebagainya
import 'package:flutter/material.dart';

// Mengimpor halaman-halaman untuk navigasi antar layar
import 'pages/classification_page.dart';
import 'pages/subdural_page.dart';
import 'pages/epidural_page.dart';
import 'pages/intraparenchymal_page.dart';
import 'pages/intraventricular_page.dart';
import 'pages/subarachnoid_page.dart';


// ========================================================
// FUNGSI MAIN APLIKASI
// Menjalankan aplikasi dengan widget MyApp sebagai root
// ========================================================

// Fungsi utama yang menjalankan aplikasi
void main() {
  runApp(const MyApp()); // Menjalankan aplikasi dengan widget MyApp sebagai root
}


// ========================================================
// WIDGET MYAPP
// Widget utama yang digunakan dalam aplikasi, menampilkan MainPage
// ========================================================

// widget utama yang digunakan dalam aplikasi
// Menggunakan StatelessWidget karena widget ini tidak mengubah state
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Konstruktor dari MyApp

  // Fungsi build untuk membuat tampilan aplikasi
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Menonaktifkan banner debug di aplikasi
      home: MainPage(), // Menentukan MainPage sebagai halaman utama aplikasi
    );
  }
}


// ========================================================
// MAINPAGE
// Halaman utama aplikasi yang menjadi pusat navigasi dan edukasi
// ========================================================

class MainPage extends StatelessWidget {
  const MainPage({super.key}); // Konstruktor untuk MainPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1E25), // Warna latar belakang AppBar
        iconTheme: const IconThemeData(color: Colors.white60), // Warna ikon
        actions: <Widget>[
          _buildClassificationButton(context), // Tombol navigasi ke halaman klasifikasi
        ],
      ),
      body: const EducationPage(), // Konten utama berupa halaman edukasi ICH
    );
  }

  // ========================================================
  // Metode: _buildClassificationButton
  // Fungsi untuk membuat tombol navigasi ke halaman klasifikasi
  // ========================================================

  Widget _buildClassificationButton(BuildContext context) {
    return Tooltip(
      message: "Go to ICH classification", // Pesan tooltip untuk tombol
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0), // Jarak tombol di AppBar
        child: IconButton(
          icon: const Row(
            mainAxisSize: MainAxisSize.min, // Ukuran ikon horizontal
            children: [
              Icon(Icons.control_point_sharp, color: Colors.white60), // Ikon navigasi
              SizedBox(width: 8),
              Text(
                'Classification', // Teks tombol navigasi
                style: TextStyle(
                  color: Colors.white60, // Warna teks
                  fontSize: 16, // Ukuran teks
                  fontWeight: FontWeight.bold, // Ketebalan teks
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClassificationPage()), // Navigasi ke halaman ClassificationPage
            );
          },
        ),
      ),
    );
  }
}

// ========================================================
// EDUCATIONPAGE
// Menampilkan informasi edukatif mengenai ICH dan jenis-jenisnya
// ========================================================

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key); // Konstruktor untuk EducationPage

  @override
  EducationPageState createState() => EducationPageState(); // Membuat state untuk EducationPage
}

// ========================================================
// STATE EDUKASI
// Menangani status dinamis dan kontrol scroll untuk halaman ICH
// ========================================================

class EducationPageState extends State<EducationPage> {
  final ScrollController _scrollController = ScrollController(); // Controller untuk scroll

  // Fungsi untuk menggulir ke kiri
  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 155, // Menggeser posisi scroll sebanyak 155 piksel ke kiri
      duration: const Duration(milliseconds: 500), // Durasi animasi scroll
      curve: Curves.easeInOut, // Efek animasi scroll
    );
  }

  // Fungsi untuk menggulir ke kanan
  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 155, // Menggeser posisi scroll sebanyak 155 piksel ke kanan
      duration: const Duration(milliseconds: 500), // Durasi animasi scroll
      curve: Curves.easeInOut, // Efek animasi scroll
    );
  }
  // ========================================================
  // Desain HALAMAN
  // ========================================================
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Membuat container memenuhi lebar layar
      height: double.infinity, // Membuat container memenuhi tinggi layar
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1B1E25), // Warna latar atas
            Color.fromARGB(255, 255, 255, 255), // Warna latar bawah
          ],
          begin: Alignment.topCenter, // Gradient dimulai dari atas
          end: Alignment.bottomCenter, // Gradient berakhir di bawah
        ),
      ),
      child: Row(
        children: [
          // ========================================================
          // BAGIAN KIRI: Teks edukasi mengenai ICH
          // ========================================================
          Expanded(
            flex: 1, // Membuat bagian kiri mengisi 1 bagian dari total lebar
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0), // Memberikan padding di seluruh sisi
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 50),
                  const Text(
                    'Intracranial Hemorrhage Classification', // Judul utama halaman
                    style: TextStyle(
                      color: Colors.white60, // Warna teks
                      fontSize: 32, // Ukuran font
                      fontWeight: FontWeight.bold, // Ketebalan font
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'What is Intracranial Hemorrhage?', // Subjudul untuk menjelaskan ICH
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Intracranial hemorrhage (ICH) is a general term for bleeding inside the skull. It encompasses all types of brain bleeds, including subdural, intraparenchymal, intraventricular, subarachnoid, and epidural hemorrhages. ICH is commonly caused by trauma, high blood pressure, blood vessel abnormalities, or aneurysms. The symptoms of ICH vary depending on the location and severity of the bleed, and can range from headaches and dizziness to loss of consciousness or death. Prompt medical attention is required to manage ICH, and the treatment approach depends on the cause, type, and severity of the hemorrhage.',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.justify, // Teks rata kanan-kiri
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Types of Intracranial Hemorrhage', // Judul untuk jenis-jenis ICH
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ========================================================
                  // JENIS-JENIS ICH: Scrollable Container untuk daftar jenis ICH
                  // ========================================================
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2, // Tinggi container scroll
                    child: Row(
                      children: [
                        // Tombol untuk scroll ke kiri
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white60),
                          onPressed: _scrollLeft, // Menangani scroll ke kiri
                        ),
                        // Daftar jenis hemorrhage yang dapat digulir secara horizontal
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController, // Menggunakan controller scroll
                            scrollDirection: Axis.horizontal, // Menentukan scroll horizontal
                            itemCount: hemorrhageTypes.length, // Menentukan jumlah item
                            itemBuilder: (context, index) {
                              final hemorrhage = hemorrhageTypes[index]; // Mengambil data hemorrhage
                              return GestureDetector(
                                // Navigasi ke halaman terkait ketika item dipilih
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => hemorrhage['page']),
                                  );
                                },
                                child: Container(
                                  width: 140, // Ukuran setiap item
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.symmetric(horizontal: 8.0), // Margin antar item
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2A2D37), // Background item
                                    borderRadius: BorderRadius.circular(16), // Membuat sudut melengkung
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(50), // Efek bayangan di item
                                        blurRadius: 4,
                                        offset: const Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Gambar untuk setiap jenis hemorrhage
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30), // Membuat sudut gambar melengkung
                                        child: Image.asset(
                                          hemorrhage['image'], // Gambar untuk jenis hemorrhage
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                          
                                          errorBuilder: (context, error, stackTrace) {
                                            return const Icon(Icons.broken_image, color: Colors.red);
                                          }, // Menjaga aspek rasio gambar
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      // Teks untuk nama jenis hemorrhage
                                      Text(
                                        hemorrhage['title'],
                                        textAlign: TextAlign.center, // Menyusun teks di tengah
                                        style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Tombol untuk scroll ke kanan
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60),
                          onPressed: _scrollRight, // Menangani scroll ke kanan
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  // ========================================================
                  // TOMBOL KLASIFIKASI
                  // Menyediakan tombol untuk melanjutkan ke halaman klasifikasi ICH
                  // ========================================================
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B1E25), // Background warna tombol
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Membuat sudut tombol melengkung
                        ),
                        elevation: 5,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ClassificationPage()),
                        );
                      },
                      child: const Text(
                        'Start Classification', // Teks pada tombol
                        style: TextStyle(color: Colors.white, fontSize: 18), // Menetapkan gaya teks
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
          // ========================================================
          // BAGIAN KANAN: Gambar Terkait ICH
          // ========================================================
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/ICH1.JPG', // Gambar terkait ICH
                  height: MediaQuery.of(context).size.height * 0.7, // Ukuran gambar berdasarkan tinggi layar
                  fit: BoxFit.cover, // Menjaga aspek rasio gambar
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/// ========================================================
// LIST JENIS HEMORRHAGE
// Daftar jenis-jenis hemorrhage yang dapat dipilih oleh pengguna
// Setiap jenis hemorrhage memiliki informasi judul, gambar, dan halaman terkait yang akan ditampilkan saat dipilih
// ========================================================

final List<Map<String, dynamic>> hemorrhageTypes = [
  {
    'title': 'Subdural Hemorrhage', // Nama jenis hemorrhage
    'image': 'assets/ID_9adc40048_Subdural.jpg', // Gambar terkait subdural hemorrhage
    'page': const SubduralPage(), // Halaman terkait yang akan ditampilkan saat dipilih
  },
  {
    'title': 'Epidural Hemorrhage', // Nama jenis hemorrhage
    'image': 'assets/ID_f26667baf_Epidural.jpg', // Gambar terkait epidural hemorrhage
    'page': const EpiduralPage(), // Halaman terkait yang akan ditampilkan saat dipilih
  },
  {
    'title': 'Intraparenchymal Hemorrhage', // Nama jenis hemorrhage
    'image': 'assets/ID_cbe5d2ed7_Intraparenchymal.jpg', // Gambar terkait intraparenchymal hemorrhage
    'page': const IntraparenchymalPage(), // Halaman terkait yang akan ditampilkan saat dipilih
  },
  {
    'title': 'Intraventricular Hemorrhage', // Nama jenis hemorrhage
    'image': 'assets/ID_a8936e0de_Intraventricular.jpg', // Gambar terkait intraventricular hemorrhage
    'page': const IntraventricularPage(), // Halaman terkait yang akan ditampilkan saat dipilih
  },
  {
    'title': 'Subarachnoid Hemorrhage', // Nama jenis hemorrhage
    'image': 'assets/ID_d5ab7d884_Subarachnoid.jpg', // Gambar terkait subarachnoid hemorrhage
    'page': const SubarachnoidPage(), // Halaman terkait yang akan ditampilkan saat dipilih
  },
];
