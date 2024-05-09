import 'package:flutter/material.dart';
import 'package:json_to_list_flutter/detail_petani.dart';
import 'package:json_to_list_flutter/models/petani.dart';
import 'package:json_to_list_flutter/Service/apistatic.dart';
import 'package:json_to_list_flutter/utils/const.dart';
import 'package:json_to_list_flutter/input_petani.dart';

class PetaniPage extends StatefulWidget {
  @override
  _PetaniPageState createState() => _PetaniPageState();
}

class _PetaniPageState extends State<PetaniPage> {
  List<Petani> _listPetani = [];

  @override
  void initState() {
    super.initState();
    _fetchPetaniData();
  }

  Future<void> _fetchPetaniData() async {
    final List<Petani> petaniList = await ApiStatic.getPetani(host);
    setState(() {
      _listPetani = petaniList;
    });
  }

  Future<void> _deletePetani(int index) async {
    // Implement delete functionality here
    // Example: await ApiStatic.deletePetani(_listPetani[index].id);
    setState(() {
      _listPetani.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Petani"),
      ),
      body: ListView.builder(
        itemCount: _listPetani.length,
        itemBuilder: (BuildContext context, int index) {
          final Petani petani = _listPetani[index];
          return Dismissible(
            key: Key(petani.nik.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: AlignmentDirectional.centerEnd,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              _deletePetani(index);
            },
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => DetailPetaniPage(
                      petani: petani,
                    ),
                  ),
                );
              },
              leading: Icon(Icons.person),
              title: Text(petani.nama!),
              subtitle: Text(petani.alamat ?? ""),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Implement edit functionality here
                  // Example: Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => EditPetaniPage(
                  //       petani: petani,
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InputPetani())
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}