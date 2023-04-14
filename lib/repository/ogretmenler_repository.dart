import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgretmenlerRepository extends ChangeNotifier{

  List ogretmenler = [
    Ogretmen('Faruk', 'Yılmaz', 18, 'Erkek'),
    Ogretmen('Samiha', 'Çelik', 18, 'Kadın'),
  ];

}
final ogretmenlerProvider = ChangeNotifierProvider((ref) {
  return OgretmenlerRepository();
});
class Ogretmen{
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas,this.cinsiyet);
}