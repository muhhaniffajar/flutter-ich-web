// ========================================================
// IMPORT LIBRARIES
// Mengimpor berbagai library yang dibutuhkan untuk melakukan pembangunan antarmuka pengguna pada aplikasi Flutter. 
// Material.dart menyediakan komponen-komponen UI dasar yang digunakan dalam pengembangan aplikasi Flutter, seperti AppBar, Scaffold, dan lain-lain.
// ========================================================
import 'package:flutter/material.dart';
import 'pages/classification_page.dart';
import 'pages/subdural_page.dart';
import 'pages/epidural_page.dart';
import 'pages/intraparenchymal_page.dart';
import 'pages/intraventricular_page.dart';
import 'pages/subarachnoid_page.dart';

// ========================================================
// MAIN FUNCTION
// Fungsi utama yang menjadi titik awal eksekusi aplikasi Flutter. 
// Fungsi ini menjalankan aplikasi dengan memanggil MyApp sebagai widget utama.
// ========================================================
void main() {
  runApp(const MyApp());
}

// ========================================================
// MYAPP CLASS
// Kelas MyApp adalah widget Stateless yang berfungsi sebagai aplikasi utama. 
// Kelas ini mengatur MaterialApp dan halaman awal yang akan ditampilkan.
// ========================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug.
      home: MainPage(), // Menetapkan MainPage sebagai halaman awal.
    );
  }
}

// ========================================================
// HEMORRHAGE TYPE CLASS
// Kelas HemorrhageType digunakan untuk menyimpan data tentang jenis-jenis hemorrhage.
// Kelas ini memiliki atribut title, image, dan page yang merepresentasikan informasi hemorrhage.
// ========================================================
class HemorrhageType {
  final String title; // Judul hemorrhage.
  final String image; // Path gambar untuk hemorrhage.
  final Widget page; // Halaman yang akan ditampilkan saat hemorrhage dipilih.

  const HemorrhageType({
    required this.title,
    required this.image,
    required this.page,
  });
}

// ========================================================
// DATA HEMORRHAGE TYPES
// Daftar hemorrhageTypes berisi berbagai jenis hemorrhage beserta informasi terkaitnya.
// Setiap jenis hemorrhage memiliki judul, gambar, dan halaman yang sesuai.
// ========================================================
final List<HemorrhageType> hemorrhageTypes = [
  HemorrhageType(
    title: 'Subdural Hemorrhage',
    image: 'assets/ID_9adc40048_Subdural.jpg',
    page: const SubduralPage(),
  ),
  HemorrhageType(
    title: 'Epidural Hemorrhage',
    image: 'assets/ID_f26667baf_Epidural.jpg',
    page: const EpiduralPage(),
  ),
  HemorrhageType(
    title: 'Intraparenchymal Hemorrhage',
    image: 'assets/ID_cbe5d2ed7_Intraparenchymal.jpg',
    page: const IntraparenchymalPage(),
  ),
  HemorrhageType(
    title: 'Intraventricular Hemorrhage',
    image: 'assets/ID_a8936e0de_Intraventricular.jpg',
    page: const IntraventricularPage(),
  ),
  HemorrhageType(
    title: 'Subarachnoid Hemorrhage',
    image: 'assets/ID_d5ab7d884_Subarachnoid.jpg',
    page: const SubarachnoidPage(),
  ),
];

// ========================================================
// MAIN PAGE CLASS
// Kelas MainPage adalah widget Stateless yang berfungsi sebagai halaman utama aplikasi.
// Halaman ini menampilkan AppBar dan EducationPage sebagai konten utama.
// ========================================================
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1E25), // Warna latar belakang AppBar.
        iconTheme: const IconThemeData(color: Colors.white60), // Warna ikon di AppBar.
        actions: <Widget>[
          ClassificationButton(context), // Menambahkan tombol klasifikasi di AppBar.
        ],
      ),
      body: const EducationPage(), // Menetapkan EducationPage sebagai konten utama.
    );
  }
}

