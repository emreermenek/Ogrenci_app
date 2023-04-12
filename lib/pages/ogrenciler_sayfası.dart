import 'package:flutter/material.dart';

class OgrencilerSayfasi extends StatefulWidget {
  const OgrencilerSayfasi({Key? key}) : super(key: key);

  @override
  State<OgrencilerSayfasi> createState() => _OgrencilerSayfasiState();
}

class _OgrencilerSayfasiState extends State<OgrencilerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenciler')
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
                    '10 öğrenci'
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    title: const Text('Ayşe'),
                    leading: const Text('👩‍💼'), //🧑‍💼
                    trailing: IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.favorite_border),
                    ),
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