import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_to_list_flutter/models/petani.dart';

class InputPetani extends StatefulWidget {
  @override
  _InputPetaniState createState() => _InputPetaniState();
}

class _InputPetaniState extends State<InputPetani> {
  String? nama;
  String? nik;
  String? alamat;
  String? telp;
  String? namaKelompok;

  Future<void> postData(Petani petani) async {
    final url = 'https://dev.wefgis.com'; // Ganti dengan URL endpoint Anda
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'nama': petani.nama,
      'nik': petani.nik,
      'alamat': petani.alamat,
    });

    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        // Berhasil mengirim data
        print('Data berhasil dikirim');
      } else {
        // Gagal mengirim data
        print('Gagal mengirim data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Error dalam melakukan permintaan HTTP
      print('Terjadi kesalahan saat mengirim data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Petani'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nama'),
              onChanged: (value) {
                setState(() {
                  nama = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'NIK'),
              onChanged: (value) {
                setState(() {
                  nik = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Alamat'),
              onChanged: (value) {
                setState(() {
                  alamat = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'telpon'),
              onChanged: (value) {
                setState(() {
                  telp = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'nama kelompok'),
              onChanged: (value) {
                setState(() {
                  namaKelompok = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (nama != null && nik != null && alamat != null && telp != null && namaKelompok != null) {
                  Petani newPetani = Petani(
                    idPenjual: null,
                    idKelompokTani: null,
                    nama: nama!,
                    nik: nik!,
                    alamat: alamat!,
                    telp: null,
                    foto: null,
                    status: null,
                    namaKelompok: null,
                  );
                  // Kirim data petani baru ke server
                  postData(newPetani);
                  Navigator.pop(context, newPetani);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Mohon lengkapi semua field'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}