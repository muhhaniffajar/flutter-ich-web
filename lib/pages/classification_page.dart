// ========================================================
// IMPORT PACKAGE DAN HALAMAN-HALAMAN
// Mengimpor package Flutter dan halaman-halaman untuk navigasi antar layar
// ========================================================

// Mengimpor package yang diperlukan untuk aplikasi
// 'package:flutter/material.dart' untuk menggunakan widget standar dari Flutter seperti Scaffold, AppBar, Icon, dan sebagainya
import 'package:flutter/material.dart';

// Mengimpor halaman-halaman untuk navigasi antar layar
import '../components/upload_file.dart';
import '../components/display_heatmap.dart';
import '../components/display_processed.dart';
import '../components/display_prediction.dart';
import 'package:ich_web/main.dart';

// ========================================================
// CLASSIFICATIONPAGE: HALAMAN UTAMA UNTUK KLASIFIKASI
// Merupakan widget utama yang menampilkan halaman klasifikasi
// ========================================================

// ClassificationPage: Widget utama untuk halaman klasifikasi.
// StatefulWidget: Digunakan karena halaman ini akan mengalami perubahan dinamis (seperti file yang diunggah, hasil analisis, dll).
// createState: Membuat instance dari ClassificationPageState, yang akan menangani state halaman ini.
class ClassificationPage extends StatefulWidget {
  const ClassificationPage({super.key});

  @override
  ClassificationPageState createState() => ClassificationPageState();
}

// ========================================================
// STATE CLASSIFICATIONPAGE
// Mengelola status halaman klasifikasi, seperti file DICOM yang diunggah,
// status loading, dan hasil klasifikasi
// ========================================================

// Menangani status dan logika interaksi pada halaman klasifikasi.
// dicomFile: Menyimpan file DICOM yang diunggah.
// isLoading: Menyimpan status apakah aplikasi sedang memuat atau tidak.
// isClassified: Menyimpan status apakah klasifikasi sudah selesai.
// responseData: Menyimpan data hasil respons dari server, misalnya hasil klasifikasi dan analisis.
class ClassificationPageState extends State<ClassificationPage> with SingleTickerProviderStateMixin {
  dynamic dicomFile;
  bool isLoading = false;
  bool isClassified = false;
  Map<String, dynamic>? responseData;

  // _scrollController: Digunakan untuk mengontrol dan mendeteksi perubahan scroll di halaman.
  // animationController: Kontrol untuk animasi yang mengatur visibilitas AppBar saat halaman di-scroll.
  // _isAppBarVisible: Status visibilitas dari AppBar.
  // _lastOffset: Menyimpan posisi scroll terakhir untuk mendeteksi arah scroll (ke atas atau ke bawah).
  late ScrollController _scrollController;
  late AnimationController animationController;
  bool _isAppBarVisible = true;
  double _lastOffset = 0;

  // Inisialisasi objek controller untuk scroll dan animasi.
  // addListener: Menambahkan listener untuk mendeteksi perubahan posisi scroll.
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  // ========================================================
  // dispose(): Menangani pembebasan sumber daya
  // Fungsi ini digunakan untuk membuang listener dan controller
  // setelah widget dihancurkan untuk mencegah kebocoran memori
  // ========================================================
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  // ========================================================
  // _scrollListener(): Fungsi untuk mendeteksi perubahan posisi scroll
  // Ini memanipulasi visibilitas AppBar berdasarkan scroll
  // ========================================================
  void _scrollListener() {
    double currentOffset = _scrollController.offset;

    // Mengubah logika: jika scroll ke bawah sembunyikan AppBar, jika scroll ke atas tampilkan AppBar
    if (currentOffset > _lastOffset && currentOffset > 0) {
      if (_isAppBarVisible) {
        setState(() {
          _isAppBarVisible = false;
        });
        animationController.reverse();
      }
    } else if (currentOffset < _lastOffset) {
      if (!_isAppBarVisible) {
        setState(() {
          _isAppBarVisible = true;
        });
        animationController.forward();
      }
    }
    // Menampilkan AppBar saat scroll berada di posisi paling atas
    if (currentOffset == 0) {
      if (!_isAppBarVisible) {
        _isAppBarVisible = true;
        animationController.forward();
      }
    }
    _lastOffset = currentOffset;
  }

