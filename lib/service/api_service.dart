// api_service.dart

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/services.dart';

class ApiService {
  final Dio dio = Dio();

  // Base URL untuk API
  static const String baseUrl = 'https://mortality-campaigns-choir-pix.trycloudflare.com/image-model/';

  // Fungsi untuk mengunggah file DICOM
  Future<Map<String, dynamic>?> uploadDicomFile(Map<String, dynamic> dicomFile) async {
    try {
      FormData formData = FormData();
      formData.fields.add(const MapEntry('with_gradcam', 'true'));
      formData.fields.add(const MapEntry('with_windowing', 'true'));

      formData.files.add(MapEntry(
        'file',
        MultipartFile.fromBytes(dicomFile['bytes'], filename: dicomFile['name'], contentType: MediaType('application', 'dicom')),
      ));

      Response response = await dio.post(baseUrl, data: formData);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Gagal mengunggah file');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  // Fungsi untuk memuat file DICOM dari aset
  Future<Map<String, dynamic>?> loadDicomFromAsset(String filePath) async {
    try {
      final data = await rootBundle.load(filePath);
      return {
        'bytes': data.buffer.asUint8List(),
        'name': filePath.split('/').last,
      };
    } catch (e) {
      print('Error memuat DICOM dari aset: $e');
      return null;
    }
  }
}
