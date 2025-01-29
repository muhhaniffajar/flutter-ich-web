// ========================================================
// IMPORT LIBRARIES
// Mengimpor berbagai library yang dibutuhkan untuk melakukan pembangunan antarmuka pengguna pada aplikasi Flutter. 
// Material.dart menyediakan komponen-komponen UI dasar yang digunakan dalam pengembangan aplikasi Flutter, seperti AppBar, Scaffold, dan lain-lain.
// ========================================================
import 'package:flutter/material.dart';

class DisplayHeatmap extends StatefulWidget {
  // ========================================================
  // MENERIMA PARAMETER RESPONSE DATA YANG BERISI DATA INFERENSI
  // - responseData: Data respon yang diteruskan ke widget ini, berisi informasi inferensi dan heatmap.
  // ========================================================
  final Map<String, dynamic>? responseData;

  const DisplayHeatmap({super.key, required this.responseData});

  @override
  DisplayHeatmapState createState() => DisplayHeatmapState();
}

class DisplayHeatmapState extends State<DisplayHeatmap> {
  // ========================================================
  // INISIALISASI PAGE CONTROLLER UNTUK MENGELOLA HALAMAN PADA PAGEVIEW
  // _pageController: Digunakan untuk mengatur halaman yang sedang aktif.
  // _currentPage: Menyimpan indeks halaman yang sedang aktif.
  // ========================================================
  final PageController _pageController = PageController();
  int _currentPage = 0;  // Menyimpan halaman yang sedang aktif

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;  // Mengambil lebar layar perangkat

    // ========================================================
    // MENDAPATKAN DATA INFERENSI DARI responseData
    // Mengambil data heatmap dari responseData yang diterima.
    // ========================================================
    final List<dynamic>? inferences = widget.responseData?['inferences'];

    // ========================================================
    // MENANGANI KASUS KETIKA DATA HEATMAP TIDAK TERSEDIA
    // Jika tidak ada data heatmap, tampilkan pesan informasi.
    // ========================================================
    if (inferences == null || inferences.isEmpty) {
      return const Center(child: Text('No heatmap data available.'));
    }

    // ========================================================
    // MEMBUAT LIST WIDGET GAMBARS HEATMAP UNTUK DITAMPILKAN
    // heatmapImages: List widget gambar heatmap yang akan ditampilkan.
    // ========================================================
    final List<Widget> heatmapImages = _buildHeatmapImages(inferences, screenWidth);

    // ========================================================
    // MENAMPILKAN GAMBARS HEATMAP DENGAN SCROLLABLE DAN PAGEVIEW
    // SingleChildScrollView memungkinkan konten untuk digulir secara vertikal.
    // PageView memungkinkan pengguna menavigasi gambar heatmap.
    // ========================================================
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 15, 18, 25)),
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFF1B1E25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ========================================================
            // ROW UNTUK NAVIGASI DAN HALAMAN
            // Menampilkan tombol untuk berpindah antar halaman dan PageView untuk gambar.
            // ========================================================
            Row(
              children: [
                // Tombol untuk pindah ke gambar sebelumnya
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white60),
                  onPressed: _currentPage > 0
                      ? () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          )
                      : null,
                ),
                // Menampilkan PageView untuk menampilkan gambar
                Expanded(
                  child: SizedBox(
                    height: screenWidth * 0.45 + 40,  // Mengatur tinggi untuk konten gambar
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: inferences.length,  // Banyaknya gambar
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;  // Menyimpan halaman aktif
                        });
                      },
                      itemBuilder: (context, index) => Center(child: heatmapImages[index]),
                    ),
                  ),
                ),
                // Tombol untuk pindah ke gambar berikutnya
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60),
                  onPressed: _currentPage < heatmapImages.length - 1
                      ? () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          )
                      : null,
                ),
              ],
            ),
            // ========================================================
            // INDICATOR HALAMAN UNTUK MENUNJUKKAN HALAMAN AKTIF
            // Row untuk menunjukkan indikator halaman yang aktif.
            // ========================================================
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  heatmapImages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.white : Colors.white38,
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
  // MEMBUAT LIST WIDGET GAMBARS HEATMAP UNTUK DITAMPILKAN
  // heatmapImages: List widget gambar heatmap yang akan ditampilkan.
  // ========================================================
  List<Widget> _buildHeatmapImages(List<dynamic> inferences, double screenWidth) {
    const String baseUrl = 'https://mortality-campaigns-choir-pix.trycloudflare.com/';

    return inferences.map((inference) {
      final String? heatmapPath = inference['heatmap'];
      final String? label = inference['label'];
      final String? confidence = inference['confidence'];

      // ========================================================
      // MEMERIKSA PATH GAMBAR HEATMAP
      // Jika path gambar heatmap kosong, gambar tidak akan ditampilkan.
      // ========================================================
      if (heatmapPath == null || heatmapPath.isEmpty) return const SizedBox();

      final String fullImageUrl = '$baseUrl$heatmapPath';  // Menghasilkan URL lengkap gambar

      // ========================================================
      // MEMBUAT WIDGET UNTUK SETIAP GAMBAR HEATMAP
      // Setiap gambar heatmap akan menampilkan label dan confidence jika ada.
      // ========================================================
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                fullImageUrl,
                width: screenWidth * 0.7,  // Mengatur lebar gambar sesuai layar
                fit: BoxFit.contain,  // Menggunakan BoxFit.contain untuk memastikan gambar tidak terpotong
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, size: 48, color: Colors.red),
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;  // Menampilkan gambar ketika sudah dimuat
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                },
              ),
            ),
          ),
          if (label != null && confidence != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Label: $label',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    'Confidence: $confidence',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
        ],
      );
    }).toList();  // Mengubah data inferensi menjadi list widget gambar
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
