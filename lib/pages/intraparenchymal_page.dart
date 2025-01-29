import 'package:flutter/material.dart';

//================================================== Kelas IntraparenchymalPage ==================================================\\
//================================================== untuk halaman utama informasi tentang Intraparenchymal Hemorrhage =============================\\
class IntraparenchymalPage extends StatelessWidget {
  const IntraparenchymalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intraparenchymal Hemorrhage', style: TextStyle(color: Colors.white60)),
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

//================================ Kelas IntraparenchymalTextContent ================================\\
//================================ untuk menampilkan informasi tentang Intraparenchymal Hemorrhage ==============================\\
class IntraparenchymalTextContent extends StatelessWidget {
  const IntraparenchymalTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 23, 25, 30),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What is Intraparenchymal Hemorrhage?',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text('Intraparenchymal hemorrhage (IPH) refers to bleeding that occurs within the brain tissue itself. It is typically caused by the rupture of small blood vessels within the brain parenchyma. Symptoms can include sudden headache, nausea, vomiting, and neurological deficits. IPH can be a serious condition requiring immediate medical attention.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white30,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          Text('Location:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Bleeding occurs within the brain tissue itself, typically in the white matter.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text('Causes:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('- Hypertension leading to the rupture of small blood vessels.\n- Cerebral amyloid angiography (CAA) in older adults.\n- Other conditions such as arteriovenous malformations (AVMs) or aneurysms.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text('Characteristics:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('- Blood is located within the brain parenchyma.\n- Can be detected on imaging studies such as CT scans or MRI.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          Text('Symptoms:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('- Sudden headache, often described as the "worst headache of life."\n- Nausea and vomiting.\n- Neurological deficits such as weakness, numbness, or speech difficulties.\n- Loss of consciousness in severe cases.',
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

//================================ Kelas IntraparenchymalImageSlider ================================\\
//================================ untuk menampilkan slider gambar contoh Intraparenchymal Hemorrhage ==============================\\
class IntraparenchymalImageSlider extends StatefulWidget {
  const IntraparenchymalImageSlider({super.key});

  @override
  IntraparenchymalImageSliderState createState() => IntraparenchymalImageSliderState();
}

class IntraparenchymalImageSliderState extends State<IntraparenchymalImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<String> imagePaths = [
    'assets/intraparenchymal1.jpg',
    'assets/intraparenchymal2.jpg',
    'assets/intraparenchymal3.jpg',
    'assets/intraparenchymal4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Judul slider gambar
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
          color:  Color.fromARGB(255, 23, 25, 30),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Example of Intraparenchymal Hemorrhage',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
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
              // Tombol navigasi ke gambar berikutnya
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
