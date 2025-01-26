// ========================================================
// IMPORT LIBRARIES
// Mengimpor berbagai library yang dibutuhkan untuk melakukan pembangunan antarmuka pengguna pada aplikasi Flutter. 
// Material.dart menyediakan komponen-komponen UI dasar yang digunakan dalam pengembangan aplikasi Flutter, seperti AppBar, Scaffold, dan lain-lain.
// ========================================================
import 'package:flutter/material.dart';

// ========================================================
// DISPLAY PREDICTION WIDGET
// Widget ini digunakan untuk menampilkan hasil prediksi yang diterima dari backend atau server.
// ========================================================

class DisplayPrediction extends StatelessWidget {
  // Menerima parameter responseData yang berisi data hasil prediksi yang diterima
  final Map<String, dynamic>? responseData;

  // Konstruktor untuk menerima parameter responseData
  const DisplayPrediction({Key? key, required this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menyusun tampilan widget dalam bentuk Column
    return Column(
      children: [
        // ========================================================
        // CONTAINER UNTUK MENAMPILKAN HASIL PREDIKSI DAN INFORMASI LAINNYA
        // ========================================================
        Container(
          padding: const EdgeInsets.all(16.0), // Padding di dalam container
          decoration: BoxDecoration(
            color: const Color(0xFF1B1E25), // Warna latar belakang container
            borderRadius: BorderRadius.circular(20.0), // Membuat sudut container melengkung
          ),
          alignment: Alignment.center, // Mengatur konten di dalam container agar terpusat
          child: responseData != null
              // ========================================================
              // JIKA responseData TIDAK NULL, MENAMPILKAN HASIL PREDIKSI
              // ========================================================
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Menyusun konten di tengah
                  children: [
                    const SizedBox(height: 10),
                    // ========================================================
                    // RICH TEXT UNTUK MENAMPILKAN TEKS "PREDICTION" DAN HASIL PREDIKSI
                    // ========================================================
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Prediction: ', // Teks label untuk hasil prediksi
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: responseData?['is_positive'] == true ? 'Positive' : 'Negative', // Menampilkan status positif atau negatif
                            style: TextStyle(
                              color: responseData?['is_positive'] == true ? Colors.green.shade300 : Colors.red.shade300,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // ========================================================
                    // MENAMPILKAN TEKS "PREDICTION DETAILS" SEBAGAI HEADER
                    // ========================================================
                    const Text(
                      'Prediction Details:',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    // ========================================================
                    // JIKA TERDAPAT DATA CLASSIFICATION, MENAMPILKAN NILAI KLASIFIKASINYA
                    // ========================================================
                    if (responseData?['classification'] != null)
                      ...responseData?['classification'].entries.map(
                        (entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            '${entry.key}: ${entry.value.toStringAsFixed(4)}', // Menampilkan key dan value dari classification
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      )
                          .toList(),
                  ],
                )
              // ========================================================
              // JIKA responseData NULL, MENAMPILKAN PESAN DEFAULT
              // ========================================================
              : const Text(
                  'Classification result will display here', // Pesan default saat tidak ada data prediksi
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ],
    );
  }
}
