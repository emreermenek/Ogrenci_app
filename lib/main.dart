import 'package:flutter/material.dart';
import 'package:ogrenci_app/pages/mesajlar_sayfasi.dart';
import 'package:ogrenci_app/pages/ogrenciler_sayfas%C4%B1.dart';
import 'package:ogrenci_app/pages/ogretmenler_sayfas%C4%B1.dart';
import 'package:ogrenci_app/repository/mesajlar_repository.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

void main() {
  runApp(const OgrenciApp());
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaSayfa(title: 'Öğrenci Ana Sayfa'),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key, required this.title});

  final String title;

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  MesajlarRepository mesajlarRepository = MesajlarRepository();
  OgrencilerRepository ogrencilerRepository = OgrencilerRepository();
  OgretmenlerRepository ogretmenlerRepository = OgretmenlerRepository();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
                child: Text(
                    'Öğrenci Adı',
                )
            ),
            ListTile(
              title: Text('Öğrenciler'),
            ),
            ListTile(
              title: Text('Öğretmenler'),
            ),
            ListTile(
              title: Text('Mesajlar'),
            ),

          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MesajlarSayfasi(mesajlarRepository),));
                },
                child: Text('${mesajlarRepository.mesajlar.length} yeni mesaj'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OgrencilerSayfasi(ogrencilerRepository),));
              },
              child: Text('${ogrencilerRepository.ogrenciler.length} öğrenci'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OgretmenlerSayfasi(ogretmenlerRepository),));
              },
              child: Text('${ogretmenlerRepository.ogretmenler.length} öğretmen'),
            ),
          ],
        ),
      ),
    );
  }
}
