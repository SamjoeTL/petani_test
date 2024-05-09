import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_to_list_flutter/models/petani.dart';
import 'package:json_to_list_flutter/utils/const.dart';

class ApiStatic {
  //static final host='http://192.168.43.189/webtani/public';
  static var _token = "8|x6bKsHp9STb0uLJsM11GkWhZEYRWPbv0IqlXvFi7";
  static Future<List<Petani>> getPetani(String s) async {
    try {
      final response =
          await http.get(Uri.parse("$host/api/petani?s="), headers: {
        'Authorization': 'Bearer ' + _token,
      });
      // print('ss1');
      if (response.statusCode == 200) {
        //print('ss2');
        var json = jsonDecode(response.body);
        //print(json);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Petani>((json) => Petani.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}