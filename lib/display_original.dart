// // ========================================================
// // IMPORT LIBRARIES
// // Mengimpor berbagai library yang dibutuhkan untuk melakukan pembangunan antarmuka pengguna pada aplikasi Flutter. 
// // Material.dart menyediakan komponen-komponen UI dasar yang digunakan dalam pengembangan aplikasi Flutter, seperti AppBar, Scaffold, dan lain-lain.
// // ========================================================
// import 'package:flutter/material.dart';

// class DisplayOriginal extends StatelessWidget {
//   // ========================================================
//   // MENERIMA PARAMETER DICOMFILE DAN ISLOADING
//   // - dicomFile: Data file DICOM yang dipilih oleh pengguna.
//   // - isLoading: Status pemuatan file, menunjukkan apakah file sedang dimuat.
//   // ========================================================
//   final dynamic dicomFile;
//   final bool isLoading;

//   // ========================================================
//   // KONSTRUKTOR UNTUK MENERIMA KEDUA PARAMETER
//   // - dicomFile dan isLoading akan diinisialisasi melalui konstruktor
//   // ========================================================
//   const DisplayOriginal({Key? key, required this.dicomFile, required this.isLoading}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // ========================================================
//     // MEMERIKSA APAKAH dicomFile TIDAK NULL
//     // Jika dicomFile tidak null, tampilkan informasi file DICOM
//     // ========================================================
//     return dicomFile != null
//         ? Container(
//             height: 80, // Mengatur tinggi container untuk menampilkan informasi
//             padding: const EdgeInsets.all(16.0), // Padding di dalam container
//             decoration: BoxDecoration(
//               color: const Color(0xFF1B1E25), // Warna latar belakang container
//               borderRadius: BorderRadius.circular(20.0), // Sudut container yang melengkung
//             ),
//             alignment: Alignment.center, // Menyusun konten di tengah container
//             child: isLoading
//                 // ========================================================
//                 // JIKA STATUS LOADING TRUE, TAMPILKAN INDIKATOR LOADING (SPINNER)
//                 // ========================================================
//                 ? const Center(child: CircularProgressIndicator())
//                 // ========================================================
//                 // JIKA TIDAK SEDANG LOADING, TAMPILKAN NAMA FILE DICOM
//                 // ========================================================
//                 : Text(
//                     'File Selected: ${dicomFile['name']}', // Nama file DICOM ditampilkan
//                     style: const TextStyle(color: Colors.white, fontSize: 16), // Gaya teks yang digunakan
//                   ),
//           )
//         // ========================================================
//         // JIKA dicomFile NULL, TAMPILKAN PESAN "No original DICOM file available"
//         // ========================================================
//         : const Center(child: Text('No original DICOM file available', style: TextStyle(color: Colors.white60)));
//   }
// }
