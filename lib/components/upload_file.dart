// ========================================================
// IMPORT PACKAGE DAN HALAMAN-HALAMAN
// Mengimpor package Flutter dan halaman-halaman untuk navigasi antar layar
// ========================================================

import 'package:flutter/foundation.dart'; // Untuk debugging dengan kDebugMode
import 'package:flutter/material.dart'; // Untuk membangun antarmuka pengguna menggunakan Material Design (Flutter Framework: https://flutter.dev/docs)
import 'package:file_picker/file_picker.dart'; // Untuk memilih file dari perangkat pengguna (FilePicker: https://pub.dev/packages/file_picker)
import 'package:dio/dio.dart'; // Untuk membuat permintaan HTTP dengan lebih mudah (Dio: https://pub.dev/packages/dio)
import 'package:http_parser/http_parser.dart'; // Untuk menentukan jenis konten file (HttpParser: https://pub.dev/packages/http_parser)
import 'package:flutter/services.dart'; // Untuk mengakses file yang disimpan sebagai aset aplikasi (Flutter Framework: https://flutter.dev/docs)

// ========================================================
// WIDGET UPLOAD FILE
// Widget untuk mengelola pemilihan, pengunggahan, dan penghapusan file DICOM
// ========================================================

class UploadFile extends StatelessWidget {

  // ========================================================
  // DEKLARASI PROPERTI
  // Menyediakan properti untuk menangani file yang dipilih, status operasi, dan callback
  // ========================================================

  final dynamic dicomFile; // File DICOM yang dipilih oleh pengguna
  final bool isLoading; // Status apakah file sedang diunggah atau tidak
  final Function(dynamic) onFileSelected; // Callback untuk menangani file yang dipilih
  final Function(Map<String, dynamic>?) onResponseReceived; // Callback untuk menangani respons dari server
  final Function(bool) onLoadingStateChanged; // Callback untuk mengubah status loading
  final Function onClassifyCompleted; // Callback untuk menangani selesai proses klasifikasi
  final Function onFileRemoved; // Callback untuk menghapus file yang dipilih

  // ========================================================
  // KONSTRUKTOR
  // Menginisialisasi semua properti widget dengan nilai yang diteruskan
  // ========================================================

  UploadFile({
    Key? key,
    required this.dicomFile,
    required this.isLoading,
    required this.onFileSelected,
    required this.onResponseReceived,
    required this.onLoadingStateChanged,
    required this.onClassifyCompleted,
    required this.onFileRemoved,
  }) : super(key: key);

  // ========================================================
  // FUNGSI UNTUK MEMILIH FILE DICOM DARI PERANGKAT PENGGUNA
  // Fungsi ini membuka dialog pemilihan file untuk memilih file DICOM menggunakan package file_picker.
  // ========================================================

  Future<void> selectDicomFile() async {
    // Menggunakan FilePicker untuk dialog pemilihan file (https://pub.dev/packages/file_picker)
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['dcm'], // Hanya file dengan ekstensi .dcm yang diperbolehkan
    );

    if (result != null && result.files.single.bytes != null) {
      onFileSelected({
        'bytes': result.files.single.bytes,
        'name': result.files.single.name,
      });
    }
  }

  // ========================================================
  // FUNGSI UNTUK MENGUNDUH FILE DICOM KE SERVER
  // Fungsi ini mengunggah file DICOM yang dipilih ke server dengan menggunakan HTTP request menggunakan Dio.
  // ========================================================

  Future<void> uploadDicomFile() async {
    if (dicomFile == null) return;

    onLoadingStateChanged(true);

    try {
      final dio = Dio(); // Instance Dio untuk request HTTP (https://pub.dev/packages/dio)
      const url = 'https://mortality-campaigns-choir-pix.trycloudflare.com/image-model/?with_gradcam=true&with_windowing=true';

      // Membuat FormData untuk mengunggah file (https://pub.dev/packages/dio)
      FormData formData = FormData();
      formData.fields.add(const MapEntry('with_gradcam', 'true'));
      formData.fields.add(const MapEntry('with_windowing', 'true'));

      formData.files.add(MapEntry(
        'file',
        MultipartFile.fromBytes(dicomFile['bytes'], filename: dicomFile['name'], contentType: MediaType('application', 'dicom')), // HttpParser: https://pub.dev/packages/http_parser
      ));

      Response response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        onResponseReceived(response.data);
      } else {
        throw Exception('Failed to upload file');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      onLoadingStateChanged(false);
      onClassifyCompleted();
    }
  }

  // ========================================================
  // FUNGSI UNTUK MEMUAT FILE DICOM DARI ASET APLIKASI
  // Fungsi ini memuat file DICOM yang berada pada folder aset aplikasi menggunakan rootBundle.
  // ========================================================

  Future<void> loadDicomFromAsset(String filePath) async {
    try {
      final data = await rootBundle.load(filePath); // Memuat file dari aset (https://flutter.dev/docs)
      onFileSelected({
        'bytes': data.buffer.asUint8List(),
        'name': filePath.split('/').last,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading DICOM from assets: $e');
      }
    }
  }

  // ========================================================
  // DAFTAR FILE CONTOH DICOM DARI ASET
  // Menyediakan beberapa file DICOM contoh yang dapat dipilih pengguna.
  // ========================================================

  final List<String> assetFiles = [
    'assets/testing_web/ID_4af939e8d.dcm',
    'assets/testing_web/ID_58e7e2e55.dcm',
    'assets/testing_web/ID_cca25a801.dcm',
  ];

  // ========================================================
  // WIDGET UNTUK MEMPERSIAPKAN UI
  // Widget ini membangun antarmuka pengguna untuk memilih file dan mengunggahnya.
  // ========================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 15, 18, 25)),
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFF1B1E25),
      ),
      child: Column(
        children: [
          if (dicomFile == null)
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: selectDicomFile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    child: const Text(
                      'Select DICOM File from Device',
                      style: TextStyle(
                        color: Color.fromARGB(255, 58, 60, 63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (dicomFile != null) ...[
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    print("File name clicked: ${dicomFile['name']}");
                  }
                },
                child: Text(
                  'File Selected: ${dicomFile['name']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : uploadDicomFile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text(
                      'Upload and Classify',
                      style: TextStyle(
                        color: Color.fromARGB(255, 58, 60, 63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => onFileRemoved(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text(
                'Remove File',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          const Spacer(),
          const Text(
            'Select Example DICOM File',
            style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomCenter,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: assetFiles.map((filePath) {
                return ElevatedButton(
                  onPressed: () => loadDicomFromAsset(filePath),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                  child: Text(
                    filePath.split('/').last,
                    style: const TextStyle(color: Colors.white60),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
