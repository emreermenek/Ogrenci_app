import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/pages/ogretmen/ogretmenler_formu.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

import '../models/ogretmen.dart';

class OgretmenlerSayfasi extends ConsumerWidget {
  const OgretmenlerSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text('Öğretmenler')
      ),
      body: Column(
        children: [
           PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 32,horizontal: 32),
                    child: Text(
                        '${ogretmenlerRepository.ogretmenler.length} öğretmen'
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: OgretmenIndirmeButonu(),

                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => OgretmenSatiri(
                ogretmenlerRepository.ogretmenler[index],
              ),
              separatorBuilder: (context, index) => const Divider(

              ),
              itemCount: ogretmenlerRepository.ogretmenler.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.of(context).push<bool>(MaterialPageRoute(builder: (context) => const OgretmenForm()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class OgretmenIndirmeButonu extends StatefulWidget {
  const OgretmenIndirmeButonu({
    super.key,
  });

  @override
  State<OgretmenIndirmeButonu> createState() => _OgretmenIndirmeButonuState();
}

class _OgretmenIndirmeButonuState extends State<OgretmenIndirmeButonu> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return isLoading ? CircularProgressIndicator() : IconButton(
          icon: const Icon(Icons.download),
          onPressed: () async {

            //TODO loading
            //TODO error
            try{
              setState(() {
                isLoading = true;
              });
              await ref.watch(ogretmenlerProvider).indir();
            }catch(e){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString()))
              );
            }finally{
            setState(() {
              isLoading = false;
            });
            }
          },
        );
      }
    );
  }
}
class OgretmenSatiri extends StatelessWidget {
  final Ogretmen ogretmen;
  const OgretmenSatiri(this.ogretmen, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ogretmen.ad + ' ' + ogretmen.soyad),
      leading: IntrinsicWidth(child: Center(child: Text(ogretmen.cinsiyet=='Kadın' ? '👩‍💼' : '🧑‍💼'))),
    );
  }
}