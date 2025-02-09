import 'package:flutter/material.dart';
import 'package:ich_web/l10n/app_localizations.dart';
import 'package:ich_web/service/api_service.dart';

class DisplayHeatmap extends StatefulWidget {
  final Map<String, dynamic>? responseData;

  const DisplayHeatmap({super.key, required this.responseData});

  @override
  DisplayHeatmapState createState() => DisplayHeatmapState();
}

class DisplayHeatmapState extends State<DisplayHeatmap> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final List<dynamic>? inferences = widget.responseData?['inferences'];

    if (inferences == null || inferences.isEmpty) {
      return Center(child: Text(appLocalizations.noHeatmapDataAvailable));
    }

    final List<Widget> heatmapImages = _buildHeatmapImages(inferences, screenWidth, appLocalizations);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 15, 18, 25)),
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFF1B1E25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white60),
                  onPressed: _currentPage > 0
                      ? () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          )
                      : null,
                ),
                Expanded(
                  child: SizedBox(
                    height: screenWidth * 0.45 + 40,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: inferences.length,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemBuilder: (context, index) => Center(child: heatmapImages[index]),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60),
                  onPressed: _currentPage < heatmapImages.length - 1
                      ? () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          )
                      : null,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  heatmapImages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.white : Colors.white38,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildHeatmapImages(List<dynamic> inferences, double screenWidth, AppLocalizations appLocalizations) {
    final String baseUrl = ApiService.baseUrl; // Use baseUrl from ApiService

    return inferences.map((inference) {
      final String? heatmapPath = inference['heatmap'];
      final String? label = inference['label'];
      final String? confidence = inference['confidence'];

      if (heatmapPath == null || heatmapPath.isEmpty) return const SizedBox();

      final String fullImageUrl = '$baseUrl$heatmapPath';

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                fullImageUrl,
                width: screenWidth * 0.7,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, size: 48, color: Colors.red),
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                },
              ),
            ),
          ),
          if (label != null && confidence != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${appLocalizations.label}$label',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    '${appLocalizations.confidence}$confidence',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
        ],
      );
    }).toList();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
