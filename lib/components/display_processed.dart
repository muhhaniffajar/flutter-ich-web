import 'package:flutter/material.dart';
import 'package:ich_web/l10n/app_localizations.dart';
import 'package:ich_web/service/api_service.dart';

class DisplayProcessed extends StatefulWidget {
  final Map<String, dynamic>? responseData;

  const DisplayProcessed({super.key, required this.responseData});

  @override
  DisplayProcessedState createState() => DisplayProcessedState();
}

class DisplayProcessedState extends State<DisplayProcessed> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final appLocalizationss = AppLocalizationss.of(context);
    final String baseUrl = ApiService.baseUrl; // Use baseUrl from ApiService
    final screenWidth = MediaQuery.of(context).size.width;

    final String? imagePath = widget.responseData?['processed_image']?['brain_window'];
    final String? imagePath2 = widget.responseData?['processed_image']?['subdural_window'];
    final String? imagePath3 = widget.responseData?['processed_image']?['soft_window'];
    final String? imagePath4 = widget.responseData?['processed_image']?['stacked'];

    final List<Widget> images = [];
    if (imagePath != null) {
      final String fullImageUrl = '$baseUrl$imagePath';
      images.add(_buildImage('Brain Window', fullImageUrl));
    }
    if (imagePath2 != null) {
      final String fullImageUrl = '$baseUrl$imagePath2';
      images.add(_buildImage('Subdural Window', fullImageUrl));
    }
    if (imagePath3 != null) {
      final String fullImageUrl = '$baseUrl$imagePath3';
      images.add(_buildImage('Soft Window', fullImageUrl));
    }
    if (imagePath4 != null) {
      final String fullImageUrl = '$baseUrl$imagePath4';
      images.add(_buildImage('Stacked Window', fullImageUrl));
    }

    if (images.isEmpty) {
      return Center(child: Text(appLocalizationss.noImagesAvailable));
    }

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
                      itemCount: images.length,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemBuilder: (context, index) => Center(child: images[index]),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60),
                  onPressed: _currentPage < images.length - 1
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
                  images.length,
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

  Widget _buildImage(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width * 0.7,
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
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
