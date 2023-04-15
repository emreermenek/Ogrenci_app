import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/services/data_service.dart';

import '../../models/ogretmen.dart';

class OgretmenForm extends ConsumerStatefulWidget {
  const OgretmenForm({Key? key}) : super(key: key);

  @override
  _OgretmenFormState createState() => _OgretmenFormState();
}

class _OgretmenFormState extends ConsumerState<OgretmenForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> girilen = {};

  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğretmen Ekleme'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ad',
                  ),
                  validator: (value) {
                    if (value?.isNotEmpty != true) {
                      return 'Ad girmeniz gerekli';
                    }
                  },
                  onSaved: (newValue) {
                    girilen['ad'] = newValue;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Soyad',
                  ),
                  validator: (value) {
                    if (value?.isNotEmpty != true) {
                      return 'Soyad girmeniz gerekli';
                    }
                  },
                  onSaved: (newValue) {
                    girilen['soyad'] = newValue;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Yaş',
                  ),
                  validator: (value) {
                    if (value == null || value.isNotEmpty != true) {
                      return 'Yaş girmeniz gerekli';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Rakamlarla yaş girmeniz gerekli';
                    }
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) {
                    girilen['yas'] = int.parse(newValue!);
                  },
                ),
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      child: Text('Erkek'),
                      value: 'Erkek',
                    ),
                    DropdownMenuItem(
                      child: Text('Kadın'),
                      value: 'Kadın',
                    ),
                  ],
                  value: girilen['cinsiyet'],
                  onChanged: (value) {
                    girilen['cinsiyet'] = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Lütfen cinsiyet seçin';
                    }
                  },
                ),
                isSaving
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                  onPressed: () async {
                    final formState = _formKey.currentState;
                    if (formState == null) return;
                    if (formState.validate() == true) {
                      formState.save();
                    }

                    _kaydet();
                  },

                  child: const Text('Kaydet'),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _kaydet() async {
    try {
      setState(() {
        isSaving = true;
      });
      await ref.read(dataServiceProvider).ogretmenEkle(
        Ogretmen.fromMap(girilen),
      );
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
      );
    } finally {
      setState(() {
        isSaving = false;
      });

    }
  }
}


