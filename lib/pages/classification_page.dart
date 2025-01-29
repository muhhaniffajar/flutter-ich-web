import 'package:flutter/material.dart';
import '../components/upload_file.dart';
import '../components/display_heatmap.dart';
import '../components/display_processed.dart';
import '../components/display_prediction.dart';
import 'package:ich_web/main.dart';

/// Halaman utama untuk klasifikasi intrakranial hemorrhage.
class ClassificationPage extends StatefulWidget {
  const ClassificationPage({super.key});

  @override
  ClassificationPageState createState() => ClassificationPageState();
}

/// Kelas yang mengelola status dan logika interaksi pada halaman klasifikasi.
class ClassificationPageState extends State<ClassificationPage> with SingleTickerProviderStateMixin {
  /// Menyimpan file DICOM yang diunggah.
  dynamic dicomFile;
  /// Menyimpan status apakah aplikasi sedang memuat atau tidak.
  bool isLoading = false;
  /// Menyimpan status apakah klasifikasi sudah selesai.
  bool isClassified = false;
  /// Menyimpan data hasil respons dari server, misalnya hasil klasifikasi dan analisis.
  Map<String, dynamic>? responseData;

  /// Controller untuk mengontrol dan mendeteksi perubahan scroll di halaman.
  late ScrollController _scrollController;
  /// Kontrol untuk animasi yang mengatur visibilitas AppBar saat halaman di-scroll.
  late AnimationController animationController;
  /// Status visibilitas dari AppBar.
  bool _isAppBarVisible = true;
  /// Menyimpan posisi scroll terakhir untuk mendeteksi arah scroll (ke atas atau ke bawah).
  double _lastOffset = 0;

  /// Inisialisasi objek controller untuk scroll dan animasi.
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

  /// Menangani pembebasan sumber daya.
  /// Fungsi ini digunakan untuk membuang listener dan controller
  /// setelah widget dihancurkan untuk mencegah kebocoran memori.
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  /// Fungsi untuk mendeteksi perubahan posisi scroll.
  /// Ini memanipulasi visibilitas AppBar berdasarkan scroll.
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

  /// Memperbarui status file DICOM yang diunggah.
  void updateDicomFile(dynamic file) {
    setState(() {
      dicomFile = file;
    });
  }

  /// Memperbarui status data respons hasil analisis.
  void updateResponse(Map<String, dynamic>? response) {
    setState(() {
      responseData = response;
    });
  }

  /// Mengatur status ketika klasifikasi selesai.
  void onClassifyCompleted() {
    setState(() {
      isClassified = true;
    });
  }

  /// Navigasi kembali ke halaman utama.
  void _goToHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
      (Route<dynamic> route) => false,
    );
  }

  /// Membangun tampilan halaman klasifikasi.
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final containerHeight = screenHeight * 0.4; // Adjusted height for consistency

    // Menentukan apakah layar cukup lebar untuk menampilkan kontainer secara horizontal
    final isWideScreen = screenWidth > 600;

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
                            isWideScreen
                                ? Row(
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

  /// Membuat container dengan judul dan widget anak.
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

  /// Menampilkan pesan placeholder ketika data tidak ada.
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
