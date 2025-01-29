import 'package:flutter/material.dart';

//================================================== Kelas SubduralPage ==================================================\\
//================================================== untuk halaman utama informasi tentang Subdural Hemorrhage ==================================================\\

class SubduralPage extends StatelessWidget {
  const SubduralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul dan navigasi kembali ke halaman utama
      appBar: AppBar(
        title: const Text('Subdural Hemorrhage', style: TextStyle(color: Colors.white60)),
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
                    const SubduralTextContent(),
                    const SizedBox(height: 16),
                    const SubduralImageSlider(),
                  ] 
                  // Jika layar lebar, tampilkan teks dan slider gambar secara horizontal
                  else ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(flex: 1, child: SubduralTextContent()),
                        SizedBox(width: 16),
                        Expanded(flex: 1, child: SubduralImageSlider()),
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

//================================================== Kelas SubduralTextContent ==================================================\\
//================================================== untuk menampilkan informasi tentang Subdural Hemorrhage ==================================================\\

class SubduralTextContent extends StatelessWidget {
  const SubduralTextContent({super.key});

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
          // Judul bagian "What is Subdural Hemorrhage?"
          Text('What is Subdural Hemorrhage?',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          // Deskripsi tentang Subdural Hemorrhage
          Text('Subdural hemorrhage (SDH) refers to a collection of blood between the dura mater (the outer protective layer of the brain) and the arachnoid layer. It is commonly caused by trauma to the head, leading to the rupture of blood vessels. Symptoms of subdural hemorrhage can include headaches, confusion, dizziness, and in severe cases, loss of consciousness. SDH can be classified into acute, subacute, and chronic, based on the duration between the injury and the appearance of symptoms. Prompt medical intervention is crucial for the treatment and management of subdural hemorrhages.',
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
          // Deskripsi tentang lokasi Subdural Hemorrhage
          Text('Bleeding occurs between the dura mater (the outermost meningeal layer) and the arachnoid mater.',
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
          // Deskripsi tentang penyebab Subdural Hemorrhage
          Text('- Traumatic brain injury (e.g., falls, motor vehicle accidents) leading to tearing of bridging veins.\n- In older adults or alcoholics, minor trauma can cause SDH due to brain atrophy, which stretches the veins.',
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
          // Deskripsi tentang karakteristik Subdural Hemorrhage
          Text('- Blood spreads along the brain surface and follows the contours of the brain (crescent-shaped on imaging).\n- It can be acute (sudden), subacute, or chronic (developing over weeks to months).',
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
          // Deskripsi tentang gejala Subdural Hemorrhage
          Text('- Acute SDH: Rapid onset of headache, altered consciousness, and focal neurological deficits.\n- Chronic SDH: Gradual headache, confusion, memory problems, or weakness.',
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

//================================================== Kelas SubduralImageSlider ==================================================\\
//================================================== untuk menampilkan slider gambar contoh Subdural Hemorrhage ==================================================\\

class SubduralImageSlider extends StatefulWidget {
  const SubduralImageSlider({super.key});

  @override
  SubduralImageSliderState createState() => SubduralImageSliderState();
}

class SubduralImageSliderState extends State<SubduralImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<String> imagePaths = [
    'assets/subdural1.jpg',
    'assets/subdural2.jpg',
    'assets/subdural3.jpg',
    'assets/subdural4.jpg',
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
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Example of Subdural Hemorrhage',
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
