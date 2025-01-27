import 'package:flutter/material.dart';

// ========================================================
// Halaman EpiduralPage menampilkan informasi tentang Epidural Hemorrhage
// ========================================================
class EpiduralPage extends StatelessWidget {
  const EpiduralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ========================================================
      // AppBar untuk menampilkan judul halaman dan ikon kembali
      // ========================================================
      appBar: AppBar(
        // ========================================================
        // Menampilkan judul halaman dan ikon kembali di bagian atas aplikasi
        // ========================================================
        title: const Text(
          'Epidural Hemorrhage', 
          style: TextStyle(color: Colors.white60), // Menentukan warna teks judul
        ),
        
        // ========================================================
        // Mengatur warna latar belakang AppBar
        // Warna latar belakang menggunakan kode hex #1B1E25 untuk tampilan yang gelap
        // ========================================================
        backgroundColor: const Color(0xFF1B1E25), 

        // ========================================================
        // Mengatur warna ikon yang ada di AppBar (seperti ikon kembali)
        // Warna ikon disesuaikan dengan tema warna putih untuk kontras
        // ========================================================
        iconTheme: const IconThemeData(color: Colors.white),

        // ========================================================
        // Ikon tombol kembali (leading) dengan tooltip
        // Tooltip memberikan informasi kepada pengguna ketika mereka menahan tombol
        // ========================================================
        leading: Tooltip(
          message: 'Back to Home',  // Pesan yang muncul saat ikon kembali di-hover
          child: IconButton(
            icon: const Icon(Icons.arrow_back),  // Ikon tombol kembali
            onPressed: () {
              // ========================================================
              // Fungsi onPressed digunakan untuk mengembalikan pengguna ke halaman sebelumnya
              // Navigator.pop(context) akan menutup halaman saat ini dan kembali ke halaman sebelumnya
              // ========================================================
              Navigator.pop(context); 
            },
          ),
        ),
      ),

