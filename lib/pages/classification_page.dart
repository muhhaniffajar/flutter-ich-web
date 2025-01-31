import 'package:flutter/material.dart';
import '../components/upload_file.dart';
import '../components/display_heatmap.dart';
import '../components/display_processed.dart';
import '../components/display_prediction.dart';
import 'package:ich_web/main.dart';

/// Halaman utama untuk klasifikasi intracranial hemorrhage (ICH).
/// Halaman ini mengelola file DICOM yang diunggah, menampilkan hasil heatmap, gambar yang diproses, dan hasil klasifikasi.
class ClassificationPage extends StatefulWidget {
  const ClassificationPage({super.key});

  @override
  ClassificationPageState createState() => ClassificationPageState();
}

/// Kelas yang mengelola status dan logika interaksi pada halaman klasifikasi.
/// Menggunakan SingleTickerProviderStateMixin untuk kontrol animasi dan scroll.
class ClassificationPageState extends State<ClassificationPage> with SingleTickerProviderStateMixin {
  /// Menyimpan file DICOM yang diunggah. Tipe dinamis karena bisa berubah sesuai file yang diunggah.
  dynamic dicomFile;
  
  /// Menyimpan status apakah aplikasi sedang memuat data atau tidak.
  bool isLoading = false;

  /// Menyimpan status apakah klasifikasi sudah selesai dilakukan.
  bool isClassified = false;

  /// Menyimpan data respons dari server yang berisi hasil klasifikasi dan analisis lainnya.
  Map<String, dynamic>? responseData;

  /// Controller untuk mengontrol dan mendeteksi perubahan scroll pada halaman.
  late ScrollController _scrollController;

  /// Kontrol untuk animasi yang mengatur visibilitas AppBar saat halaman di-scroll.
  late AnimationController animationController;

  /// Status visibilitas dari AppBar (Apakah AppBar terlihat atau tidak).
  bool _isAppBarVisible = true;

  /// Menyimpan posisi scroll terakhir untuk mendeteksi arah scroll (ke atas atau ke bawah).
  double _lastOffset = 0;

