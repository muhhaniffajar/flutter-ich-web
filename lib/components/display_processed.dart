// ========================================================
// IMPORT LIBRARIES
// Mengimpor berbagai library yang dibutuhkan untuk melakukan pembangunan antarmuka pengguna pada aplikasi Flutter. 
// Material.dart menyediakan komponen-komponen UI dasar yang digunakan dalam pengembangan aplikasi Flutter, seperti AppBar, Scaffold, dan lain-lain.
// ========================================================
import 'package:flutter/material.dart';

// ========================================================
// STATEFUL WIDGET UNTUK MENAMPILKAN GAMBAR HASIL PEMROSESAN
// Stateful widget untuk menampilkan gambar hasil pemrosesan
// ========================================================
class DisplayProcessed extends StatefulWidget {
  final Map<String, dynamic>? responseData; // Data JSON yang berisi informasi gambar

  // Constructor widget
  const DisplayProcessed({super.key, required this.responseData});

  @override
  DisplayProcessedState createState() => DisplayProcessedState();
}

class DisplayProcessedState extends State<DisplayProcessed> {
  // ========================================================
  // PAGE CONTROLLER UNTUK MENGELOLA PERGERAKAN ANTAR HALAMAN
  // PageController untuk mengelola pergerakan antar halaman pada PageView
  // ========================================================
  final PageController _pageController = PageController();
  int _currentPage = 0; // Menyimpan indeks halaman yang sedang aktif

  @override
  Widget build(BuildContext context) {
    // ========================================================
    // BASE URL UNTUK MENDAPATKAN GAMBAR DARI BACKEND
    // Base URL untuk mendapatkan gambar dari backend
    // ========================================================
    const String baseUrl = 'https://mortality-campaigns-choir-pix.trycloudflare.com/';

    // ========================================================
    // MENDAPATKAN LEBAR LAYAR UNTUK MENYESUAIKAN UKURAN GAMBAR
    // Mendapatkan lebar layar untuk menyesuaikan ukuran gambar
    // ========================================================
    final screenWidth = MediaQuery.of(context).size.width;

    // ========================================================
    // MENDAPATKAN JALUR GAMBAR DARI responseData
    // Mendapatkan jalur gambar dari responseData jika tersedia
    // ========================================================
    final String? imagePath = widget.responseData?['processed_image']?['brain_window'];
    final String? imagePath2 = widget.responseData?['processed_image']?['subdural_window'];
    final String? imagePath3 = widget.responseData?['processed_image']?['soft_window'];
    final String? imagePath4 = widget.responseData?['processed_image']?['stacked'];

    // ========================================================
    // MEMBANGUN DAFTAR WIDGET GAMBAR YANG AKAN DITAMPILKAN
    // Membuat daftar widget gambar yang akan ditampilkan
    // ========================================================
    final List<Widget> images = [];
    if (imagePath != null) {
      final String fullImageUrl = '$baseUrl$imagePath'; // Menggabungkan base URL dan path gambar
      images.add(_buildImage('Brain Window', fullImageUrl)); // Menambahkan widget gambar ke daftar
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
    // JIKA TIDAK ADA GAMBAR, TAMPILKAN TEKS "NO IMAGES AVAILABLE"
    // Jika tidak ada gambar tersedia, tampilkan teks "No images available"
    // ========================================================
    if (images.isEmpty) {
      return const Center(child: Text('No images available.'));
    }

    // ========================================================
    // TAMPILAN UTAMA BERUPA CAROUSEL GAMBAR
    // Tampilan utama berupa carousel gambar
    // ========================================================
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10), // Padding container
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 15, 18, 25)), // Warna border
          borderRadius: BorderRadius.circular(20.0), // Radius border
          color: const Color(0xFF1B1E25), // Warna background
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ukuran kolom mengikuti konten
          children: [
            // ========================================================
            // NAVIGASI CAROUSEL DENGAN TOMBOL PANAH KIRI DAN KANAN
            // Navigasi carousel dengan tombol panah kiri dan kanan
            // ========================================================
            Row(
              children: [
                // Tombol panah kiri
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white60), // Ikon panah
                  onPressed: _currentPage > 0 // Aktif jika bukan halaman pertama
                      ? () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 400), // Durasi animasi
                            curve: Curves.easeInOut, // Kurva animasi
                          )
                      : null, // Nonaktif jika di halaman pertama
                ),
                // ========================================================
                // AREA UNTUK MENAMPILKAN GAMBAR DALAM CAROUSEL
                // Area untuk menampilkan gambar dalam carousel
                // ========================================================
                Expanded(
                  child: SizedBox(
                    height: screenWidth * 0.45 + 40, // Menyesuaikan tinggi carousel dengan lebar layar
                    child: PageView.builder(
                      controller: _pageController, // Menggunakan PageController
                      itemCount: images.length, // Jumlah halaman sesuai jumlah gambar
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page; // Mengubah halaman aktif
                        });
                      },
                      itemBuilder: (context, index) => Center(child: images[index]), // Menampilkan gambar sesuai indeks
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
            // INDIKATOR HALAMAN BERUPA TITIK-TITIK
            // Indikator halaman berupa titik-titik
            // ========================================================
            Padding(
              padding: const EdgeInsets.only(top: 5), // Jarak ke atas
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Posisi titik di tengah
                children: List.generate(
                  images.length, // Jumlah titik sesuai jumlah gambar
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5), // Jarak antar titik
                    width: 8, // Lebar titik
                    height: 8, // Tinggi titik
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Bentuk titik lingkaran
                      color: _currentPage == index // Warna aktif jika titik mewakili halaman aktif
                          ? Colors.white
                          : Colors.white38, // Warna nonaktif
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
  // Fungsi untuk membuat widget gambar
  // ========================================================
  Widget _buildImage(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding horizontal untuk gambar
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Gambar dan teks di tengah
        mainAxisSize: MainAxisSize.min, // Ukuran kolom mengikuti konten
        children: [
          // ========================================================
          // GAMBAR DENGAN SUDUT MELENGKUNG
          // Gambar dengan sudut melengkung
          // ========================================================
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Sudut melengkung gambar
            child: Image.network(
              imageUrl, // URL gambar
              width: MediaQuery.of(context).size.width * 0.7, // Menyesuaikan lebar gambar
              fit: BoxFit.contain, // Menyesuaikan gambar dengan kotak tanpa memotong
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.broken_image, size: 48, color: Colors.red), // Ikon jika gagal memuat gambar
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child; // Jika selesai memuat, tampilkan gambar
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white), // Indikator loading
                );
              },  
            ),
          ),
          const SizedBox(height: 8), // Jarak antara gambar dan teks judul
          Text(
            title, // Judul gambar  
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400), // Gaya teks
          ),
        ],
      ),
    );
  }
  // ========================================================
  // Dispose Method
  // Melepaskan resource yang digunakan oleh widget ketika widget dihapus
  // Dalam hal ini, melepaskan controller halaman (_pageController)
  // ========================================================
  @override
  void dispose() {
    _pageController.dispose(); // Membersihkan PageController saat widget dihapus
    super.dispose(); // Memanggil metode dispose dari superclass
  }
}
