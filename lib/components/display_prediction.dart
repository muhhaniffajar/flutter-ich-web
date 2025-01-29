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
  const DisplayPrediction({super.key, required this.responseData});

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
              ? _buildPredictionContent(responseData!)
              : const DefaultMessage(),
        ),
      ],
    );
  }

  // ========================================================
  // WIDGET UNTUK MENAMPILKAN ISI HASIL PREDIKSI
  // ========================================================
  Widget _buildPredictionContent(Map<String, dynamic> responseData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Menyusun konten di tengah
      children: [
        const SizedBox(height: 10),
        // ========================================================
        // RICH TEXT UNTUK MENAMPILKAN TEKS "PREDICTION" DAN HASIL PREDIKSI
        // ========================================================
        PredictionText(
          label: 'Prediction: ',
          value: responseData['is_positive'] == true ? 'Positive' : 'Negative',
          valueColor: responseData['is_positive'] == true ? Colors.green.shade300 : Colors.red.shade300,
        ),
        const SizedBox(height: 30),
        // ========================================================
        // MENAMPILKAN TEKS "PREDICTION DETAILS" SEBAGAI HEADER
        // ========================================================
        const PredictionHeader(text: 'Prediction Details:'),
        const SizedBox(height: 8),
        // ========================================================
        // JIKA TERDAPAT DATA CLASSIFICATION, MENAMPILKAN NILAI KLASIFIKASINYA
        // ========================================================
        if (responseData['classification'] != null)
          ClassificationDetails(classification: responseData['classification']),
      ],
    );
  }
}

// ========================================================
// WIDGET UNTUK MENAMPILKAN PESAN DEFAULT
// ========================================================
class DefaultMessage extends StatelessWidget {
  const DefaultMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Classification result will display here', // Pesan default saat tidak ada data prediksi
      style: TextStyle(color: Colors.white),
    );
  }
}

// ========================================================
// WIDGET UNTUK MENAMPILKAN TEKS PREDIKSI
// ========================================================
class PredictionText extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

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
            text: label, // Teks label untuk hasil prediksi
            style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value, // Menampilkan status positif atau negatif
            style: TextStyle(
              color: valueColor,
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
  final String text;

  const PredictionHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 13),
    );
  }
}

// ========================================================
// WIDGET UNTUK MENAMPILKAN DETAIL KLASIFIKASI
// ========================================================
class ClassificationDetails extends StatelessWidget {
  final Map<String, dynamic> classification;

  const ClassificationDetails({super.key, required this.classification});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: classification.entries.map(
        (entry) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
            '${entry.key}: ${entry.value.toStringAsFixed(4)}', // Menampilkan key dan value dari classification
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ).toList(),
    );
  }
}
