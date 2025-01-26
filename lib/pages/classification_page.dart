// ========================================================  
// IMPORT PACKAGE DAN HALAMAN-HALAMAN  
// ========================================================  
import 'package:flutter/material.dart';  
import '../components/upload_file.dart';  
import '../components/display_heatmap.dart';  
import '../components/display_processed.dart';  
import '../components/display_prediction.dart';  
import 'package:ich_web/main.dart';  

// ========================================================  
// CLASSIFICATIONPAGE: HALAMAN UTAMA UNTUK KLASIFIKASI  
// ========================================================  
class ClassificationPage extends StatefulWidget {  
  const ClassificationPage({Key? key}) : super(key: key);  

  @override  
  ClassificationPageState createState() => ClassificationPageState();  
}  

// ========================================================  
// STATE CLASSIFICATIONPAGE  
// ========================================================  
class ClassificationPageState extends State<ClassificationPage> with SingleTickerProviderStateMixin {  
  dynamic dicomFile;  
  bool isLoading = false;  
  bool isClassified = false;  
  Map<String, dynamic>? responseData;  

  late ScrollController _scrollController;  
  late AnimationController animationController;  
  bool _isAppBarVisible = true;  
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
      if (_isAppBarVisible) {  
        setState(() {  
          _isAppBarVisible = false;  
        });  
        animationController.reverse();  
      }  
    } else if (currentOffset < _lastOffset) {  
      if (!_isAppBarVisible) {  
        setState(() {  
          _isAppBarVisible = true;  
        });  
        animationController.forward();  
      }  
    }  
    if (currentOffset == 0) {  
      if (!_isAppBarVisible) {  
        _isAppBarVisible = true;  
        animationController.forward();  
      }  
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

  @override  
  Widget build(BuildContext context) {  
    final screenHeight = MediaQuery.of(context).size.height;  
    final containerHeight = screenHeight * 0.4;  

    return Scaffold(  
      appBar: _isAppBarVisible  
          ? AppBar(  
              leading: Tooltip(  
                message: "Back to Home",  
                child: IconButton(  
                  icon: const Icon(Icons.home, color: Colors.white60),  
                  onPressed: _goToHomePage,  
                ),  
              ),  
              backgroundColor: const Color(0xFF1B1E25),  
              elevation: 0,  
              title: const Text(  
                'Intracranial Hemorrhage Classification',  
                style: TextStyle(color: Colors.white60),  
              ),  
            )  
          : null,  
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
                    child: Column(  
                      children: [  
                        Center(  
                          child: _buildContainer(  
                            title: 'Upload DICOM File',  
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
                        Row(  
                          crossAxisAlignment: CrossAxisAlignment.start,  
                          children: [  
                            Expanded(  
                              flex: 1,  
                              child: _buildContainer(  
                                title: 'HeatMap Detection',  
                                child: isLoading  
                                    ? const Center(  
                                        child: CircularProgressIndicator(color: Colors.white60),  
                                      )  
                                    : responseData != null  
                                        ? DisplayHeatmap(responseData: responseData!)  
                                        : _buildPlaceholder('No heatmap generated yet', height: containerHeight),  
                              ),  
                            ),  
                            const SizedBox(width: 16.0),  
                            Expanded(  
                              flex: 1,  
                              child: _buildContainer(  
                                title: 'Processed Image',  
                                child: isLoading  
                                    ? const Center(  
                                        child: CircularProgressIndicator(color: Colors.white60),  
                                      )  
                                    : responseData != null  
                                        ? DisplayProcessed(responseData: responseData!)  
                                        : _buildPlaceholder('No processed image available', height: containerHeight),  
                              ),  
                            ),  
                          ],  
                        ),  
                        const SizedBox(height: 20),  
                        _buildContainer(  
                          title: 'Classification Result',  
                          child: isLoading  
                              ? const Center(  
                                  child: CircularProgressIndicator(color: Colors.white60),  
                                )  
                              : isClassified && responseData != null  
                                  ? DisplayPrediction(responseData: responseData!)  
                                  : _buildPlaceholder('No Classification result available'),  
                        ),  
                      ],  
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
