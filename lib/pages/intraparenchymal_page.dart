// ========================================================
// IMPORT LIBRARIES
// Mengimpor berbagai library yang dibutuhkan untuk melakukan pembangunan antarmuka pengguna pada aplikasi Flutter. 
// Material.dart menyediakan komponen-komponen UI dasar yang digunakan dalam pengembangan aplikasi Flutter, seperti AppBar, Scaffold, dan lain-lain.
// ========================================================
import 'package:flutter/material.dart';

// ========================================================
// IntraparenchymalPage Widget
// Halaman ini menunjukkan informasi mengenai Intraparenchymal Hemorrhage menggunakan widget Stateless, 
// karena tidak memerlukan perubahan state selama masa hidupnya.
// ========================================================
class IntraparenchymalPage extends StatelessWidget {
  const IntraparenchymalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ========================================================
      // AppBar Configuration
      // AppBar berfungsi untuk menampilkan bar di atas layar, menampilkan judul dan tombol navigasi kembali.
      // ========================================================
      appBar: AppBar(
        title: const Text('Intraparenchymal Hemorrhage', style: TextStyle(color: Colors.white60)),
        backgroundColor: const Color(0xFF1B1E25),  // Warna background AppBar
        iconTheme: const IconThemeData(color: Colors.white),  // Ikon warna putih
        leading: Tooltip(
                          message: 'Back to Home',  // Pesan yang muncul saat hover atau tekan lama pada tombol
                          child: IconButton(
                          icon: const Icon(Icons.arrow_back),  // Ikon kembali
                          onPressed: () {
                                          Navigator.pop(context);  // Navigasi untuk kembali ke halaman sebelumnya
                            },
                          ),
          ),
      ),
      // ========================================================
      // Bagian utama Body untuk konten halaman
      // ========================================================
      body: Container(
        width: double.infinity,  // Lebar container mengisi seluruh lebar layar
        height: double.infinity,  // Tinggi container mengisi seluruh tinggi layar
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1B1E25),  // Warna gradasi untuk background
              Colors.white
            ],
            begin: Alignment.topCenter,  // Mulai dari bagian atas layar
            end: Alignment.bottomCenter,  // Berakhir di bagian bawah layar
          ),
        ),

        // ========================================================
        // SingleChildScrollView digunakan agar konten halaman bisa digulir jika melebihi batas layar
        // Padding ditambahkan untuk memberikan ruang di sekitar konten halaman
        // ========================================================
        child: SingleChildScrollView( // SingleChildScrollView untuk memungkinkan pengguna menggulirkan layar
          padding: const EdgeInsets.all(16.0),  // Padding untuk konten di dalam SingleChildScrollView
          // ========================================================
          // Row digunakan untuk membagi layar secara horizontal
          // Menyusun konten dalam dua bagian (konten teks di sebelah kiri dan gambar di sebelah kanan)
          // ========================================================
          child: Row(
            children: [
              Expanded(
                flex: 1,  // Menyediakan ruang proporsional bagi kolom pertama
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Membuat teks sejajar ke kiri
                    children: [
                      // ========================================================
                      // Deskripsi Intraparenchymal Hemorrhage
                      // Container utama untuk menampilkan deskripsi mengenai Intraparenchymal Hemorrhage.
                      // ========================================================
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(204, 36, 39, 48),  // Background container
                          borderRadius: BorderRadius.circular(16),  // Sudut tumpul pada container
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ========================================================
                            // Teks Penjelasan: Memberikan deskripsi singkat tentang Intraparenchymal Hemorrhage
                            // ========================================================
                            Text(
                              'What is Intraparenchymal Hemorrhage?',  // Judul
                              style: TextStyle(
                                color: Colors.white60,  // Warna teks judul
                                fontSize: 24,  // Ukuran font judul
                                fontWeight: FontWeight.bold,  // Gaya font tebal
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Intraparenchymal hemorrhage refers to bleeding that occurs within the brain tissue itself (the parenchyma). This type of hemorrhage is typically caused by high blood pressure, trauma, or vascular malformations. Symptoms can include sudden onset of headache, weakness, confusion, or loss of consciousness, depending on the location of the hemorrhage. Intraparenchymal hemorrhage is often diagnosed through imaging, such as a CT scan or MRI. Treatment may involve managing the underlying condition and reducing intracranial pressure.',
                              style: TextStyle(
                                color: Colors.white30,  // Warna teks penjelasan
                                fontSize: 16,  // Ukuran font penjelasan
                              ),
                            ),
                            SizedBox(height: 16),
                            // ========================================================
                            // Lokasi Intraparenchymal Hemorrhage
                            // Menjelaskan tempat terjadinya perdarahan di otak
                            // ========================================================
                            Text(
                              'Location:',  // Subjudul
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Bleeding occurs directly within the brain parenchyma, leading to localized damage and increased intracranial pressure.',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,  // Justifikasi teks untuk perataan rata kiri dan kanan
                            ),
                            SizedBox(height: 10),
                            // ========================================================
                            // Penyebab Intraparenchymal Hemorrhage
                            // Memberikan informasi tentang penyebab umum
                            // ========================================================
                            Text(
                              'Causes:',  // Subjudul
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '- Chronic hypertension causing rupture of small penetrating arteries.\n- Trauma, vascular malformations, brain tumors, or anticoagulant medication use. \n- Secondary causes include amyloid angiopathy, infections, or clotting disorders.',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 10),
                            // ========================================================
                            // Karakteristik Intraparenchymal Hemorrhage
                            // Penjelasan tentang karakteristik kondisi ini
                            // ========================================================
                            Text(
                              'Characteristics:',  // Subjudul
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '- Commonly affects deep brain structures like the basal ganglia, thalamus, cerebellum, and brainstem.\n- Hemorrhage may cause mass effect and edema, leading to compression of surrounding tissues.',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 10),
                            // ========================================================
                            // Gejala Intraparenchymal Hemorrhage
                            // Penjelasan tentang Gejala kondisi ini
                            // ========================================================
                            Text(
                              'Symptoms:',  // Subjudul
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '- Sudden onset of neurological deficits, such as hemiparesis, aphasia, or vision changes.\n- Severe headache, nausea, vomiting, and progressive decline in consciousness.\n- Larger bleeds may result in life-threatening increases in intracranial pressure.',
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
              const Expanded(
                flex: 1,  // Kolom kedua untuk menampilkan slider gambar
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IntraparenchymalImageSlider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================================
// IntraparenchymalImageSlider Widget
// Widget ini bertanggung jawab untuk menampilkan gambar-gambar terkait Intraparenchymal Hemorrhage
// Menggunakan PageView untuk navigasi gambar dengan efek transisi
// ========================================================
class IntraparenchymalImageSlider extends StatefulWidget {
  const IntraparenchymalImageSlider({super.key});

  @override
  IntraparenchymalImageSliderState createState() => IntraparenchymalImageSliderState();
}

class IntraparenchymalImageSliderState extends State<IntraparenchymalImageSlider> {
  final PageController _pageController = PageController();  // Kontrol untuk pager slider gambar
  int _currentIndex = 0;  // Index gambar saat ini
  List<String> imagePaths = [ // list gambar yang akan ditampilkan
    'assets/Intraparenchymal1.jpg',
    'assets/Intraparenchymal2.jpg',
    'assets/Intraparenchymal3.jpg',
    'assets/Intraparenchymal4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column( // Kolom untuk menampilkan pager slider gambar
      children: [
        // ========================================================
        // Title for Image Slider
        // Container untuk judul gambar slider yang memberi informasi tentang gambar yang ditampilkan
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
              'Example of Intraparenchymal Hemorrhage',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // ========================================================
        // Image Slider Configuration
        // PageView.builder digunakan untuk menampilkan gambar-gambar dengan navigasi berbasis swipe
        // ========================================================
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(204, 36, 39, 48),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // PageView.builder untuk membuat slider gambar
              SizedBox(
                height: 600,  // Tinggi gambar slider
                child: PageView.builder( // PageView untuk membuat slider gambar
                  controller: _pageController,  // Kontroler untuk paginasi
                  itemCount: imagePaths.length,  // Jumlah gambar yang tersedia
                  onPageChanged: (index) { // Event ketika gambar berubah
                    setState(() {
                      _currentIndex = index;  // Mengupdate index gambar yang sedang ditampilkan
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        imagePaths[index],  // Menampilkan gambar sesuai index
                        width: double.infinity,  // Gambar mengisi seluruh lebar layar
                        height: 600,  // Tinggi gambar slider
                        fit: BoxFit.contain,  // Gambar disesuaikan dengan ukuran container
                      ),
                    );
                  },
                ),
              ),
              // ========================================================
              // Image Slider Navigation Indicators
              // Indikator posisi gambar slider yang menampilkan titik-titik untuk menunjukkan gambar saat ini
              // ========================================================
              Positioned(
                bottom: 10,
                child: Row( // Baris untuk menampilkan indikator posisi gambar slider
                  mainAxisAlignment: MainAxisAlignment.center, // Menyebarkan indikator secara horizontal
                  children: List.generate(imagePaths.length, (index) { // Membuat indikator sesuai jumlah gambar
                    return Container( // Container untuk menampilkan indikator
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
              // Navigation Buttons
              // Tombol navigasi untuk berpindah antara gambar-gambar slider (sebelumnya dan selanjutnya)
              // ========================================================
              Positioned(
                left: 0,
                child: Tooltip( // Tooltip untuk menampilkan teks navigasi
                  message: 'Previous Image',
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white60),
                    onPressed: () {
                      if (_pageController.page != 0) { // mengecek kondisi page (halaman pertama atau bukan)
                        _pageController.previousPage( // Mengubah gambar ke gambar sebelumnya
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Tooltip(
                  message: 'Next Image',
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60),
                    onPressed: () {
                      if (_pageController.page != imagePaths.length - 1) { // mengecek kondisi page (halaman terakhir atau bukan)
                        _pageController.nextPage( // Mengubah gambar ke gambar selanjutnya
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut, // Animasi transisi
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
  // MENGHAPUS PAGE CONTROLLER SAAT WIDGET DIBERSIHKAN
  // dispose() digunakan untuk mengelola sumber daya dan menghindari kebocoran memori.
  // ========================================================
  @override
  void dispose() {
    _pageController.dispose();  // Membersihkan kontroler ketika widget dihapus
    super.dispose();
  }
}