  // ========================================================
  // updateDicomFile(): Memperbarui status file DICOM yang diunggah
  // ========================================================
  void updateDicomFile(dynamic file) {
    setState(() {
      dicomFile = file;
    });
  }

  // ========================================================
  // updateResponse(): Memperbarui status data respons hasil analisis
  // ========================================================
  void updateResponse(Map<String, dynamic>? response) {
    setState(() {
      responseData = response;
    });
  }

  // ========================================================
  // onClassifyCompleted(): Mengatur status ketika klasifikasi selesai
  // ========================================================
  void onClassifyCompleted() {
    setState(() {
      isClassified = true;
    });
  }

  // ========================================================
  // _goToHomePage(): Navigasi kembali ke halaman utama
  // ========================================================
  void _goToHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
      (Route<dynamic> route) => false,
    );
  }

  // ========================================================
  // build(): Membangun tampilan halaman klasifikasi
  // ========================================================
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final containerHeight = screenHeight * 0.4; // Adjusted height for consistency

    return Scaffold(
      appBar: _isAppBarVisible
          ? AppBar(
              leading: Tooltip(
                message: 'Back to Home',
                child: IconButton(
                  icon: const Icon(Icons.home, color: Colors.white60),
                  onPressed: _goToHomePage,
                ),
              ),
              backgroundColor: const Color(0xFF1B1E25),
              elevation: 0,
              title: const Text(
                'Intracranial Hemorrhage Classification',
                style: TextStyle(color: Colors.white60),
              ),
            )
          : null, // Jika AppBar tidak terlihat, hilangkan AppBar
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth,
                  color: const Color(0xFF1B1E25),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Center(
                              child: _buildContainer(
                                title: 'Upload DICOM File',
                                child: UploadFile(
                                  dicomFile: dicomFile,
                                  isLoading: isLoading,
                                  onFileSelected: updateDicomFile,
                                  onResponseReceived: updateResponse,
                                  onLoadingStateChanged: (value) => setState(() => isLoading = value),
                                  onClassifyCompleted: onClassifyCompleted,
                                  onFileRemoved: () {
                                    setState(() {
                                      dicomFile = null;
                                      isClassified = false;
                                      responseData = null;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: _buildContainer(
                                    title: 'HeatMap Detection',
                                    child: isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(color: Colors.white60),
                                          )
                                        : responseData != null
                                            ? DisplayHeatmap(responseData: responseData!)
                                            : _buildPlaceholder('No heatmap generated yet', height: containerHeight),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  flex: 1,
                                  child: _buildContainer(
                                    title: 'Processed Image',
                                    child: isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(color: Colors.white60),
                                          )
                                        : responseData != null
                                            ? DisplayProcessed(responseData: responseData!)
                                            : _buildPlaceholder('No processed image available', height: containerHeight),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            _buildContainer(
                              title: 'Classification Result',
                              child: isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(color: Colors.white60),
                                    )
                                  : isClassified && responseData != null
                                      ? DisplayPrediction(responseData: responseData!)
                                      : _buildPlaceholder('No Classification result available'),
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

  // ========================================================
  // _buildContainer(): Membuat container dengan judul dan widget anak
  // ========================================================
  Widget _buildContainer({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 37, 39, 55)),
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white60),
          ),
          const SizedBox(height: 8.0),
          child,
        ],
      ),
    );
  }

  // ========================================================
  // _buildPlaceholder(): Menampilkan pesan placeholder ketika data tidak ada
  // ========================================================
  Widget _buildPlaceholder(String message, {double? height}) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2233),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white60),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