// ========================================================
// CLASSIFICATION BUTTON WIDGET
// Widget untuk tombol klasifikasi yang mengarahkan pengguna ke halaman klasifikasi.
// Menggunakan Tooltip untuk memberikan informasi tambahan saat pengguna mengarahkan kursor ke tombol.
// ========================================================
class ClassificationButton extends StatelessWidget {
  final BuildContext parentContext; // Konteks dari halaman induk.

  const ClassificationButton(this.parentContext, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Go to ICH classification', // Pesan tooltip yang ditampilkan.
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0), // Padding di sebelah kanan.
        child: IconButton(
          icon: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.control_point_sharp, color: Colors.white60), // Ikon tombol.
              SizedBox(width: 8), // Jarak antara ikon dan teks.
              Text(
                'Classification',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          onPressed: () {
            // Navigasi ke halaman klasifikasi saat tombol ditekan.
            Navigator.push(
              parentContext,
              MaterialPageRoute(builder: (context) => const ClassificationPage()),
            );
          },
        ),
      ),
    );
  }
}

// ========================================================
// EDUCATION PAGE CLASS
// Kelas EducationPage adalah widget Stateful yang menampilkan konten edukasi tentang hemorrhage.
// Halaman ini dapat menyesuaikan tampilan berdasarkan ukuran layar.
// ========================================================
class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  EducationPageState createState() => EducationPageState();
}

// ========================================================
// EDUCATION PAGE STATE CLASS
// State untuk EducationPage yang mengelola logika dan status halaman.
// Menggunakan ScrollController untuk mengontrol scroll pada konten.
// ========================================================
class EducationPageState extends State<EducationPage> {
  final ScrollController _scrollController = ScrollController(); // Controller untuk scroll.

  // ========================================================
  // SCROLL LEFT METHOD
  // Metode untuk menggulir konten ke kiri dengan animasi.
// ========================================================
  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 155, // Mengurangi offset untuk scroll ke kiri.
      duration: const Duration(milliseconds: 500), // Durasi animasi.
      curve: Curves.easeInOut, // Kurva animasi.
    );
  }

  // ========================================================
  // SCROLL RIGHT METHOD
  // Metode untuk menggulir konten ke kanan dengan animasi.
// ========================================================
  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 155, // Menambah offset untuk scroll ke kanan.
      duration: const Duration(milliseconds: 500), // Durasi animasi.
      curve: Curves.easeInOut, // Kurva animasi.
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 800; // Menentukan apakah layar kecil.
        return Container(
          width: double.infinity, // Lebar kontainer penuh.
          height: double.infinity, // Tinggi kontainer penuh.
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1B1E25), // Warna awal gradien.
                Color.fromARGB(255, 73, 73, 73), // Warna akhir gradien.
              ],
              begin: Alignment.topCenter, // Titik awal gradien.
              end: Alignment.bottomCenter, // Titik akhir gradien.
            ),
          ),
          child: isSmallScreen 
              ? EducationContentColumn(
                  scrollController: _scrollController, // Mengirimkan controller scroll.
                  onScrollLeft: _scrollLeft, // Mengirimkan metode scroll kiri.
                  onScrollRight: _scrollRight, // Mengirimkan metode scroll kanan.
                )
              : EducationContentRow(
                  scrollController: _scrollController, // Mengirimkan controller scroll.
                  onScrollLeft: _scrollLeft, // Mengirimkan metode scroll kiri.
                  onScrollRight: _scrollRight, // Mengirimkan metode scroll kanan.
                ),
        );
      },
    );
  }
}

// ========================================================
// EDUCATION CONTENT COLUMN WIDGET
// Widget untuk menampilkan konten edukasi dalam format kolom.
// Menggunakan SingleChildScrollView untuk memungkinkan scroll vertikal.
// ========================================================
class EducationContentColumn extends StatelessWidget {
  final ScrollController scrollController; // Controller untuk scroll.
  final VoidCallback onScrollLeft; // Callback untuk scroll kiri.
  final VoidCallback onScrollRight; // Callback untuk scroll kanan.

