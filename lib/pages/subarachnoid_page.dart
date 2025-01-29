import 'package:flutter/material.dart';

class SubarachnoidPage extends StatelessWidget {
  const SubarachnoidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subarachnoid Hemorrhage', style: TextStyle(color: Colors.white60)),
        backgroundColor: const Color(0xFF1B1E25),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Tooltip(
          message: 'Back to Home',
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1E25), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isNarrow = constraints.maxWidth < 800;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  if (isNarrow) ...[
                    const SubarachnoidTextContent(),
                    const SizedBox(height: 16),
                    const SubarachnoidImageSlider(),
                  ] else ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(flex: 1, child: SubarachnoidTextContent()),
                        SizedBox(width: 16),
                        Expanded(flex: 1, child: SubarachnoidImageSlider()),
                      ],
                    ),
                  ]
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class SubarachnoidTextContent extends StatelessWidget {
  const SubarachnoidTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(204, 36, 39, 48),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What is Subarachnoid Hemorrhage?',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          // ========================================================
          // Text Widget
          // Menampilkan deskripsi tentang Subarachnoid Hemorrhage
          // ========================================================
          Text('Subarachnoid hemorrhage (SAH) is the bleeding that occurs between the brain and the thin tissues covering it, known as the arachnoid membrane. The most common cause of SAH is the rupture of an aneurysm. Symptoms include sudden severe headache, nausea, vomiting, loss of consciousness, and in some cases, seizures. A SAH is a medical emergency that often requires surgical intervention to prevent further complications like stroke. Early treatment is essential for improving outcomes.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          // ========================================================
          // Text Widget
          // Menampilkan penjelasan mengenai lokasi SAH
          // ========================================================
          Text('Location:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Bleeding occurs in the subarachnoid space between the arachnoid mater and pia mater, where cerebrospinal fluid (CSF) circulates.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          // ========================================================
          // Text Widget
          // Menampilkan penjelasan tentang penyebab SAH
          // ========================================================
          Text('Causes:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('- Ruptured aneurysms are the most common cause (e.g., berry aneurysms).\n- Trauma, vascular malformations, or spontaneous bleeding due to high blood pressure.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          // ========================================================
          // Text Widget
          // Menampilkan karakteristik SAH
          // ========================================================
          Text('Characteristics:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('- Blood mixes with CSF, spreading throughout the subarachnoid space.\n- Visible on imaging as hyperdensity in basal cisterns and sulci.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          // ========================================================
          // Text Widget
          // Menampilkan gejala-gejala SAH
          // ========================================================
          Text('Symptoms:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('- Sudden, severe headache ("thunderclap headache"), nausea, vomiting, neck stiffness, and altered consciousness.\n- May lead to stroke or long-term complications like hydrocephalus.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class SubarachnoidImageSlider extends StatefulWidget {
  const SubarachnoidImageSlider({super.key});

  @override
  SubarachnoidImageSliderState createState() => SubarachnoidImageSliderState();
}

class SubarachnoidImageSliderState extends State<SubarachnoidImageSlider> {
  final PageController _pageController = PageController(); // Kontrol untuk berpindah antar halaman gambar
  int _currentIndex = 0; // Indeks gambar yang sedang ditampilkan
  List<String> imagePaths = [
    'assets/Subarachnoid1.jpg', // Lokasi gambar pertama
    'assets/Subarachnoid2.jpg', // Lokasi gambar kedua
    'assets/Subarachnoid3.jpg', // Lokasi gambar ketiga
    'assets/Subarachnoid4.jpg', // Lokasi gambar keempat
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(204, 25, 27, 32),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Example of Subarachnoid Hemorrhage',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(204, 36, 39, 48),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 600,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imagePaths.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.asset(
                        imagePaths[index],
                        width: double.infinity,
                        height: 600,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(imagePaths.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.white : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
              Positioned(
                left: 0,
                child: Tooltip(
                  message: 'Previous Image',
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white60),
                    onPressed: () {
                      if (_pageController.page != 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Tooltip(
                  message: 'Next Image',
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60),
                    onPressed: () {
                      if (_pageController.page != imagePaths.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
