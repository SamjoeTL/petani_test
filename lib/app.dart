import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_to_list_flutter/about_page.dart';
import 'package:json_to_list_flutter/crud_sqlite_page.dart';
import 'package:json_to_list_flutter/help.dart';
import 'package:json_to_list_flutter/home_page.dart';
import 'package:json_to_list_flutter/api_data_page.dart';
import 'package:json_to_list_flutter/order_detail.dart';
import 'package:json_to_list_flutter/petani_page.dart';
import 'package:json_to_list_flutter/input_petani.dart';
import 'package:json_to_list_flutter/setting_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tora Technology',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        '/api': (context) => MyHomePage(),
        '/page1': (context) => SettingsPage2(title: 'Setting'),
        '/help': (context) => HelpPage(),
        '/page2': (context) => AboutPage(),
        '/crud': (context) => SqfliteOrder(),
        '/detail': (context) => OrderDetail(),
        '/petani_page': (context) => PetaniPage(),
        '/input_petani': (context) => InputPetani(),
      },
    );
  }
}