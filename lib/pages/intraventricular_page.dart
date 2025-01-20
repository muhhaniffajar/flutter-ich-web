// ========================================================
// IMPORT LIBRARIES
// Mengimpor berbagai library yang dibutuhkan untuk melakukan pembangunan antarmuka pengguna pada aplikasi Flutter. 
// Material.dart menyediakan komponen-komponen UI dasar yang digunakan dalam pengembangan aplikasi Flutter, seperti AppBar, Scaffold, dan lain-lain.
// ========================================================
import 'package:flutter/material.dart';

// ========================================================
// INTRAVENTRICULAR PAGE
// Halaman untuk menampilkan informasi mengenai Intraventricular Hemorrhage (IVH).
// Merupakan widget stateless yang akan membangun struktur antarmuka pengguna untuk menampilkan informasi medis mengenai IVH.
// ========================================================
class IntraventricularPage extends StatelessWidget {
  const IntraventricularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ========================================================
    // Scaffold - Struktur dasar halaman
    // Digunakan untuk mengatur layout aplikasi, termasuk appBar dan body.
    // ========================================================
    return Scaffold(
      // ========================================================
      // AppBar - Menampilkan judul dan tombol kembali
      // ========================================================
      appBar: AppBar(
        title: const Text('Intraventricular Hemorrhage', style: TextStyle(color: Colors.white60)),
        backgroundColor: const Color(0xFF1B1E25), // Warna latar belakang AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Warna ikon di AppBar
        leading: Tooltip(
          message: 'Back to Home',  // Menampilkan tooltip saat ikon ditekan atau lama ditekan
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);  // Kembali ke halaman sebelumnya
            },
          ),
        ),
      ),
      // ========================================================
      // Body - Menggunakan Container untuk pengaturan latar belakang dan konten
      // ========================================================
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1E25), Colors.white], // Gradasi warna dari atas ke bawah
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
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
            mainAxisAlignment: MainAxisAlignment.center,  // Menyusun kolom di tengah
            children: [
              Expanded(
                flex: 1,  // Membagi ruang secara proporsional
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Penyusunan teks secara vertikal
                    children: [
                      // ========================================================
                      // Deskripsi Intraventricular Hemorrhage
                      // Container utama untuk menampilkan deskripsi mengenai Intraparenchymal Hemorrhage.
                      // ========================================================
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(204, 36, 39, 48),  // Latar belakang dengan opacity
                          borderRadius: BorderRadius.circular(16),  // Membulatkan sudut
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,  // Menyusun teks ke kiri
                          children: [
                            // ========================================================
                            // Teks Penjelasan: Memberikan deskripsi singkat tentang Intraventricular Hemorrhage
                            // ========================================================
                            Text(
                              'What is Intraventricular Hemorrhage?',  // Judul
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Intraventricular hemorrhage occurs when bleeding takes place within the brain’s ventricles, the fluid-filled spaces that cushion the brain. This condition can arise due to trauma, premature birth (in neonates), or rupture of blood vessels. The symptoms can vary depending on the amount and location of the bleeding, but they may include vomiting, seizures, and decreased consciousness. Early diagnosis and management are crucial, as untreated intraventricular hemorrhage can lead to long-term complications such as hydrocephalus.',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 16),
                            // ========================================================
                            // Lokasi Intraventricular Hemorrhage
                            // Menjelaskan tempat terjadinya perdarahan di otak
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
                              'Bleeding occurs within the ventricles of the brain, where cerebrospinal fluid (CSF) is produced and circulates.',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,  // Menyusun teks rata kiri-kanan
                            ),
                            SizedBox(height: 10),
                            // ========================================================
                            // Penyebab Epidural Hemorrhage
                            // Memberikan informasi tentang penyebab umum
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
                              '- Often secondary to severe intracerebral hemorrhage extending into ventricles.\n- Prematurity in newborns due to immature brain vasculature.',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 10),
                            // ========================================================
                            // Karakteristik Intraventricular Hemorrhage
                            // Penjelasan tentang karakteristik kondisi ini
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
                              '- Blood mixes with CSF, increasing the risk of hydrocephalus.\n- Visible as hyperdensity filling the ventricles on imaging.',
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 10),
                            // ========================================================
                            // Gejala Intraventricular Hemorrhage
                            // Penjelasan tentang Gejala kondisi ini
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
                              '- Headache, nausea, vomiting, altered consciousness, and signs of hydrocephalus.\n- In newborns, symptoms may include apnea, lethargy, and bulging fontanelles.',
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
              // Gambar-gambar terkait IVH akan ditampilkan di sebelah kanan
              // ========================================================
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IntraventricularImageSlider(),
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
// INTRAVENTRICULAR IMAGE SLIDER
// Widget untuk menampilkan gambar-gambar yang dapat digeser (Image Slider)
// ========================================================
class IntraventricularImageSlider extends StatefulWidget {
  const IntraventricularImageSlider({super.key});

  @override
  IntraventricularImageSliderState createState() => IntraventricularImageSliderState();
}

// ========================================================
// STATE FOR IMAGE SLIDER
// Menangani logika perubahan gambar dan kontrol slider.
// ========================================================
class IntraventricularImageSliderState extends State<IntraventricularImageSlider> {
  final PageController _pageController = PageController();  // Kontrol halaman untuk slider
  int _currentIndex = 0;  // Indeks gambar yang ditampilkan
  List<String> imagePaths = [
    'assets/Intraventricular1.jpg',
    'assets/Intraventricular2.jpg',
    'assets/Intraventricular3.jpg',
    'assets/Intraventricular4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ========================================================
        // Judul bagian slider
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
              "Example of Intraventricular Hemorrhage",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // ========================================================
        // Container untuk gambar slider
        // ========================================================
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(204, 36, 39, 48),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 600,  // Tinggi slider gambar
                child: PageView.builder(
                  controller: _pageController,  // Mengontrol halaman slider
                  itemCount: imagePaths.length,  // Banyaknya gambar dalam slider
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;  // Memperbarui indeks gambar yang aktif
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        imagePaths[index],  // Menampilkan gambar berdasarkan indeks
                        width: double.infinity,
                        height: 600,
                        fit: BoxFit.contain,  // Mengatur tampilan gambar
                      ),
                    );
                  },
                ),
              ),
              // ========================================================
              // Indikator untuk menunjukkan gambar yang sedang aktif
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
              // Tombol untuk mengganti gambar ke kiri
              // ========================================================
              Positioned(
                left: 0,
                child: Tooltip(
                  message: 'Previous Image',  // Tooltip untuk tombol sebelumnya
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white60),
                    onPressed: () {
                      if (_pageController.page != 0) {  // Cek apakah bukan gambar pertama
                        _pageController.previousPage(  // Pindah ke halaman sebelumnya
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,  // Transisi animasi
                        );
                      }
                    },
                  ),
                ),
              ),
              // ========================================================
              // Tombol untuk mengganti gambar ke kanan
              // ========================================================
              Positioned(
                right: 0,
                child: Tooltip(
                  message: 'Next Image',  // Tooltip untuk tombol selanjutnya
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60),
                    onPressed: () {
                      if (_pageController.page != imagePaths.length - 1) {  // Cek apakah bukan gambar terakhir
                        _pageController.nextPage(  // Pindah ke halaman selanjutnya
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,  // Transisi animasi
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
    _pageController.dispose();  // Membersihkan controller halaman saat widget dibuang
    super.dispose();
  }
}
