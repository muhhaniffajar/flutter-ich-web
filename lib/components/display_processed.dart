// ========================================================
// IMPORT LIBRARIES
// Di sini kita mengimpor library yang diperlukan untuk membangun UI dengan Flutter.
// Material.dart memberi kita akses ke berbagai komponen antarmuka seperti AppBar, Scaffold, dan lainnya.
// ========================================================
import 'package:flutter/material.dart';

// ========================================================
// STATEFUL WIDGET UNTUK MENAMPILKAN GAMBAR HASIL PEMROSESAN
// Widget ini digunakan untuk menampilkan gambar yang sudah diproses dan diterima dari backend.
// Karena gambar yang ditampilkan bisa berubah, maka kita menggunakan StatefulWidget.
// ========================================================
class DisplayProcessed extends StatefulWidget {
  final Map<String, dynamic>? responseData; // Menyimpan data yang diterima dari backend

  // Constructor untuk widget ini, di mana kita menerima responseData sebagai parameter
  const DisplayProcessed({super.key, required this.responseData});

  @override
  DisplayProcessedState createState() => DisplayProcessedState();
}

class DisplayProcessedState extends State<DisplayProcessed> {
  // ========================================================
  // PAGE CONTROLLER UNTUK MENGELOLA HALAMAN
  // Menggunakan PageController untuk mengatur navigasi antar halaman dalam carousel.
  // Ini memungkinkan kita untuk menampilkan gambar dengan cara menggulirkan halaman.
  // ========================================================
  final PageController _pageController = PageController();
  int _currentPage = 0; // Menyimpan halaman yang sedang aktif