  const EducationContentColumn({
    required this.scrollController,
    required this.onScrollLeft,
    required this.onScrollRight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0), // Padding di sekitar konten.
      child: Column(
        children: [
          EducationText(), // Menampilkan teks edukasi.
          HemorrhageTypesList(
            onScrollLeft: onScrollLeft, // Mengirimkan metode scroll kiri.
            onScrollRight: onScrollRight, // Mengirimkan metode scroll kanan.
          ),
          const StartClassificationButton(), // Menampilkan tombol mulai klasifikasi.
          EducationImage(height: MediaQuery.of(context).size.height * 0.7), // Menampilkan gambar edukasi.
        ],
      ),
    );
  }
}

// ========================================================
// EDUCATION CONTENT ROW WIDGET
// Widget untuk menampilkan konten edukasi dalam format baris.
// Menggunakan SingleChildScrollView untuk memungkinkan scroll vertikal.
// ========================================================
class EducationContentRow extends StatelessWidget {
  final ScrollController scrollController; // Controller untuk scroll.
  final VoidCallback onScrollLeft; // Callback untuk scroll kiri.
  final VoidCallback onScrollRight; // Callback untuk scroll kanan.

  const EducationContentRow({
    required this.scrollController,
    required this.onScrollLeft,
    required this.onScrollRight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1, // Mengatur proporsi lebar kolom.
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0), // Padding di sekitar konten.
            child: Column(
              children: [
                EducationText(), // Menampilkan teks edukasi.
                HemorrhageTypesList(
                  onScrollLeft: onScrollLeft, // Mengirimkan metode scroll kiri.
                  onScrollRight: onScrollRight, // Mengirimkan metode scroll kanan.
                ),
                const StartClassificationButton(), // Menampilkan tombol mulai klasifikasi.
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1, // Mengatur proporsi lebar kolom.
          child: EducationImage(height: MediaQuery.of(context).size.height * 0.7), // Menampilkan gambar edukasi.
        ),
      ],
    );
  }
}

// ========================================================
// EDUCATION TEXT WIDGET
// Widget untuk menampilkan teks edukasi tentang hemorrhage.
// Menyediakan informasi dasar tentang intracranial hemorrhage.
// ========================================================
class EducationText extends StatelessWidget {
  const EducationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 50), // Jarak atas.
        Text(
          'Intracranial Hemorrhage Classification',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20), // Jarak antara judul dan teks berikutnya.
        Text(
          'What is Intracranial Hemorrhage?',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10), // Jarak antara judul dan teks berikutnya.
        SingleChildScrollView(
          child: Text(
            'Intracranial hemorrhage (ICH) is a general term for bleeding inside the skull. It encompasses all types of brain bleeds, including subdural, intraparenchymal, intraventricular, subarachnoid, and epidural hemorrhages. ICH is commonly caused by trauma, high blood pressure, blood vessel abnormalities, or aneurysms. The symptoms of ICH vary depending on the location and severity of the bleed, and can range from headaches and dizziness to loss of consciousness or death. Prompt medical attention is required to manage ICH, and the treatment approach depends on the cause, type, and severity of the hemorrhage.',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.justify, // Menyelaraskan teks.
            softWrap: true, // Memungkinkan teks untuk berlanjut ke baris berikutnya.
            overflow: TextOverflow.visible, // Mengatur bagaimana teks yang melebihi batas ditampilkan.
          ),
        ),
        SizedBox(height: 40), // Jarak antara teks dan bagian berikutnya.
        Text(
          'Types of Intracranial Hemorrhage',
          style: TextStyle(
            color: Colors.white60,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16), // Jarak antara judul dan teks berikutnya.
      ],
    );
  }
}

