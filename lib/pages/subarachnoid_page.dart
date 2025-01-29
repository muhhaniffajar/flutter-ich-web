import 'package:flutter/material.dart';

//================================================== Kelas SubarachnoidPage ==================================================\\
//================================================== untuk halaman utama informasi tentang Subarachnoid Hemorrhage =============================\\

class SubarachnoidPage extends StatelessWidget {
  const SubarachnoidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul dan navigasi kembali ke halaman utama
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
                    const SubarachnoidTextContent(),
                    const SizedBox(height: 16),
                    const SubarachnoidImageSlider(),
                  ] 
                  // Jika layar lebar, tampilkan teks dan slider gambar secara horizontal
                  else ...[
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

//================================================== Kelas SubarachnoidTextContent ==================================================\\
//================================================== untuk konten teks tentang Subarachnoid Hemorrhage =============================\\

class SubarachnoidTextContent extends StatelessWidget {
  const SubarachnoidTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 23, 25, 30),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul bagian "What is Subarachnoid Hemorrhage?"
          Text('What is Subarachnoid Hemorrhage?',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          // Deskripsi tentang Subarachnoid Hemorrhage
          Text('Subarachnoid hemorrhage (SAH) is a type of stroke that occurs when a blood vessel in the subarachnoid space (the space between the arachnoid membrane and the pia mater) bursts. This results in bleeding around the brain. Symptoms can include sudden, severe headache, nausea, vomiting, and loss of consciousness. Prompt medical attention is crucial for diagnosis and treatment.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white30,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          // Judul bagian "Location"
          Text('Location:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Deskripsi tentang lokasi Subarachnoid Hemorrhage
          Text('Bleeding occurs in the subarachnoid space, which is the area between the arachnoid membrane and the pia mater.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          // Judul bagian "Causes"
          Text('Causes:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Deskripsi tentang penyebab Subarachnoid Hemorrhage
          Text('- Rupture of an aneurysm (a bulge in a blood vessel).\n- Traumatic brain injury (e.g., falls, motor vehicle accidents).\n- Atherosclerosis (hardening of the arteries).\n- Congenital abnormalities of blood vessels.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          // Judul bagian "Characteristics"
          Text('Characteristics:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Deskripsi tentang karakteristik Subarachnoid Hemorrhage
          Text('- Sudden onset of severe headache, often described as "the worst headache of my life."\n- Nausea and vomiting.\n- Stiff neck.\n- Altered consciousness or loss of consciousness.\n- Sensitivity to light (photophobia).\n- Focal neurological deficits.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          // Judul bagian "Symptoms"
          Text('Symptoms:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Deskripsi tentang gejala Subarachnoid Hemorrhage
          Text('- Sudden, severe headache.\n- Nausea and vomiting.\n- Stiff neck.\n- Altered consciousness or loss of consciousness.\n- Sensitivity to light (photophobia).\n- Focal neurological deficits.',
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

//================================================== Kelas SubarachnoidImageSlider ==================================================\\
//================================================== untuk slider gambar tentang Subarachnoid Hemorrhage =============================\\

class SubarachnoidImageSlider extends StatefulWidget {
  const SubarachnoidImageSlider({super.key});

  @override
  SubarachnoidImageSliderState createState() => SubarachnoidImageSliderState();
}

class SubarachnoidImageSliderState extends State<SubarachnoidImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<String> imagePaths = [
    'assets/subarachnoid1.jpg',
    'assets/subarachnoid2.jpg',
    'assets/subarachnoid3.jpg',
    'assets/subarachnoid4.jpg',
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
              'Example of Subarachnoid Hemorrhage',
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
