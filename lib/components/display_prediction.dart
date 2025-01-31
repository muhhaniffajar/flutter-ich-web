// ========================================================
// IMPOR LIBRARY
// Mengimpor pustaka yang diperlukan untuk membangun antarmuka pengguna aplikasi Flutter.
// Material.dart menyediakan berbagai widget UI dasar seperti AppBar, Scaffold, dll.
// ========================================================
import 'package:flutter/material.dart';

// ========================================================
// WIDGET UNTUK MENAMPILKAN HASIL PREDIKSI
// Widget ini menampilkan hasil prediksi yang diterima dari backend atau server.
// ========================================================
class DisplayPrediction extends StatelessWidget {
  // Parameter responseData berisi data hasil prediksi yang diterima
  final Map<String, dynamic>? responseData;

  // Konstruktor untuk menerima parameter responseData
  const DisplayPrediction({super.key, required this.responseData});

  @override
  Widget build(BuildContext context) {
    // Menyusun tampilan widget dengan menggunakan Column untuk menata komponen secara vertikal
    return Column(
      children: [
        // ========================================================
        // CONTAINER UNTUK MENAMPILKAN HASIL PREDIKSI
        // ========================================================
        Container(
          padding: const EdgeInsets.all(16.0), // Memberikan jarak dalam container
          decoration: BoxDecoration(
            color: const Color(0xFF1B1E25), // Mengatur warna latar belakang container
            borderRadius: BorderRadius.circular(20.0), // Membuat sudut melengkung pada container
          ),
          alignment: Alignment.center, // Menyusun konten agar berada di tengah
          child: responseData != null
              ? _buildPredictionContent(responseData!) // Menampilkan isi prediksi jika ada data
              : const DefaultMessage(), // Menampilkan pesan default jika data kosong
        ),
      ],
    );
  }

  // ========================================================
  // WIDGET UNTUK MENAMPILKAN ISI HASIL PREDIKSI
  // ========================================================
  Widget _buildPredictionContent(Map<String, dynamic> responseData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Menyusun konten secara terpusat
      children: [
        const SizedBox(height: 10), // Memberikan jarak vertikal
        // ========================================================
        // WIDGET UNTUK MENAMPILKAN TEKS "PREDICTION" DENGAN HASILNYA
        // ========================================================
        PredictionText(
          label: 'Prediction: ', // Label untuk hasil prediksi
          value: responseData['is_positive'] == true ? 'Positive' : 'Negative', // Menampilkan hasil prediksi
          valueColor: responseData['is_positive'] == true ? Colors.green.shade300 : Colors.red.shade300, // Menyesuaikan warna berdasarkan hasil
        ),
        const SizedBox(height: 30), // Memberikan jarak vertikal
        // ========================================================
        // HEADER UNTUK MENAMPILKAN DETAIL PREDIKSI
        // ========================================================
        const PredictionHeader(text: 'Prediction Details:'),
        const SizedBox(height: 8), // Memberikan jarak vertikal
        // ========================================================
        // JIKA TERSEDIA DATA KLASIFIKASI, MENAMPILKAN DETAILNYA
        // ========================================================
        if (responseData['classification'] != null)
          ClassificationDetails(classification: responseData['classification']), // Menampilkan detail klasifikasi
      ],
    );
  }
}

// ========================================================
// WIDGET UNTUK MENAMPILKAN PESAN DEFAULT
// Jika tidak ada data prediksi, widget ini menampilkan pesan default.
// ========================================================
class DefaultMessage extends StatelessWidget {
  const DefaultMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Classification result will display here', // Pesan default yang ditampilkan
      style: TextStyle(color: Colors.white), // Menyusun teks dengan warna putih
    );
  }
}

// ========================================================
// WIDGET UNTUK MENAMPILKAN TEKS "PREDICTION"
// ========================================================
class PredictionText extends StatelessWidget {
  final String label; // Label yang digunakan untuk hasil prediksi
  final String value; // Nilai hasil prediksi (Positive/Negative)
  final Color valueColor; // Warna teks berdasarkan hasil prediksi

  const PredictionText({
    super.key,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label, // Menampilkan label
            style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold), // Mengatur gaya teks label
          ),
          TextSpan(
            text: value, // Menampilkan nilai hasil prediksi
            style: TextStyle(
              color: valueColor, // Mengatur warna teks berdasarkan nilai
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// ========================================================
// WIDGET UNTUK MENAMPILKAN HEADER PREDIKSI
// ========================================================
class PredictionHeader extends StatelessWidget {
  final String text; // Teks header

  const PredictionHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // Menampilkan teks header
      style: const TextStyle(color: Colors.white, fontSize: 13), // Mengatur gaya teks header
    );
  }
}

// ========================================================
// WIDGET UNTUK MENAMPILKAN DETAIL KLASIFIKASI
// Menampilkan detail klasifikasi jika tersedia.
// ========================================================
class ClassificationDetails extends StatelessWidget {
  final Map<String, dynamic> classification; // Data klasifikasi

  const ClassificationDetails({super.key, required this.classification});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: classification.entries.map(
        (entry) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0), // Memberikan jarak antar elemen
          child: Text(
            '${entry.key}: ${entry.value.toStringAsFixed(4)}', // Menampilkan key dan value dari classification
            style: const TextStyle(color: Colors.white, fontSize: 12), // Mengatur gaya teks
          ),
        ),
      ).toList(),
    );
  }
}
