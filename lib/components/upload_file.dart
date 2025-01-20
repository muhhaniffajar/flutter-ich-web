// ========================================================
// IMPORT PACKAGE DAN HALAMAN-HALAMAN
// Mengimpor package Flutter dan halaman-halaman untuk navigasi antar layar
// ========================================================

import 'package:flutter/foundation.dart'; // Untuk debugging dengan kDebugMode
import 'package:flutter/material.dart'; // Untuk membangun antarmuka pengguna menggunakan Material Design
import 'package:file_picker/file_picker.dart'; // Untuk memilih file dari perangkat pengguna
import 'package:http/http.dart' as http; // Untuk membuat permintaan HTTP
import 'dart:convert'; // Untuk decoding dan encoding data JSON
import 'package:http_parser/http_parser.dart'; // Untuk menentukan jenis konten file
import 'package:flutter/services.dart'; // Untuk mengakses file yang disimpan sebagai aset aplikasi

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
    required this.dicomFile, // File DICOM yang dipilih oleh pengguna
    required this.isLoading, // Status apakah file sedang diunggah atau tidak
    required this.onFileSelected, // Callback untuk menangani file yang dipilih
    required this.onResponseReceived, // Callback untuk menangani respons dari server
    required this.onLoadingStateChanged, // Callback untuk mengubah status loading
    required this.onClassifyCompleted, // Callback untuk menangani selesai proses klasifikasi
    required this.onFileRemoved, // Callback untuk menghapus file yang dipilih
  }) : super(key: key); // Membuat konstruktor dengan parameter yang diperlukan

  // ========================================================
  // FUNGSI UNTUK MEMILIH FILE DICOM DARI PERANGKAT PENGGUNA
  // Fungsi ini membuka dialog pemilihan file untuk memilih file DICOM menggunakan package file_picker.
  // ========================================================

  Future<void> selectDicomFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom, // Jenis file yang dipilih adalah custom
      allowedExtensions: ['dcm'], // Hanya file dengan ekstensi .dcm yang diperbolehkan
    );

    if (result != null && result.files.single.bytes != null) {
      onFileSelected({
        'bytes': result.files.single.bytes, // Isi file dalam bentuk byte array
        'name': result.files.single.name, // Nama file yang dipilih
      });
    }
  }

  // ========================================================
  // FUNGSI UNTUK MENGUNDUH FILE DICOM KE SERVER
  // Fungsi ini mengunggah file DICOM yang dipilih ke server dengan menggunakan HTTP request.
  // ========================================================

  Future<void> uploadDicomFile() async { // Fungsi untuk mengunggah file DICOM
    if (dicomFile == null) return; // Jika file tidak dipilih, maka tidak ada yang perlu diunggah

    onLoadingStateChanged(true); // Mengubah status loading menjadi true

    try {
      var uri = Uri.parse('https://mortality-campaigns-choir-pix.trycloudflare.com/image-model/?with_gradcam=true&with_windowing=true'); // URL server yang akan menerima file DICOM

      var request = http.MultipartRequest('POST', uri) // Membuat request HTTP POST
        ..headers.addAll({ // Menambahkan header ke request
          'accept': 'application/json', // Mengatur header Accept untuk menerima respons dalam format JSON
          'Content-Type': 'multipart/form-data', // Mengatur header Content-Type untuk mengirimkan file dalam bentuk multipart/form-data
        })
        ..files.add( // Menambahkan file ke request
          http.MultipartFile.fromBytes( // Membuat file multipart dari byte array file DICOM
            'file',
            dicomFile['bytes'], // Isi file dalam bentuk byte array
            filename: dicomFile['name'],  // Nama file yang dipilih
            contentType: MediaType('application', 'dicom'), // Mengatur jenis file yang dikirimkan
          ), 
        );

      var response = await request.send(); // Mengirimkan request ke server

      if (response.statusCode == 200) { // Jika respons status code 200 (OK)
        var responseBody = await response.stream.bytesToString(); // Mengubah respons menjadi string
        onResponseReceived(json.decode(responseBody)); // Mengirimkan data ke callback
      } else { // Jika respons status code bukan 200
        throw Exception('Failed to upload file'); // Membuat exception
      }
    } catch (e) { // Jika terjadi kesalahan
      if (kDebugMode) { // Jika mode debug aktif
        print('Error: $e'); // Mencetak kesalahan
      }
    } finally { // Jika tidak ada kesalahan
      onLoadingStateChanged(false); // Mengubah status loading kembali menjadi false
      onClassifyCompleted(); // Menandakan proses selesai
    }
  }

  // ========================================================
  // FUNGSI UNTUK MEMUAT FILE DICOM DARI ASET APLIKASI
  // Fungsi ini memuat file DICOM yang berada pada folder aset aplikasi menggunakan rootBundle.
  // ========================================================

  Future<void> loadDicomFromAsset(String filePath) async { // Fungsi untuk memuat file DICOM dari aset aplikasi
    try { // Jika tidak ada kesalahan
      final data = await rootBundle.load(filePath); // Memuat file dari aset
      onFileSelected({ // Mengirimkan data ke callback
        'bytes': data.buffer.asUint8List(), // Konversi data ke byte array
        'name': filePath.split('/').last, // Nama file dari path
      });
    } catch (e) { // Jika terjadi kesalahan
      if (kDebugMode) { // Jika mode debug aktif
        print('Error loading DICOM from assets: $e'); // Mencetak kesalahan
      }
    }
  }

  // ========================================================
  // DAFTAR FILE CONTOH DICOM DARI ASET
  // Menyediakan beberapa file DICOM contoh yang dapat dipilih pengguna.
  // ========================================================

  final List<String> assetFiles = [
    'assets/testing_web/ID_4af939e8d.dcm', // File contoh 1
    'assets/testing_web/ID_58e7e2e55.dcm', // File contoh 2
    'assets/testing_web/ID_cca25a801.dcm', // File contoh 3
  ];

  // ========================================================
  // WIDGET UNTUK MEMPERSIAPKAN UI
  // Widget ini membangun antarmuka pengguna untuk memilih file dan mengunggahnya.
  // ========================================================

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun antarmuka pengguna
    return Container( // Membuat kontainer
      height: 350, // Tinggi widget
      padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
      decoration: BoxDecoration( // Membuat dekorasi
        border: Border.all(color: const Color.fromARGB(255, 15, 18, 25)), // Garis batas
        borderRadius: BorderRadius.circular(20.0), // Radius sudut
        color: const Color(0xFF1B1E25), // Warna latar
      ),
      child: Column( // Membuat kolom
        children: [ 
          // ========================================================
          // BAGIAN MEMILIH FILE
          // Tampilkan tombol untuk memilih file jika belum ada file yang dipilih
          // ========================================================

          if (dicomFile == null)  // Jika belum ada file yang dipilih
            Align( 
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 100), // Spasi di atas
                  ElevatedButton( // Tombol untuk memilih file
                    onPressed: selectDicomFile, // Memanggil fungsi untuk memilih file
                    style: ElevatedButton.styleFrom( // Membuat gaya tombol
                      backgroundColor: Colors.orange, // Warna latar
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Padding di sekitar teks
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

          // ========================================================
          // BAGIAN MENAMPILKAN FILE YANG DIPILIH
          // Menampilkan nama file dan tombol untuk mengunggah atau menghapus
          // ========================================================

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
              onPressed: isLoading ? null : uploadDicomFile, // Mengunggah file
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: isLoading
                  ? const CircularProgressIndicator() // Tampilkan progress jika mengunggah
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
              onPressed: () => onFileRemoved(), // Menghapus file yang dipilih
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
          // ========================================================
          // BAGIAN FILE CONTOH
          // Menampilkan tombol untuk memilih file contoh dari aset
          // ========================================================

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
                  onPressed: () => loadDicomFromAsset(filePath), // Memilih file contoh dari aset
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                  child: Text(
                    filePath.split('/').last, // Nama file contoh
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
