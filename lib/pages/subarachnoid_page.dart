// ========================================================
// IMPORT LIBRARIES
// Mengimpor berbagai library yang dibutuhkan untuk melakukan pembangunan antarmuka pengguna pada aplikasi Flutter. 
// Material.dart menyediakan komponen-komponen UI dasar yang digunakan dalam pengembangan aplikasi Flutter, seperti AppBar, Scaffold, dan lain-lain.
// ========================================================
import 'package:flutter/material.dart';

// ========================================================
// SubarachnoidPage Widget
// Halaman ini menampilkan informasi terkait Subarachnoid Hemorrhage
// dengan elemen-elemen teks dan gambar-gambar yang dapat dipindah-pindah
// ========================================================
class SubarachnoidPage extends StatelessWidget {
  const SubarachnoidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ========================================================
    // Scaffold Widget
    // Menyediakan struktur dasar halaman dengan AppBar dan body.
    // AppBar berfungsi untuk menampilkan judul halaman dan tombol kembali, 
    // sedangkan body menampilkan konten berupa teks dan gambar.
    // ========================================================
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subarachnoid Hemorrhage', style: TextStyle(color: Colors.white60)),
        backgroundColor: const Color(0xFF1B1E25), // Warna latar belakang AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Warna ikon di AppBar
        leading: Tooltip(
          message: 'Back to Home',  // Teks yang muncul saat menekan tombol kembali
          child: IconButton(
            icon: const Icon(Icons.arrow_back), // Ikon untuk kembali ke halaman sebelumnya
            onPressed: () {
              Navigator.pop(context); // Fungsi untuk kembali ke halaman sebelumnya
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity, // Membuat container memenuhi lebar layar
        height: double.infinity, // Membuat container memenuhi tinggi layar
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1E25), Colors.white], // Warna gradasi dari atas ke bawah
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
          child: Column(
            children: [
              // ========================================================
              // Row Widget
              // Menyusun elemen-elemen konten secara horizontal (kolom teks dan gambar)
              // ========================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Menyusun anak secara horizontal
                children: [
                  // ========================================================
                  // Expanded Widget
                  // Kolom pertama untuk menampilkan teks informasi mengenai SAH
                  // ========================================================
                  Expanded(
                    flex: 1, // Mengatur fleksibilitas kolom
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen secara vertikal
                        children: [
                          // ========================================================
                          // Container Widget
                          // Untuk menampilkan teks informasi dalam bentuk box dengan gaya yang lebih menarik
                          // ========================================================
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(204, 36, 39, 48),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ========================================================
                                // Text Widget
                                // Menampilkan judul "What is Subarachnoid Hemorrhage?"
                                // ========================================================
                                Text(
                                  'What is Subarachnoid Hemorrhage?',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),
                                // ========================================================
                                // Text Widget
                                // Menampilkan deskripsi tentang Subarachnoid Hemorrhage
                                // ========================================================
                                Text(
                                  'Subarachnoid hemorrhage (SAH) is the bleeding that occurs between the brain and the thin tissues covering it, known as the arachnoid membrane. The most common cause of SAH is the rupture of an aneurysm. Symptoms include sudden severe headache, nausea, vomiting, loss of consciousness, and in some cases, seizures. A SAH is a medical emergency that often requires surgical intervention to prevent further complications like stroke. Early treatment is essential for improving outcomes.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 16),
                                // ========================================================
                                // Text Widget
                                // Menampilkan penjelasan mengenai lokasi SAH
                                // ========================================================
                                Text(
                                  'Location:',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Bleeding occurs in the subarachnoid space between the arachnoid mater and pia mater, where cerebrospinal fluid (CSF) circulates.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 10),
                                // ========================================================
                                // Text Widget
                                // Menampilkan penjelasan tentang penyebab SAH
                                // ========================================================
                                Text(
                                  'Causes:',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '- Ruptured aneurysms are the most common cause (e.g., berry aneurysms).\n- Trauma, vascular malformations, or spontaneous bleeding due to high blood pressure.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 10),
                                // ========================================================
                                // Text Widget
                                // Menampilkan karakteristik SAH
                                // ========================================================
                                Text(
                                  'Characteristics:',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '- Blood mixes with CSF, spreading throughout the subarachnoid space.\n- Visible on imaging as hyperdensity in basal cisterns and sulci.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 10),
                                // ========================================================
                                // Text Widget
                                // Menampilkan gejala-gejala SAH
                                // ========================================================
                                Text(
                                  'Symptoms:',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '- Sudden, severe headache ("thunderclap headache"), nausea, vomiting, neck stiffness, and altered consciousness.\n- May lead to stroke or long-term complications like hydrocephalus.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ========================================================
                  // Expanded Widget
                  // Kolom kedua untuk menampilkan gambar slider
                  // ========================================================
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SubarachnoidImageSlider(), // Widget untuk menampilkan gambar slider
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================================
// SubarachnoidImageSlider Widget
// Widget ini digunakan untuk menampilkan gambar-gambar tentang Subarachnoid Hemorrhage
// Gambar dapat digeser secara horizontal dengan menggunakan PageView
// ========================================================
class SubarachnoidImageSlider extends StatefulWidget {
  const SubarachnoidImageSlider({super.key});

  @override
  SubarachnoidImageSliderState createState() => SubarachnoidImageSliderState();
}

class SubarachnoidImageSliderState extends State<SubarachnoidImageSlider> {
  final PageController _pageController = PageController(); // Kontrol untuk berpindah antar halaman gambar
  int _currentIndex = 0; // Indeks gambar yang sedang ditampilkan
  List<String> imagePaths = [
    'assets/Subarachnoid1.jpg', // Lokasi gambar pertama
    'assets/Subarachnoid2.jpg', // Lokasi gambar kedua
    'assets/Subarachnoid3.jpg', // Lokasi gambar ketiga
    'assets/Subarachnoid4.jpg', // Lokasi gambar keempat
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ========================================================
        // Container Widget
        // Bagian atas untuk menampilkan judul gambar
        // ========================================================
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(204, 25, 27, 32),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Example of Subarachnoid Hemorrhage",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // ========================================================
        // Container Widget
        // Bagian utama untuk menampilkan gambar dengan PageView
        // ========================================================
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(204, 36, 39, 48),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ========================================================
              // PageView Widget
              // Menampilkan gambar yang bisa di-scroll secara horizontal
              // ========================================================
              SizedBox(
                height: 600,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imagePaths.length, // Menentukan jumlah gambar
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index; // Memperbarui indeks saat gambar berganti
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        imagePaths[index], // Menampilkan gambar berdasarkan indeks
                        width: double.infinity,
                        height: 600,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
              // ========================================================
              // Positioned Widget
              // Indikator titik di bawah gambar untuk menunjukkan halaman yang aktif
              // ========================================================
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(imagePaths.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.white : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
              // ========================================================
              // IconButton Widget
              // Tombol untuk kembali ke gambar sebelumnya
              // ========================================================
              Positioned(
                left: 0,
                child: Tooltip(
                  message: 'Previous Image',
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white60),
                    onPressed: () {
                      if (_pageController.page != 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ),
              // ========================================================
              // IconButton Widget
              // Tombol untuk melanjutkan ke gambar berikutnya
              // ========================================================
              Positioned(
                right: 0,
                child: Tooltip(
                  message: 'Next Image',
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60),
                    onPressed: () {
                      if (_pageController.page != imagePaths.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  // ========================================================
  // Dispose Method
  // Melepaskan resource yang digunakan oleh widget ketika widget dihapus
  // Dalam hal ini, melepaskan controller halaman (_pageController)
  // ========================================================
  @override
  void dispose() {
    _pageController.dispose(); // Melepaskan controller halaman ketika widget dihapus
    super.dispose(); // Memanggil dispose pada superclass untuk memastikan semua resource dibersihkan dengan baik
  }
}