// ========================================================
// HEMORRHAGE TYPES LIST WIDGET
// Stateful widget untuk menampilkan daftar jenis hemorrhage dengan pagination.
// Memungkinkan pengguna untuk menggulir melalui jenis hemorrhage yang berbeda.
// ========================================================
class HemorrhageTypesList extends StatefulWidget {
  final VoidCallback onScrollLeft; // Callback untuk scroll kiri.
  final VoidCallback onScrollRight; // Callback untuk scroll kanan.

  const HemorrhageTypesList({
    required this.onScrollLeft,
    required this.onScrollRight,
    super.key,
  });

  @override
  State<HemorrhageTypesList> createState() => _HemorrhageTypesListState();
}

// ========================================================
// HEMORRHAGE TYPES LIST STATE CLASS
// State untuk HemorrhageTypesList yang mengelola logika pagination dan tampilan.
// Menghitung jumlah halaman berdasarkan jumlah jenis hemorrhage yang ada.
// ========================================================
class _HemorrhageTypesListState extends State<HemorrhageTypesList> {
  int currentPage = 0; // Halaman saat ini.
  static const int itemsPerPage = 3; // Jumlah item per halaman.

  // ========================================================
  // TOTAL PAGES GETTER
  // Menghitung total halaman berdasarkan jumlah jenis hemorrhage.
// ========================================================
  int get totalPages => (hemorrhageTypes.length / itemsPerPage).ceil();

  // ========================================================
  // NEXT PAGE METHOD
  // Metode untuk berpindah ke halaman berikutnya.
// ========================================================
  void nextPage() {
    if (currentPage < totalPages - 1) { // Memastikan tidak melampaui total halaman.
      setState(() {
        currentPage++; // Meningkatkan halaman saat ini.
      });
    }
  }

  // ========================================================
  // PREVIOUS PAGE METHOD
  // Metode untuk berpindah ke halaman sebelumnya.
// ========================================================
  void previousPage() {
    if (currentPage > 0) { // Memastikan tidak kurang dari halaman pertama.
      setState(() {
        currentPage--; // Mengurangi halaman saat ini.
      });
    }
  }

  // ========================================================
  // CURRENT ITEMS GETTER
  // Mengambil daftar jenis hemorrhage untuk halaman saat ini.
// ========================================================
  List<HemorrhageType> get currentItems {
    final startIndex = currentPage * itemsPerPage; // Indeks awal untuk halaman saat ini.
    final endIndex = (startIndex + itemsPerPage).clamp(0, hemorrhageTypes.length); // Indeks akhir untuk halaman saat ini.
    return hemorrhageTypes.sublist(startIndex, endIndex); // Mengembalikan sublist dari hemorrhageTypes.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Menyelaraskan konten di tengah.
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white60), // Ikon untuk navigasi ke halaman sebelumnya.
                onPressed: currentPage > 0 ? previousPage : null, // Mengaktifkan tombol jika bukan halaman pertama.
                style: IconButton.styleFrom(
                  disabledBackgroundColor: Colors.transparent, // Mengatur warna latar belakang saat dinonaktifkan.
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Menyelaraskan konten di tengah.
                  children: currentItems.map((hemorrhageType) {
                    return Expanded(
                      child: HemorrhageTypeCard(hemorrhageType: hemorrhageType), // Menampilkan kartu untuk setiap jenis hemorrhage.
                    );
                  }).toList(),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white60), // Ikon untuk navigasi ke halaman berikutnya.
                onPressed: currentPage < totalPages - 1 ? nextPage : null, // Mengaktifkan tombol jika bukan halaman terakhir.
                style: IconButton.styleFrom(
                  disabledBackgroundColor: Colors.transparent, // Mengatur warna latar belakang saat dinonaktifkan.
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16), // Jarak antara konten dan indikator pagination.
        // ========================================================
        // PAGINATION INDICATORS
        // Menampilkan indikator pagination untuk menunjukkan halaman saat ini.
        // ========================================================
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Menyelaraskan indikator di tengah.
          children: List.generate(totalPages, (index) {
            return Container(
              width: 8, // Lebar indikator.
              height: 8, // Tinggi indikator.
              margin: const EdgeInsets.symmetric(horizontal: 4), // Margin horizontal antara indikator.
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Bentuk indikator.
                color: currentPage == index 
                    ? Colors.grey // Warna indikator aktif.
                    : Colors.grey.withAlpha((0.3 * 255).toInt()), // Warna indikator tidak aktif.
              ),
            );
          }),
        ),
      ],
    );
  }
}



