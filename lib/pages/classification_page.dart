import 'package:flutter/material.dart';
import '../components/upload_file.dart';
import '../components/display_heatmap.dart';
import '../components/display_processed.dart';
import '../components/display_prediction.dart';
import 'package:ich_web/main.dart';
import 'package:ich_web/l10n/app_localizations.dart';

class ClassificationPage extends StatefulWidget {
  const ClassificationPage({super.key});

  @override
  ClassificationPageState createState() => ClassificationPageState();
}

class ClassificationPageState extends State<ClassificationPage> with SingleTickerProviderStateMixin {
  dynamic dicomFile;
  bool isLoading = false;
  bool isClassified = false;
  Map<String, dynamic>? responseData;
  late ScrollController _scrollController;
  late AnimationController animationController;
  double _appBarOpacity = 1.0; // New variable to control AppBar opacity
  double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showUploadStartDialog(context);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double currentOffset = _scrollController.offset;
    if (currentOffset > _lastOffset && currentOffset > 0) {
      // Scrolling down
      setState(() {
        _appBarOpacity = 0.99; 
      });
    } else if (currentOffset < _lastOffset) {
      // Scrolling up
      setState(() {
        _appBarOpacity = 1.0; 
      });
    }
    if (currentOffset == 0) {
      setState(() {
        _appBarOpacity = 1.0; 
      });
    }
    _lastOffset = currentOffset;
  }

  void updateDicomFile(dynamic file) {
    setState(() {
      dicomFile = file;
    });
  }

  void updateResponse(Map<String, dynamic>? response) {
    setState(() {
      responseData = response;
    });
  }

  void onClassifyCompleted() {
    setState(() {
      isClassified = true;
    });
  }

  void _goToHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> showUploadStartDialog(BuildContext context) async {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final dialogWidth = screenWidth * 0.6; // 80% of the screen width

      return Dialog(
        backgroundColor: const Color(0xFF1B1E25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: dialogWidth,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppLocalizations.of(context).importantDiagnosticDisclaimer,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context).uploadAndClassificationDescription,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final containerHeight = screenHeight * 0.4;
    final isWideScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        leading: Tooltip(
          message: AppLocalizations.of(context).backToHome,
          child: IconButton(
            icon: const Icon(Icons.home, color: Colors.white60),
            onPressed: _goToHomePage,
          ),
        ),
        backgroundColor: Colors.transparent, // Set AppBar background to transparent
        elevation: 0,
        title: Text(
          AppLocalizations.of(context).appTitle,
          style: const TextStyle(color: Colors.white60),
        ),
        flexibleSpace: Opacity(
          opacity: _appBarOpacity,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1B1E25), // Use theme color
            ),
          ),
        ),
      ),
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
                                title: AppLocalizations.of(context).uploadDicomFile,
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
                                          title: AppLocalizations.of(context).heatmapDetection,
                                          child: isLoading
                                              ? const Center(
                                                  child: CircularProgressIndicator(color: Colors.white60),
                                                )
                                              : responseData != null
                                                  ? DisplayHeatmap(responseData: responseData!)
                                                  : _buildPlaceholder(AppLocalizations.of(context).noHeatmapGeneratedYet, height: containerHeight),
                                        ),
                                      ),
                                      const SizedBox(width: 16.0),
                                      Expanded(
                                        flex: 1,
                                        child: _buildContainer(
                                          title: AppLocalizations.of(context).processedImage,
                                          child: isLoading
                                              ? const Center(
                                                  child: CircularProgressIndicator(color: Colors.white60),
                                                )
                                              : responseData != null
                                                  ? DisplayProcessed(responseData: responseData!)
                                                  : _buildPlaceholder(AppLocalizations.of(context).noProcessedImageAvailable, height: containerHeight),
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      _buildContainer(
                                        title: AppLocalizations.of(context).heatmapDetection,
                                        child: isLoading
                                            ? const Center(
                                                child: CircularProgressIndicator(color: Colors.white60),
                                              )
                                            : responseData != null
                                                ? DisplayHeatmap(responseData: responseData!)
                                                : _buildPlaceholder(AppLocalizations.of(context).noHeatmapGeneratedYet, height: containerHeight),
                                      ),
                                      const SizedBox(height: 20),
                                      _buildContainer(
                                        title: AppLocalizations.of(context).processedImage,
                                        child: isLoading
                                            ? const Center(
                                                child: CircularProgressIndicator(color: Colors.white60),
                                              )
                                            : responseData != null
                                                ? DisplayProcessed(responseData: responseData!)
                                                : _buildPlaceholder(AppLocalizations.of(context).noProcessedImageAvailable, height: containerHeight),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 20),
                            _buildContainer(
                              title: AppLocalizations.of(context).classificationResult,
                              child: isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(color: Colors.white60),
                                    )
                                  : isClassified && responseData != null
                                      ? DisplayPrediction(responseData: responseData!)
                                      : _buildPlaceholder(AppLocalizations.of(context).noClassificationResultAvailable),
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
