import 'package:flutter/material.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends StatefulWidget {
  final OgretmenlerRepository ogretmenlerRepository;
  const OgretmenlerSayfasi(this.ogretmenlerRepository, {Key? key}) : super(key: key);

  @override
  State<OgretmenlerSayfasi> createState() => _OgretmenlerSayfasiState();
}

class _OgretmenlerSayfasiState extends State<OgretmenlerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Öğretmenler')
      ),
      body: Column(
        children: [
          const PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32,horizontal: 32),
                child: Text(
                    '10 öğretmen'
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: const Text('Ayşe'),
                leading: const Text('👩‍💼'), //🧑‍💼
              ),
              separatorBuilder: (context, index) => const Divider(

              ),
              itemCount: 25,
            ),
          ),
        ],
      ),
    );
  }
}