// ========================================================
// HEMORRHAGE TYPE CARD WIDGET
// Widget untuk menampilkan informasi tentang jenis hemorrhage dalam bentuk kartu.
// Kartu ini dapat ditekan untuk menavigasi ke halaman detail hemorrhage.
// ========================================================
class HemorrhageTypeCard extends StatelessWidget {
  final HemorrhageType hemorrhageType; // Objek hemorrhageType yang akan ditampilkan.

  const HemorrhageTypeCard({
    required this.hemorrhageType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding horizontal di sekitar kartu.
      child: GestureDetector(
        onTap: () {
          // Navigasi ke halaman detail hemorrhage saat kartu ditekan.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => hemorrhageType.page),
          );
        },
        child: Container(
          width: double.infinity, // Lebar kartu penuh.
          padding: const EdgeInsets.all(8.0), // Padding di dalam kartu.
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 23, 25, 30), // Warna latar belakang kartu.
            borderRadius: BorderRadius.circular(16), // Sudut melengkung pada kartu.
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50), // Warna bayangan.
                blurRadius: 4, // Radius blur bayangan.
                offset: const Offset(2, 2), // Offset bayangan.
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Menyelaraskan konten di tengah.
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30), // Sudut melengkung pada gambar.
                child: Image.asset(
                  hemorrhageType.image, // Mengambil gambar dari path yang ditentukan.
                  height: 60, // Tinggi gambar.
                  width: 60, // Lebar gambar.
                  fit: BoxFit.cover, // Mengatur cara gambar ditampilkan.
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, color: Colors.red); // Menampilkan ikon jika gambar gagal dimuat.
                  },
                ),
              ),
              const SizedBox(height: 8), // Jarak antara gambar dan judul.
              Text(
                hemorrhageType.title, // Menampilkan judul hemorrhage.
                textAlign: TextAlign.center, // Menyelaraskan teks di tengah.
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================================
// START CLASSIFICATION BUTTON WIDGET
// Widget untuk tombol yang memulai proses klasifikasi hemorrhage.
// Mengarahkan pengguna ke halaman klasifikasi saat ditekan.
// ========================================================
class StartClassificationButton extends StatelessWidget {
  const StartClassificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50), // Padding vertikal di sekitar tombol.
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1B1E25), // Warna latar belakang tombol.
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Padding di dalam tombol.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Sudut melengkung pada tombol.
            ),
            elevation: 5, // Elevasi bayangan tombol.
          ),
          onPressed: () {
            // Navigasi ke halaman klasifikasi saat tombol ditekan.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClassificationPage()),
            );
          },
          child: const Text(
            'Start Classification', // Teks yang ditampilkan pada tombol.
            style: TextStyle(color: Colors.white, fontSize: 18), // Gaya teks tombol.
          ),
        ),
      ),
    );
  }
}

// ========================================================
// EDUCATION IMAGE WIDGET
// Widget untuk menampilkan gambar edukasi tentang hemorrhage.
// Gambar ini memberikan visualisasi tambahan untuk konten edukasi.
// ========================================================
class EducationImage extends StatelessWidget {
  final double height; // Tinggi gambar.

  const EducationImage({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding di sekitar gambar.
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Sudut melengkung pada gambar.
        child: Image.asset(
          'assets/ICH1.JPG', // Path gambar edukasi.
          height: height, // Mengatur tinggi gambar.
          fit: BoxFit.cover, // Mengatur cara gambar ditampilkan.
        ),
      ),
    );
  }
}
