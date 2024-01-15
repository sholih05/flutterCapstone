import 'package:flutter/material.dart';

class BerandaPanel extends StatelessWidget {
  const BerandaPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _BackgroundDashboard(),
        const _InformasiPengguna(),
        Card(
          margin: const EdgeInsets.fromLTRB(0, 190, 0, 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Berita',
                    style: TextStyle(fontSize: 19),
                  ),
                  _ListBerita(),
                  Wrap(
                    children: [
                      _TombolMenu(
                        gambar: 'assets/icon1.png',
                      ),
                      _TombolMenu(
                        gambar: 'assets/news-reporter.png',
                      ),
                      _TombolMenu(
                        gambar: 'assets/chatbot.png',
                      ),
                      _TombolMenu(
                        gambar: 'assets/management.png',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _TombolMenu extends StatelessWidget {
  final String gambar;
  const _TombolMenu({super.key, this.gambar = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.all(8),
      child: Image.asset(
        gambar,
        width: 40,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xdadadaff),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(125, 112, 158, 158),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(2, 2))
          ]),
    );
  }
}

class _ListBerita extends StatelessWidget {
  const _ListBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _ItemBerita(
            assetgambar: 'assets/berita1.jpg',
          ),
          _ItemBerita(
            assetgambar: 'assets/berita2.jpg',
          ),
          _ItemBerita(
            assetgambar: 'assets/berita3.jpg',
          ),
          _ItemBerita(
            assetgambar: 'assets/berita4.jpg',
          ),
        ],
      ),
    );
  }
}

class _ItemBerita extends StatelessWidget {
  final String assetgambar;
  const _ItemBerita({super.key, this.assetgambar = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          assetgambar,
          width: 250,
          height: 130,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _InformasiPengguna extends StatelessWidget {
  const _InformasiPengguna({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 60, 22, 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/potoprofil.jpg',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'hi, Riyan',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'riyanbayu0102@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/bell.png',
            width: 30,
          )
        ],
      ),
    );
  }
}

class _BackgroundDashboard extends StatelessWidget {
  const _BackgroundDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/Background.jpg',
        height: 300, width: double.infinity, fit: BoxFit.cover);
  }
}
