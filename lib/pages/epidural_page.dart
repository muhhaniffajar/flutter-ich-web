import 'package:flutter/material.dart';

//================================================== Kelas EpiduralPage ==================================================\\
//================================================== untuk halaman informasi tentang Epidural Hemorrhage ==============================\\

class EpiduralPage extends StatelessWidget {
  const EpiduralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //======== AppBar =======================\\
      //===== untuk judul halaman dan navigasi kembali =====\\
      appBar: AppBar(
        title: const Text('Epidural Hemorrhage', style: TextStyle(color: Colors.white60)),
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
      //======== Body =========================\\
      //===== untuk konten utama halaman =====\\
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
              //======== LayoutBuilder ==============\\
              //===== untuk menentukan apakah layar lebar atau sempit =====\\
              bool isNarrow = constraints.maxWidth < 800;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  //======== Konten untuk layar sempit =====\\
                  //===== menampilkan teks dan slider gambar secara vertikal =====\\
                  if (isNarrow) ...[
                    const EpiduralTextContent(),
                    const SizedBox(height: 16),
                    const EpiduralImageSlider(),
                  ] 
                  //======== Konten untuk layar lebar =====\\
                  //===== menampilkan teks dan slider gambar secara horizontal =====\\
                  else ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(flex: 1, child: EpiduralTextContent()),
                        SizedBox(width: 16),
                        Expanded(flex: 1, child: EpiduralImageSlider()),
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

//================================================== Kelas EpiduralTextContent ==================================================\\
//================================================== untuk menampilkan informasi tentang Epidural Hemorrhage ==============================\\

class EpiduralTextContent extends StatelessWidget {
  const EpiduralTextContent({super.key});

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
          //======== Judul "What is Epidural Hemorrhage?" =====\\
          //===== untuk menampilkan judul bagian =====\\
          Text('What is Epidural Hemorrhage?',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          //======== Deskripsi Epidural Hemorrhage =====\\
          //===== untuk menampilkan deskripsi bagian =====\\
          Text('Epidural hemorrhage (EDH) refers to a collection of blood between the dura mater (the outermost membrane of the brain) and the skull. It is typically caused by a tear in the middle meningeal artery, often due to a traumatic head injury. Symptoms can include severe headache, nausea, vomiting, and loss of consciousness. Prompt medical attention is crucial for diagnosis and treatment.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white30,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          //======== Judul "Location" =====\\
          //===== untuk menampilkan judul bagian =====\\
          Text('Location:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          //======== Deskripsi Lokasi =====\\
          //===== untuk menampilkan deskripsi bagian =====\\
          Text('Bleeding occurs between the dura mater and the skull.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          //======== Judul "Causes" =====\\
          //===== untuk menampilkan judul bagian =====\\
          Text('Causes:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          //======== Deskripsi Penyebab =====\\
          //===== untuk menampilkan deskripsi bagian =====\\
          Text('- Traumatic brain injury (e.g., motor vehicle accidents, falls) leading to tearing of the middle meningeal artery.\n- Rarely, it can occur spontaneously in individuals with certain vascular conditions.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          //======== Judul "Characteristics" =====\\
          //===== untuk menampilkan judul bagian =====\\
          Text('Characteristics:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          //======== Deskripsi Karakteristik =====\\
          //===== untuk menampilkan deskripsi bagian =====\\
          Text('- Blood collects between the dura mater and the skull.\n- It is usually a result of a tear in the middle meningeal artery.',
            style: TextStyle(
              color: Colors.white30,
              fontSize: 18,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
          //======== Judul "Symptoms" =====\\
          //===== untuk menampilkan judul bagian =====\\
          Text('Symptoms:',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          //======== Deskripsi Gejala =====\\
          //===== untuk menampilkan deskripsi bagian =====\\
          Text('- Severe headache\n- Nausea and vomiting\n- Loss of consciousness\n- Stiff neck\n- Altered mental status',
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

//================================================== Kelas EpiduralImageSlider ==================================================\\
//================================================== untuk menampilkan slider gambar contoh Epidural Hemorrhage ==============================\\

class EpiduralImageSlider extends StatefulWidget {
  const EpiduralImageSlider({super.key});

  @override
  EpiduralImageSliderState createState() => EpiduralImageSliderState();
}

class EpiduralImageSliderState extends State<EpiduralImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<String> imagePaths = [
    'assets/epidural1.jpg',
    'assets/epidural2.jpg',
    'assets/epidural3.jpg',
    'assets/epidural4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //======== Judul Slider Gambar =====\\
        //===== untuk menampilkan judul slider gambar =====\\
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 23, 25, 30),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Example of Epidural Hemorrhage',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        //======== Kontainer Utama Slider Gambar =====\\
        //===== untuk menampilkan kontainer utama slider gambar =====\\
        Container(
          decoration: const BoxDecoration(
            color:  Color.fromARGB(255, 23, 25, 30),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //======== PageView untuk Gambar =====\\
              //===== untuk menampilkan gambar secara berurutan =====\\
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
              //======== Indikator Halaman =====\\
              //===== untuk menunjukkan halaman saat ini =====\\
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
              //======== Tombol Navigasi Sebelumnya =====\\
              //===== untuk navigasi ke gambar sebelumnya =====\\
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
              //======== Tombol Navigasi Berikutnya =====\\
              //===== untuk navigasi ke gambar berikutnya =====\\
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
