import 'package:flutter/material.dart';

class BeritaDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const BeritaDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'berita_$title',
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    image,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeritaPanel extends StatelessWidget {
  const BeritaPanel({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> daftarBerita = [
      {
        'title': 'Tidak Laku di Pasaran: Petani Sawi Menghadapi Krisis',
        'description':
            'Para petani sawi mengalami masalah serius karena tanaman sawi mereka tidak laku di pasaran. Faktor ekonomi, persaingan dengan tanaman lain, dan kondisi cuaca yang tidak bersahabat menjadi penyebab utama dari krisis ini. Keadaan ini memberikan dampak besar terhadap keberlanjutan usaha pertanian di wilayah tersebut.',
        'image': 'assets/berita1.jpg',
      },
      {
        'title': 'Tanaman Sawi Kualitas Rendah: Permintaan Pasar Menurun',
        'description':
            'Para petani sawi dihadapkan pada tantangan baru ketika tanaman sawi yang dihasilkan memiliki kualitas rendah. Permintaan pasar menurun karena konsumen lebih memilih produk dengan kualitas yang lebih baik. Hal ini menyebabkan tanaman sawi tidak laku di pasaran.',
        'image': 'assets/berita2.jpg',
      },
      {
        'title': 'Overproduksi Tanaman Sawi: Pasar Tidak Mampu Menyerap',
        'description':
            'Fenomena overproduksi terjadi ketika para petani sawi memproduksi lebih banyak dari yang bisa diserap oleh pasar. Kondisi ini menyebabkan penurunan harga dan membuat tanaman sawi tidak laku di pasaran karena ketersediaan yang berlebihan.',
        'image': 'assets/berita3.jpg',
      },
      {
        'title': 'Sawi Sehat dan Berkualitas: Petani Raih Kesuksesan',
        'description':
            'Petani sawi di wilayah tertentu merayakan kesuksesan mereka karena tanaman sawi yang sehat dan berkualitas tinggi. Penerapan praktik pertanian organik dan perawatan tanaman yang cermat telah menghasilkan hasil panen yang luar biasa. Permintaan pasar yang tinggi membuat sawi ini laku keras di pasaran lokal dan ekspor.',
        'image': 'assets/berita4.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Terkini'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: daftarBerita.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BeritaDetailPage(
                    title: daftarBerita[index]['title'],
                    description: daftarBerita[index]['description'],
                    image: daftarBerita[index]['image'],
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'berita_${daftarBerita[index]['title']}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Image.asset(
                        daftarBerita[index]['image'],
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          daftarBerita[index]['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          daftarBerita[index]['description'],
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
