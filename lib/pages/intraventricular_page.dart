import 'package:flutter/material.dart';

//================================================== Kelas IntraventricularPage ==================================================\\
//================================================== untuk halaman utama informasi tentang Intraventricular Hemorrhage =============================\\
class IntraventricularPage extends StatelessWidget {
  const IntraventricularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intraventricular Hemorrhage', style: TextStyle(color: Colors.white60)),
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
                    const IntraventricularTextContent(),
                    const SizedBox(height: 16),
                    const IntraventricularImageSlider(),
                  ] 
                  // Jika layar lebar, tampilkan teks dan slider gambar secara horizontal
                  else ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(flex: 1, child: IntraventricularTextContent()),
                        SizedBox(width: 16),
                        Expanded(flex: 1, child: IntraventricularImageSlider()),
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

//================================================== Kelas IntraventricularTextContent ==================================================\\
//================================================== untuk konten teks tentang Intraventricular Hemorrhage =============================\\
class IntraventricularTextContent extends StatelessWidget {
  const IntraventricularTextContent({super.key});

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
          Text('What is Intraventricular Hemorrhage?',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text('Intraventricular hemorrhage (IVH) refers to bleeding that occurs within the ventricular system of the brain. It is commonly associated with conditions such as aneurysms, arteriovenous malformations (AVMs), and head trauma. Symptoms can include sudden headache, nausea, vomiting, and neurological deficits. IVH can be classified into grades I to IV based on the extent of bleeding and the presence of ventricular enlargement.',
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
          Text('Bleeding occurs within the ventricular system of the brain, including the lateral ventricles, third ventricle, and fourth ventricle.',
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
          Text('- Aneurysms\n- Arteriovenous malformations (AVMs)\n- Head trauma\n- Hypertension\n- Coagulopathy',
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
          Text('- Blood accumulates within the ventricular system.\n- Can cause ventricular enlargement and increased intracranial pressure.\n- Classified into grades I to IV based on the extent of bleeding and ventricular enlargement.',
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
          Text('- Sudden headache\n- Nausea and vomiting\n- Neurological deficits\n- Altered consciousness\n- Seizures',
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

//================================================== Kelas IntraventricularImageSlider ==================================================\\
//================================================== untuk slider gambar tentang Intraventricular Hemorrhage =============================\\
class IntraventricularImageSlider extends StatefulWidget {
  const IntraventricularImageSlider({super.key});

  @override
  IntraventricularImageSliderState createState() => IntraventricularImageSliderState();
}

class IntraventricularImageSliderState extends State<IntraventricularImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<String> imagePaths = [
    'assets/intraventricular1.jpg',
    'assets/intraventricular2.jpg',
    'assets/intraventricular3.jpg',
    'assets/intraventricular4.jpg',
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
              'Example of Intraventricular Hemorrhage',
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
