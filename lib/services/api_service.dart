// // ========================================================
// // IMPORT LIBRARIES
// // Mengimpor berbagai library yang dibutuhkan untuk melakukan HTTP request, memilih file, 
// // menangani tipe media file, dan mencatat log informasi/error.
// // ========================================================

// import 'package:dio/dio.dart'; // Dio digunakan untuk melakukan HTTP request
// import 'package:file_picker/file_picker.dart'; // file_picker untuk memilih file DICOM
// import 'package:path/path.dart'; // Digunakan untuk mengelola nama dan path file
// import 'package:http_parser/http_parser.dart'; // Untuk mengatur tipe konten file dalam request multipart
// import 'package:logger/logger.dart'; // Logger digunakan untuk mencatat informasi dan error


// // ========================================================
// // KELAS APISERVICE
// // ApiService adalah kelas yang menangani permintaan untuk mengklasifikasikan gambar DICOM
// // dan berinteraksi dengan API eksternal untuk melakukan pengolahan gambar.
// // ========================================================

// class ApiService {
//   static const String baseUrl = "https://mortality-campaigns-choir-pix.trycloudflare.com"; // URL API untuk klasifikasi gambar
//   static var logger = Logger(); // Logger statis untuk mencatat log informasi/error


//   // ========================================================
//   // METODE CLASSIFYIMAGE()
//   // Metode ini digunakan untuk mengklasifikasikan gambar DICOM dengan mengirimkan file yang dipilih ke API.
//   // Menggunakan Dio untuk mengirimkan data gambar dalam format multipart.
//   // ========================================================

//   static Future<void> classifyImage() async {
//     final dio = Dio(); // Membuat instance Dio untuk HTTP request
//     const url = '$baseUrl/image-model/?with_gradcam=true&with_windowing=true'; // URL API yang digunakan untuk klasifikasi

//     // ========================================================
//     // MEMILIH FILE DICOM
//     // Menggunakan file_picker untuk memilih file DICOM dari perangkat pengguna.
//     // Hanya file dengan ekstensi '.dcm' yang diperbolehkan untuk dipilih.
//     // ========================================================

//     final result = await FilePicker.platform.pickFiles(
//       allowedExtensions: ['dcm'], // Hanya file dengan ekstensi DICOM yang diizinkan
//       type: FileType.custom, // Mengizinkan pemilihan file dengan ekstensi khusus
//     );

//     // ========================================================
//     // VALIDASI FILE DICOM
//     // Memastikan bahwa file yang dipilih oleh pengguna memiliki ekstensi yang valid yaitu '.dcm'.
//     // Jika file valid, akan dilanjutkan dengan pengiriman file ke API.
//     // ========================================================

//     if (result != null) {
//       final file = result.files.first; // Mengambil file pertama yang dipilih
//       if (file.name.endsWith('.dcm')) { // Memastikan file adalah DICOM

//         // ========================================================
//         // MENYIAPKAN FORM DATA DAN MULTIPART REQUEST
//         // Menyiapkan data untuk dikirimkan dalam format multipart/form-data, termasuk file DICOM
//         // dan parameter tambahan seperti 'with_gradcam' dan 'with_windowing'.
//         // ========================================================

//         FormData formData = FormData(); // Membuat FormData untuk mengirimkan data dalam request multipart
//         formData.fields.add(const MapEntry('with_gradcam', 'true')); // Menambahkan parameter 'with_gradcam'
//         formData.fields.add(const MapEntry('with_windowing', 'true')); // Menambahkan parameter 'with_windowing'
//         formData.files.add(MapEntry(
//           'file',
//           MultipartFile.fromBytes(file.bytes!, filename: basename(file.name), contentType: MediaType('application', 'dicom')),
//         ));

//         // ========================================================
//         // MENGIRIM HTTP REQUEST
//         // Mengirimkan data yang telah disiapkan melalui HTTP POST ke API untuk klasifikasi gambar.
//         // Mencatat status respons apakah berhasil atau terjadi kesalahan.
//         // ========================================================

//         try {
//           Response response = await dio.post(url, data: formData); // Mengirimkan POST request dengan data form
//           if (response.statusCode == 200) {
//             logger.i("Upload successful!"); // Jika sukses, mencatat log
//           } else {
//             logger.e("Error: ${response.statusCode}"); // Jika gagal, mencatat status error
//           }
//         } catch (e) {
//           logger.e("Upload failed: $e"); // Mencatat error jika pengiriman file gagal
//         }

//       } else {
//         // ========================================================
//         // MENANGANI FILE TIDAK VALID
//         // Jika file yang dipilih tidak berformat DICOM atau tidak sesuai dengan ketentuan.
//         // ========================================================
//         logger.e("Error: The selected file is not a valid DICOM file."); // Log jika file bukan DICOM
//       }
//     } else {
//       // ========================================================
//       // MENANGANI TIDAK ADA FILE YANG DIPILIH
//       // Jika pengguna tidak memilih file apapun, mencatat pesan peringatan.
//       // ========================================================
//       logger.w("No file selected."); // Log jika tidak ada file yang dipilih
//     }
//   }
// }