  /// Inisialisasi objek controller untuk scroll dan animasi.
  @override
  void initState() {
    super.initState();

    // Inisialisasi controller untuk scroll
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    // Inisialisasi controller untuk animasi
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  /// Fungsi untuk menangani pembebasan sumber daya (dispose).
  /// Digunakan untuk membuang listener dan controller setelah widget dihancurkan 
  /// untuk mencegah kebocoran memori.
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);  // Hapus listener dari scroll
    _scrollController.dispose();  // Hapus controller scroll
    animationController.dispose();  // Hapus controller animasi
    super.dispose();  // Panggil dispose dari superclass
  }

  /// Fungsi untuk mendeteksi perubahan posisi scroll.
  /// Logika ini digunakan untuk memanipulasi visibilitas AppBar berdasarkan scroll.
  void _scrollListener() {
    double currentOffset = _scrollController.offset;

    // Jika posisi scroll lebih besar dari posisi sebelumnya, scroll ke bawah, sembunyikan AppBar
    if (currentOffset > _lastOffset && currentOffset > 0) {
      if (_isAppBarVisible) {
        setState(() {
          _isAppBarVisible = false;  // Sembunyikan AppBar
        });
        animationController.reverse();  // Efek animasi sembunyikan AppBar
      }
    } 
    // Jika posisi scroll lebih kecil, scroll ke atas, tampilkan AppBar
    else if (currentOffset < _lastOffset) {
      if (!_isAppBarVisible) {
        setState(() {
          _isAppBarVisible = true;  // Tampilkan AppBar
        });
        animationController.forward();  // Efek animasi tampilkan AppBar
      }
    }

    // Jika scroll berada di posisi paling atas, pastikan AppBar terlihat
    if (currentOffset == 0) {
      if (!_isAppBarVisible) {
        _isAppBarVisible = true;
        animationController.forward();  // Efek animasi tampilkan AppBar
      }
    }
    _lastOffset = currentOffset;  // Update posisi scroll terakhir
  }

  /// Memperbarui status file DICOM yang diunggah.
  /// Mengubah nilai dicomFile dengan file yang dipilih dan memicu pembaruan tampilan.
  void updateDicomFile(dynamic file) {
    setState(() {
      dicomFile = file;  // Update file yang diunggah
    });
  }

  /// Memperbarui status data respons hasil analisis.
  /// Mengubah nilai responseData dengan data hasil klasifikasi dan analisis.
  void updateResponse(Map<String, dynamic>? response) {
    setState(() {
      responseData = response;  // Update data hasil analisis
    });
  }

  /// Mengatur status ketika klasifikasi selesai dilakukan.
  /// Fungsi ini akan mengubah status isClassified menjadi true.
  void onClassifyCompleted() {
    setState(() {
      isClassified = true;  // Tandai klasifikasi selesai
    });
  }

  /// Fungsi untuk navigasi kembali ke halaman utama (HomePage).
  void _goToHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),  // Navigasi ke halaman utama
      (Route<dynamic> route) => false,  // Hapus semua route sebelumnya
    );
  }

  /// Fungsi untuk membangun tampilan halaman klasifikasi.
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final containerHeight = screenHeight * 0.4;  // Menentukan tinggi kontainer (40% dari tinggi layar)
    final isWideScreen = screenWidth > 600;  // Cek apakah layar cukup lebar untuk tampilan horizontal

    return Scaffold(
      appBar: _isAppBarVisible  // Jika AppBar terlihat
          ? AppBar(
              leading: Tooltip(
                message: 'Back to Home',  // Tooltip untuk ikon kembali ke home
                child: IconButton(
                  icon: const Icon(Icons.home, color: Colors.white60),  // Ikon untuk kembali ke home
                  onPressed: _goToHomePage,  // Fungsi ketika tombol ditekan
                ),
              ),
              backgroundColor: const Color(0xFF1B1E25),  // Warna latar belakang AppBar
              elevation: 0,  // Hilangkan bayangan di bawah AppBar
              title: const Text(
                'Intracranial Hemorrhage Classification',
                style: TextStyle(color: Colors.white60),
              ),
            )
          : null,  // Jika AppBar tidak terlihat, jangan tampilkan AppBar
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth,  // Menyesuaikan lebar kontainer
                  color: const Color(0xFF1B1E25),  // Warna latar belakang utama
                  child: SingleChildScrollView(
                    controller: _scrollController,  // Kontrol scroll
                    padding: const EdgeInsets.all(16.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,  // Menentukan tinggi minimal kontainer
                      ),
                      child: IntrinsicHeight(  // Agar tinggi kontainer menyesuaikan dengan anaknya
                        child: Column(
                          children: [
                            Center(
                              child: _buildContainer(
                                title: 'Upload DICOM File',  // Judul kontainer
                                child: UploadFile(
                                  dicomFile: dicomFile,  // Kirim file DICOM
                                  isLoading: isLoading,  // Status loading
                                  onFileSelected: updateDicomFile,  // Fungsi untuk update file
                                  onResponseReceived: updateResponse,  // Fungsi untuk update data respons
                                  onLoadingStateChanged: (value) => setState(() => isLoading = value),  // Fungsi untuk mengubah status loading
                                  onClassifyCompleted: onClassifyCompleted,  // Fungsi untuk menandai klasifikasi selesai
                                  onFileRemoved: () {
                                    setState(() {
                                      dicomFile = null;  // Hapus file yang diunggah
                                      isClassified = false;  // Reset status klasifikasi
                                      responseData = null;  // Hapus data respons
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            isWideScreen
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: _buildContainer(
                                          title: 'HeatMap Detection',  // Judul kontainer Heatmap
                                          child: isLoading
                                              ? const Center(
                                                  child: CircularProgressIndicator(color: Colors.white60),
                                                )
                                              : responseData != null
                                                  ? DisplayHeatmap(responseData: responseData!)  // Tampilkan heatmap jika ada
                                                  : _buildPlaceholder('No heatmap generated yet', height: containerHeight),  // Placeholder jika tidak ada heatmap
                                        ),
                                      ),
                                      const SizedBox(width: 16.0),
                                      Expanded(
                                        flex: 1,
                                        child: _buildContainer(
                                          title: 'Processed Image',  // Judul kontainer gambar yang diproses
                                          child: isLoading
                                              ? const Center(
                                                  child: CircularProgressIndicator(color: Colors.white60),
                                                )
                                              : responseData != null
                                                  ? DisplayProcessed(responseData: responseData!)  // Tampilkan gambar yang diproses jika ada
                                                  : _buildPlaceholder('No processed image available', height: containerHeight),  // Placeholder jika tidak ada gambar yang diproses
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      _buildContainer(
                                        title: 'HeatMap Detection',
                                        child: isLoading
                                            ? const Center(
                                                child: CircularProgressIndicator(color: Colors.white60),
                                              )
                                            : responseData != null
                                                ? DisplayHeatmap(responseData: responseData!)
                                                : _buildPlaceholder('No heatmap generated yet', height: containerHeight),
                                      ),
                                      const SizedBox(height: 20),
                                      _buildContainer(
                                        title: 'Processed Image',
                                        child: isLoading
                                            ? const Center(
                                                child: CircularProgressIndicator(color: Colors.white60),
                                              )
                                            : responseData != null
                                                ? DisplayProcessed(responseData: responseData!)
                                                : _buildPlaceholder('No processed image available', height: containerHeight),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 20),
                            _buildContainer(
                              title: 'Classification Result',  // Judul kontainer hasil klasifikasi
                              child: isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(color: Colors.white60),
                                    )
                                  : isClassified && responseData != null
                                      ? DisplayPrediction(responseData: responseData!)  // Tampilkan hasil klasifikasi jika ada
                                      : _buildPlaceholder('No Classification result available'),  // Placeholder jika hasil klasifikasi tidak ada
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Membuat kontainer dengan judul dan widget anak.
  /// Widget ini akan menampilkan elemen UI dalam bentuk kontainer yang memiliki border dan warna latar belakang.
  Widget _buildContainer({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 37, 39, 55)),  // Warna border
        color: const Color(0xFF2A2D3E),  // Warna latar belakang kontainer
        borderRadius: BorderRadius.circular(8.0),  // Sudut tumpul
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white60),  // Gaya teks untuk judul
          ),
          const SizedBox(height: 8.0),  // Jarak antara judul dan konten
          child,  // Widget anak yang diteruskan ke dalam kontainer
        ],
      ),
    );
  }

  /// Menampilkan pesan placeholder ketika data tidak ada.
  /// Placeholder ini digunakan untuk memberikan informasi jika hasil atau data belum tersedia.
  Widget _buildPlaceholder(String message, {double? height}) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2233),  // Warna latar belakang placeholder
        borderRadius: BorderRadius.circular(8.0),  // Sudut tumpul
      ),
      child: Center(
        child: Text(
          message,  // Pesan placeholder
          style: const TextStyle(color: Colors.white60),  // Gaya teks untuk placeholder
          textAlign: TextAlign.center,  // Penyusunan teks di tengah
        ),
      ),
    );
  }
}