      // ========================================================
      // Bagian utama Body untuk konten halaman
      // ========================================================
      body: Container(
        width: double.infinity, // Mengatur lebar kontainer
        height: double.infinity, // Mengatur tinggi kontainer

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1E25), Colors.white],  // Warna gradasi
            begin: Alignment.topCenter,  // Gradasi dimulai dari bagian atas layar
            end: Alignment.bottomCenter,  // Gradasi berakhir di bagian bawah layar
          ),
        ),

        // ========================================================
        // SingleChildScrollView digunakan agar konten halaman bisa digulir jika melebihi batas layar
        // Padding ditambahkan untuk memberikan ruang di sekitar konten halaman
        // ========================================================
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),  // Memberikan padding 16 piksel di sekitar konten
          child: Column(
            children: [
              // ========================================================
              // Row digunakan untuk membagi layar secara horizontal
              // Menyusun konten dalam dua bagian (konten teks di sebelah kiri dan gambar di sebelah kanan)
              // ========================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Menyusun elemen di tengah layar
                children: [
                  Expanded(
                    flex: 1,  // Memberikan bagian yang fleksibel untuk teks
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),  // Memberikan padding di sekitar teks
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,  // Penataan teks di sebelah kiri
                        children: [
                          // ========================================================
                          // Container untuk informasi tentang Epidural Hemorrhage
                          // Memberikan padding dan latar belakang yang gelap untuk informasi ini
                          // ========================================================
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(204, 36, 39, 48), // Latar belakang berwarna gelap
                              borderRadius: BorderRadius.circular(16), // Sudut kontainer melengkung
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // Penataan teks di kiri
                              children: [
                                // ========================================================
                                // Teks Judul: Menyediakan informasi tentang Epidural Hemorrhage
                                // ========================================================
                                Text(
                                  'What is Epidural Hemorrhage?',
                                  style: TextStyle(
                                    color: Colors.white60,  // Warna teks putih
                                    fontSize: 24,  // Ukuran font besar
                                    fontWeight: FontWeight.bold,  // Font tebal
                                  ),
                                ),
                                SizedBox(height: 16),
                                // ========================================================
                                // Teks Penjelasan: Memberikan deskripsi singkat tentang Epidural Hemorrhage
                                // ========================================================
                                Text(
                                  'Epidural Hemorrhage (EDH) is a type of bleeding that occurs between the dura mater (the outer protective layer of the brain) and the skull. It is typically caused by trauma, especially head injuries that lead to the rupture of arteries, often the middle meningeal artery. Epidural hemorrhages are considered a medical emergency because they can cause rapid deterioration in a patient’s condition if not treated promptly.',
                                  style: TextStyle(
                                    color: Colors.white30,  // Warna teks putih pudar
                                    fontSize: 16,  // Ukuran font yang sedikit lebih kecil
                                  ),
                                ),
                                SizedBox(height: 16),
                                // ========================================================
                                // Lokasi Epidural Hemorrhage
                                // Menjelaskan tempat terjadinya perdarahan di otak
                                // ========================================================
                                Text(
                                  'Location:',
                                  style: TextStyle(
                                    color: Colors.white60,  // Warna teks putih
                                    fontSize: 20,  // Ukuran font sedang
                                    fontWeight: FontWeight.bold,  // Font tebal
                                  ),
                                ),
                                Text(
                                  'Bleeding occurs between the dura mater (the outermost layer of the meninges) and the inner surface of the skull. This type of hemorrhage typically occurs after trauma and can cause significant pressure on the brain.',
                                  style: TextStyle(
                                    color: Colors.white30,  // Warna teks putih pudar
                                    fontSize: 18,  // Ukuran font lebih besar untuk penjelasan lebih rinci
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
                                  '- Traumatic brain injury: Commonly from head trauma such as falls, motor vehicle accidents, or assaults.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                Text(
                                  '- Middle meningeal artery rupture: The most common source of bleeding, often resulting from a direct blow to the side of the head.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 10),
                                // ========================================================
                                // Karakteristik Epidural Hemorrhage
                                // Penjelasan Karakteristik epidural hemorrage
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
                                  '- Blood accumulates in a localized area and can compress the brain.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                Text(
                                  '- The hemorrhage typically appears as a biconvex (lens-shaped) collection on imaging, confined to a specific area.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                Text(
                                  '- Rapid accumulation of blood may cause a shift in brain structures, leading to brain herniation if untreated.',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                SizedBox(height: 10),
                                // ========================================================
                                // Gejala Epidural Hemorrhage
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
                                  '- Loss of consciousness after injury.\n- Headache, nausea, vomiting, and dizziness.\n- Progressive neurological decline, such as weakness or paralysis on one side of the body.',
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
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: EpiduralImageSlider(),  // Menampilkan slider gambar terkait Epidural Hemorrhage
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
// EpiduralImageSlider digunakan untuk menampilkan gambar terkait Epidural Hemorrhage
// ========================================================
class EpiduralImageSlider extends StatefulWidget {
  const EpiduralImageSlider({super.key});

  @override
  EpiduralImageSliderState createState() => EpiduralImageSliderState();
}

class EpiduralImageSliderState extends State<EpiduralImageSlider> {
  final PageController _pageController = PageController(); // ========================================================
  // Controller untuk navigasi gambar di slider
  // ========================================================
  int _currentIndex = 0; // Menyimpan indeks gambar yang sedang ditampilkan
  List<String> imagePaths = [
    'assets/Epidural1.jpg',
    'assets/Epidural2.jpg',
    'assets/Epidural3.jpg',
    'assets/Epidural4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ========================================================
        // Bagian atas dengan judul slider gambar
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
              'Example of Epidural Hemorrhage',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // ========================================================
        // Bagian slider gambar
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
                height: 600, // Tinggi untuk slider gambar
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imagePaths.length, // Jumlah gambar dalam slider
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index; // Perbarui indeks gambar yang sedang ditampilkan
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0), // Tanpa sudut melengkung pada gambar
                      child: Image.asset(
                        imagePaths[index], // Gambar yang ditampilkan
                        width: double.infinity,
                        height: 600,
                        fit: BoxFit.contain, // Agar gambar sesuai dengan batas
                      ),
                    );
                  },
                ),
              ),
              // ========================================================
              // Indikator halaman untuk menunjukkan gambar mana yang sedang ditampilkan
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
              // Tombol untuk navigasi gambar sebelumnya
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
              // Tombol untuk navigasi gambar selanjutnya
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
  // MENGHAPUS PAGE CONTROLLER SAAT WIDGET DIBERSIHKAN
  // dispose() digunakan untuk mengelola sumber daya dan menghindari kebocoran memori.
  // ========================================================
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
