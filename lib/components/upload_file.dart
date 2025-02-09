import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ich_web/l10n/app_localizations.dart';
import 'package:ich_web/service/api_service.dart'; // Import the ApiService

class UploadFile extends StatefulWidget {
  final dynamic dicomFile;
  final bool isLoading;
  final Function(dynamic) onFileSelected;
  final Function(Map<String, dynamic>?) onResponseReceived;
  final Function(bool) onLoadingStateChanged;
  final Function onClassifyCompleted;
  final Function onFileRemoved;

  const UploadFile({
    super.key,
    required this.dicomFile,
    required this.isLoading,
    required this.onFileSelected,
    required this.onResponseReceived,
    required this.onLoadingStateChanged,
    required this.onClassifyCompleted,
    required this.onFileRemoved,
  });

  @override
  UploadFileState createState() => UploadFileState();
}

class UploadFileState extends State<UploadFile> {
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Removed the call to showUploadStartDialog
  }

  Future<void> selectDicomFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['dcm'],
    );

    if (result != null && result.files.single.bytes != null) {
      widget.onFileSelected({
        'bytes': result.files.single.bytes,
        'name': result.files.single.name,
      });
    }
  }

  Future<void> uploadDicomFile(BuildContext context) async {
    if (widget.dicomFile == null) return;

    widget.onLoadingStateChanged(true);

    try {
      Map<String, dynamic>? response = await _apiService.uploadDicomFile(widget.dicomFile);

      if (response != null) {
        widget.onResponseReceived(response);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      widget.onLoadingStateChanged(false);
      widget.onClassifyCompleted();
    }
  }

  Future<void> loadDicomFromAsset(String filePath) async {
    try {
      Map<String, dynamic>? fileData = await _apiService.loadDicomFromAsset(filePath);

      if (fileData != null) {
        widget.onFileSelected(fileData);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading DICOM from assets: $e');
      }
    }
  }

  final List<String> assetFiles = [
    'assets/testing_web/ID_4af939e8d.dcm',
    'assets/testing_web/ID_58e7e2e55.dcm',
    'assets/testing_web/ID_cca25a801.dcm',
  ];

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
          if (widget.dicomFile == null)
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
                    child: Text(
                      AppLocalizations.of(context).selectDicomFile,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 58, 60, 63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (widget.dicomFile != null) ...[
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    print("File name clicked: ${widget.dicomFile['name']}");
                  }
                },
                child: Text(
                  '${AppLocalizations.of(context).fileSelected} ${widget.dicomFile['name']}',
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
              onPressed: widget.isLoading ? null : () => uploadDicomFile(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: widget.isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      AppLocalizations.of(context).uploadAndClassify,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 58, 60, 63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => widget.onFileRemoved(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text(
                AppLocalizations.of(context).removeFile,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          const Spacer(),
          Text(
            AppLocalizations.of(context).selectExampleDicomFile,
            style: const TextStyle(
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
