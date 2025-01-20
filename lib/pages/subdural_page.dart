// ========================================================
// IMPORT LIBRARIES
// Mengimpor berbagai library yang dibutuhkan untuk melakukan pembangunan antarmuka pengguna pada aplikasi Flutter. 
// Material.dart menyediakan komponen-komponen UI dasar yang digunakan dalam pengembangan aplikasi Flutter, seperti AppBar, Scaffold, dan lain-lain.
// ========================================================
import 'package:flutter/material.dart';

// ========================================================
// SubduralPage Widget
// Halaman ini menampilkan informasi terkait Subdural Hemorrhage
// dengan elemen-elemen teks dan gambar-gambar yang dapat dipindah-pindah
// ========================================================
class SubduralPage extends StatelessWidget {
  const SubduralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ========================================================
      // AppBar
      // Membuat AppBar dengan judul halaman, tombol kembali, 
      // dan tema warna latar belakang yang disesuaikan.
      // ========================================================
      appBar: AppBar(
        title: const Text('Subdural Hemorrhage', style: TextStyle(color: Colors.white60)),
        backgroundColor: const Color(0xFF1B1E25),  // Warna latar belakang AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Warna ikon di AppBar
        leading: Tooltip(
          message: 'Back to Home',  // Tooltip untuk menunjukkan pesan ketika tombol ditekan
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);  // Kembali ke halaman sebelumnya
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // ========================================================
        // Latar belakang dengan gradasi warna
        // Menambahkan latar belakang dengan efek gradien vertikal 
        // dari warna gelap ke putih.
        // ========================================================
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1E25), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // ========================================================
        // SingleChildScrollView
        // Menggunakan SingleChildScrollView untuk memungkinkan
        // konten halaman digulir jika konten melebihi layar.
        // ========================================================
        child: SingleChildScrollView( 
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ========================================================
                // Row untuk Informasi Subdural Hemorrhage
                // Menampilkan informasi terkait Subdural Hemorrhage di sisi kiri
                // dan slider gambar di sisi kanan.
                // ========================================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ========================================================
                            // Container untuk Teks Informasi
                            // Menampilkan teks yang menjelaskan tentang Subdural Hemorrhage.
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
                                  Text(
                                    'What is Subdural Hemorrhage?',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Subdural hemorrhage (SDH) refers to a collection of blood between the dura mater (the outer protective layer of the brain) and the arachnoid layer. It is commonly caused by trauma to the head, leading to the rupture of blood vessels. Symptoms of subdural hemorrhage can include headaches, confusion, dizziness, and in severe cases, loss of consciousness. SDH can be classified into acute, subacute, and chronic, based on the duration between the injury and the appearance of symptoms. Prompt medical intervention is crucial for the treatment and management of subdural hemorrhages.',
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  // ========================================================
                                  // Bagian Location
                                  // Menampilkan informasi lokasi Subdural Hemorrhage
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
                                    'Bleeding occurs between the dura mater (the outermost meningeal layer) and the arachnoid mater.',
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: 10),
                                  // ========================================================
                                  // Bagian Causes
                                  // Menampilkan informasi penyebab Subdural Hemorrhage
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
                                    '- Traumatic brain injury (e.g., falls, motor vehicle accidents) leading to tearing of bridging veins.\n- In older adults or alcoholics, minor trauma can cause SDH due to brain atrophy, which stretches the veins.',
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: 10),
                                  // ========================================================
                                  // Bagian Characteristics
                                  // Menampilkan karakteristik Subdural Hemorrhage
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
                                    '- Blood spreads along the brain surface and follows the contours of the brain (crescent-shaped on imaging).\n- It can be acute (sudden), subacute, or chronic (developing over weeks to months).',
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: 10),
                                  // ========================================================
                                  // Bagian Symptoms
                                  // Menampilkan gejala-gejala yang dapat terjadi akibat Subdural Hemorrhage
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
                                    '- Acute SDH: Rapid onset of headache, altered consciousness, and focal neurological deficits.\n- Chronic SDH: Gradual headache, confusion, memory problems, or weakness.',
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
                    // SubduralImageSlider Widget
                    // Menampilkan slider gambar di sebelah kanan informasi.
                    // ========================================================
                    const Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SubduralImageSlider(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ========================================================
// SubduralImageSlider Widget
// Widget ini menampilkan gambar-gambar terkait Subdural Hemorrhage
// dengan slider yang memungkinkan pengguna melihat gambar yang berbeda.
// ========================================================
class SubduralImageSlider extends StatefulWidget {
  const SubduralImageSlider({super.key});

  @override
  SubduralImageSliderState createState() => SubduralImageSliderState();
}

class SubduralImageSliderState extends State<SubduralImageSlider> {
  final PageController _pageController = PageController();  // Kontrol untuk menggeser halaman gambar
  int _currentIndex = 0;  // Indeks gambar yang sedang ditampilkan
  List<String> imagePaths = [
    'assets/subdural1.jpg',  // Path gambar pertama
    'assets/subdural2.jpg',  // Path gambar kedua
    'assets/subdural3.jpg',  // Path gambar ketiga
    'assets/subdural4.jpg',  // Path gambar keempat
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ========================================================
        // Title for Image Slider
        // Menambahkan judul untuk slider gambar yang menjelaskan
        // tentang gambar yang sedang ditampilkan.
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
              "Example of Subdural Hemorrhage",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // ========================================================
        // Image Slider Container
        // Menyusun tampilan slider gambar dengan kontrol navigasi
        // untuk berpindah antar gambar.
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
              // PageView.builder untuk Gambar
              // Menampilkan gambar-gambar menggunakan PageView dengan
              // kemampuan scroll antar gambar.
              // ========================================================
              SizedBox(
                height: 600,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imagePaths.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        imagePaths[index],
                        width: double.infinity,
                        height: 600,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
              // ========================================================
              // Page Indicator
              // Indikator halaman untuk menunjukkan gambar mana yang
              // sedang ditampilkan.
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
              // Navigation Buttons
              // Tombol untuk berpindah ke gambar sebelumnya atau berikutnya.
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
// @override
// void dispose() {
//   _pageController.dispose();  // Melepaskan controller halaman ketika widget dihapus
//   super.dispose();  // Memanggil dispose pada superclass untuk memastikan semua resource dibersihkan dengan baik
// }

}