  @override
  Widget build(BuildContext context) {
    // ========================================================
    // BASE URL UNTUK GAMBAR
    // Ini adalah base URL untuk mengakses gambar yang kita terima dari backend.
    // Di sini kita gabungkan URL dengan path gambar untuk mendapatkan URL penuh.
    // ========================================================
    const String baseUrl = 'https://mortality-campaigns-choir-pix.trycloudflare.com/';

    // ========================================================
    // MENDAPATKAN LEBAR LAYAR UNTUK MENYESUAIKAN UKURAN GAMBAR
    // Kita menggunakan MediaQuery untuk mendapatkan lebar layar perangkat dan menyesuaikan ukuran gambar.
    // ========================================================
    final screenWidth = MediaQuery.of(context).size.width;

    // ========================================================
    // MENDAPATKAN PATH GAMBAR DARI RESPONSE DATA
    // Path gambar diambil dari responseData, yang berisi berbagai jenis gambar yang diproses.
    // Jika gambar tidak ada, maka nilainya akan null.
    // ========================================================
    final String? imagePath = widget.responseData?['processed_image']?['brain_window'];
    final String? imagePath2 = widget.responseData?['processed_image']?['subdural_window'];
    final String? imagePath3 = widget.responseData?['processed_image']?['soft_window'];
    final String? imagePath4 = widget.responseData?['processed_image']?['stacked'];

    // ========================================================
    // MEMPERSIAPKAN LIST GAMBAR UNTUK DITAMPILKAN
    // Kita cek apakah gambar tersedia. Jika ada, kita tambahkan ke dalam daftar gambar.
    // ========================================================
    final List<Widget> images = [];
    if (imagePath != null) {
      final String fullImageUrl = '$baseUrl$imagePath'; // Gabungkan base URL dan path gambar
      images.add(_buildImage('Brain Window', fullImageUrl)); // Menambahkan gambar dengan judul
    }
    if (imagePath2 != null) {
      final String fullImageUrl = '$baseUrl$imagePath2';
      images.add(_buildImage('Subdural Window', fullImageUrl));
    }
    if (imagePath3 != null) {
      final String fullImageUrl = '$baseUrl$imagePath3';
      images.add(_buildImage('Soft Window', fullImageUrl));
    }
    if (imagePath4 != null) {
      final String fullImageUrl = '$baseUrl$imagePath4';
      images.add(_buildImage('Stacked Window', fullImageUrl));
    }

    // ========================================================
    // JIKA TIDAK ADA GAMBAR, TAMPILKAN PESAN "NO IMAGES AVAILABLE"
    // Jika tidak ada gambar yang ditemukan, tampilkan pesan ini kepada pengguna.
    // ========================================================
    if (images.isEmpty) {
      return const Center(child: Text('No images available.'));
    }

    // ========================================================
    // TAMPILAN UTAMA: CAROUSEL GAMBAR
    // Di sini kita menampilkan gambar dalam bentuk carousel dengan tombol navigasi untuk berganti gambar.
    // ========================================================
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10), // Padding untuk membuat ruang vertikal
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 15, 18, 25)), // Border dengan warna tertentu
          borderRadius: BorderRadius.circular(20.0), // Sudut border melengkung
          color: const Color(0xFF1B1E25), // Background color
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ukuran kolom disesuaikan dengan konten
          children: [
            // ========================================================
            // NAVIGASI CAROUSEL DENGAN TOMBOL PANAH KIRI DAN KANAN
            // Tombol kiri dan kanan digunakan untuk menggulir carousel gambar.
            // ========================================================
            Row(
              children: [
                // Tombol panah kiri
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white60),
                  onPressed: _currentPage > 0 // Aktif jika bukan halaman pertama
                      ? () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 400), // Durasi animasi
                            curve: Curves.easeInOut, // Kurva animasi
                          )
                      : null, // Nonaktif jika di halaman pertama
                ),
                // ========================================================
                // PAGEVIEW UNTUK MENAMPILKAN GAMBAR
                // PageView memungkinkan kita untuk menampilkan gambar dalam bentuk carousel.
                // ========================================================
                Expanded(
                  child: SizedBox(
                    height: screenWidth * 0.45 + 40, // Sesuaikan tinggi gambar dengan lebar layar
                    child: PageView.builder(
                      controller: _pageController, // Menggunakan controller untuk mengelola pergerakan
                      itemCount: images.length, // Jumlah gambar
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page; // Update halaman aktif
                        });
                      },
                      itemBuilder: (context, index) => Center(child: images[index]), // Menampilkan gambar berdasarkan index
                    ),
                  ),
                ),
                // Tombol panah kanan
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60),
                  onPressed: _currentPage < images.length - 1 // Aktif jika bukan halaman terakhir
                      ? () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          )
                      : null, // Nonaktif jika di halaman terakhir
                ),
              ],
            ),
            // ========================================================
            // INDIKATOR HALAMAN (TITIK-TITIK)
            // Menampilkan indikator titik untuk menunjukkan posisi halaman saat ini
            // ========================================================
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Menyusun titik-titik di tengah
                children: List.generate(
                  images.length, // Jumlah titik sesuai dengan jumlah gambar
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5), // Jarak antar titik
                    width: 8, // Ukuran titik
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Bentuk titik melingkar
                      color: _currentPage == index // Warna titik berdasarkan halaman aktif
                          ? Colors.white
                          : Colors.white38, // Warna titik jika tidak aktif
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========================================================
  // FUNGSI UNTUK MEMBANGUN WIDGET GAMBAR
  // Fungsi ini membangun widget gambar berdasarkan URL yang diterima dari backend.
  // ========================================================
  Widget _buildImage(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ========================================================
          // GAMBAR DENGAN SUDUT MELENGKUNG
          // Kita gunakan ClipRRect untuk memberikan efek sudut melengkung pada gambar.
          // ========================================================
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Sudut melengkung
              child: Image.network(
                imageUrl, // URL gambar
                width: MediaQuery.of(context).size.width * 0.7, // Sesuaikan lebar gambar
                fit: BoxFit.contain, // Sesuaikan ukuran gambar agar tidak terpotong
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, size: 48, color: Colors.red), // Ikon jika gambar gagal dimuat
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child; // Jika gambar sudah siap, tampilkan
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white), // Indikator loading
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title, // Judul gambar
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  // ========================================================
  // METODE dispose
  // Dispose digunakan untuk membersihkan sumber daya seperti controller saat widget dihapus.
  // ========================================================
  @override
  void dispose() {
    _pageController.dispose(); // Hapus controller ketika widget tidak lagi digunakan
    super.dispose(); // Memanggil metode dispose dari superclass
  }
}
