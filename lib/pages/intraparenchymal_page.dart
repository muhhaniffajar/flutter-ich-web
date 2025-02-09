import 'package:flutter/material.dart';
import 'package:ich_web/l10n/app_localizations.dart';

//================================================== Kelas Intraparenchymal Page ==================================================\\
//================================================== untuk halaman utama informasi tentang Intraparenchymal Hemorrhage ==================================================\\

class IntraparenchymalPage extends StatelessWidget {
  const IntraparenchymalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul dan navigasi kembali ke halaman utama
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).intraparenchymalHemorrhage, // Menggunakan terjemahan untuk judul AppBar
          style: const TextStyle(color: Colors.white60),
        ),
        backgroundColor: const Color(0xFF1B1E25),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Tooltip(
          message: AppLocalizations.of(context).backToHome, // Menggunakan terjemahan untuk tooltip
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      // Body halaman yang berisi konten dan slider gambar
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1B1E25), Color.fromARGB(255, 73, 73, 73)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Menentukan apakah layar lebar atau sempit berdasarkan lebar maksimum
              bool isNarrow = constraints.maxWidth < 800;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  // Jika layar sempit, tampilkan teks dan slider gambar secara vertikal
                  if (isNarrow) ...[
                    const IntraparenchymalTextContent(),
                    const SizedBox(height: 16),
                    const IntraparenchymalImageSlider(),
                  ] 
                  // Jika layar lebar, tampilkan teks dan slider gambar secara horizontal
                  else ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(flex: 1, child: IntraparenchymalTextContent()),
                        SizedBox(width: 16),
                        Expanded(flex: 1, child: IntraparenchymalImageSlider()),
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

//================================================== Kelas Intraparenchymal TextContent ==================================================\\
//================================================== untuk menampilkan informasi tentang Intraparenchymal Hemorrhage ==================================================\\

class IntraparenchymalTextContent extends StatelessWidget {
  const IntraparenchymalTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the lists of items for "Causes", "Characteristics", and "Symptoms"
    final List<String> causes = [
      AppLocalizations.of(context).intraparenchymalCause1,
      AppLocalizations.of(context).intraparenchymalCause2,
      AppLocalizations.of(context).intraparenchymalCause3,
    ];

    final List<String> characteristics = [
      AppLocalizations.of(context).intraparenchymalCharacteristic1,
      AppLocalizations.of(context).intraparenchymalCharacteristic2,
    ];

    final List<String> symptoms = [
      AppLocalizations.of(context).intraparenchymalSymptom1,
      AppLocalizations.of(context).intraparenchymalSymptom2,
      AppLocalizations.of(context).intraparenchymalSymptom3,
      AppLocalizations.of(context).intraparenchymalSymptom4,
    ];

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 23, 25, 30),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul bagian "What is Intraparenchymal Hemorrhage?"
          Text(
            AppLocalizations.of(context).whatIsIntraparenchymalHemorrhage, // Menggunakan terjemahan
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Deskripsi tentang Intraparenchymal Hemorrhage
          Text(
            AppLocalizations.of(context).intraparenchymalDescription, // Menggunakan terjemahan
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.white30,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          // Judul bagian "Location"
          Text(
            AppLocalizations.of(context).location, // Menggunakan terjemahan
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Deskripsi tentang lokasi Intraparenchymal Hemorrhage
          Text(
            AppLocalizations.of(context).intraparenchymalLocation, // Menggunakan terjemahan
            style: const TextStyle(
              color: Colors.white30,
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          // Judul bagian "Causes"
          Text(
            AppLocalizations.of(context).causes, // Menggunakan terjemahan
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // ListView.builder untuk menampilkan daftar penyebab
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: causes.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Text('•', style: TextStyle(fontSize: 30)),
                title: Text(
                  causes[index],
                  style: const TextStyle(
                    color: Colors.white30,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          // Judul bagian "Characteristics"
          Text(
            AppLocalizations.of(context).characteristics, // Menggunakan terjemahan
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // ListView.builder untuk menampilkan daftar karakteristik
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: characteristics.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Text('•', style: TextStyle(fontSize: 30)),
                title: Text(
                  characteristics[index],
                  style: const TextStyle(
                    color: Colors.white30,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          // Judul bagian "Symptoms"
          Text(
            AppLocalizations.of(context).symptoms, // Menggunakan terjemahan
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // ListView.builder untuk menampilkan daftar gejala
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: symptoms.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Text('•', style: TextStyle(fontSize: 30)),
                title: Text(
                  symptoms[index],
                  style: const TextStyle(
                    color: Colors.white30,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

//================================================== Kelas IntraparenchymalImageSlider ==================================================\\
//================================================== untuk menampilkan slider gambar contoh Intraparenchymal Hemorrhage ==================================================\\

class IntraparenchymalImageSlider extends StatefulWidget {
  const IntraparenchymalImageSlider({super.key});

  @override
 IntraparenchymalImageSliderState createState() => IntraparenchymalImageSliderState();
}

class IntraparenchymalImageSliderState extends State<IntraparenchymalImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<String> imagePaths = [
    'assets/Intraparenchymal1.jpg',
    'assets/Intraparenchymal2.jpg',
    'assets/Intraparenchymal3.jpg',
    'assets/Intraparenchymal4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Judul slider gambar
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 23, 25, 30),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context).exampleOfIntraparenchymalHemorrhage, // Menggunakan terjemahan
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Kontainer utama untuk slider gambar
        Container(
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 23, 25, 30),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // PageView untuk menampilkan gambar secara berurutan
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
              // Indikator halaman saat ini
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
              // Tombol navigasi ke gambar sebelumnya
              Positioned(
                left: 0,
                child: Tooltip(
                  message: AppLocalizations.of(context).previousImage, // Menggunakan terjemahan
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
              // Tombol navigasi ke gambar berikutnya
              Positioned(
                right: 0,
                child: Tooltip(
                  message: AppLocalizations.of(context).nextImage, // Menggunakan terjemahan
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
