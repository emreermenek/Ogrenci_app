import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/models/ogretmen.dart';
import 'package:http/http.dart' as http;
class DataService{
  final String baseUrl = 'https://64397a364660f26eb1b422b2.mockapi.io';

  Future<Ogretmen> ogretmenIndir() async {

   final response = await http.get(Uri.parse('$baseUrl/ogretmen/1'));

   if (response.statusCode == 200) {
     // If the server did return a 200 OK response,
     // then parse the JSON.
     return Ogretmen.fromMap(jsonDecode(response.body));
   } else {
     // If the server did not return a 200 OK response,
     // then throw an exception.
     throw Exception('Ogretmen verisi indirilemedi ${response.statusCode}');
   }
  }

  Future<void> ogretmenEkle(Ogretmen ogretmen) async {

    final response = await http.post(
      Uri.parse('$baseUrl/ogretmen'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(ogretmen.toMap()),
    );
    if (response.statusCode == 201) {
      return;
    } else {
      throw Exception('Ogretmen eklenemedi ${response.statusCode}');
    }
  }
}

final dataServiceProvider = Provider((ref) {
  return DataService();
});