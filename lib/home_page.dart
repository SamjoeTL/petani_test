import 'package:flutter/material.dart';
import 'package:json_to_list_flutter/cart.dart';
import 'sample.dart'; 
import 'package:json_to_list_flutter/sample2.dart';

class LaptopProduct {
  final String modelName;
  final String price;
  final String imageUrl;
  final int rating;

  LaptopProduct({
    required this.modelName,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });

  static fromJson(product) {}
}

class HandphoneProduct {
  final String modelName;
  final String price;
  final String imageUrl;
  final int rating;

  HandphoneProduct({
    required this.modelName,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });
}

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<LaptopProduct> laptopProducts = [
    
    LaptopProduct(
      modelName: 'laptop 1',
      price: '\Rp.13.200.000',
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/10/20/8f2f7501-a7c6-40a6-8d1b-a5410c25a598.jpg',
      rating: 5,
    ),
    LaptopProduct(
      modelName: 'Laptop 2',
      price: '\Rp.8.500.000',
      imageUrl:
          'https://m.media-amazon.com/images/I/31i3kSKQ6yL.jpg',
      rating: 4,
    ),
    LaptopProduct(
      modelName: 'Laptop 3',
      price: '\Rp.5.500.000',
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/12/25/87793954-0f7f-4464-abc0-114095a58909.jpg',
      rating: 2,
    ),
    LaptopProduct(
      modelName: 'Laptop 4',
      price: '\RP.12.999.00',
      imageUrl:
          'https://img.id.my-best.com/product_images/0fe5f4110913b5a740aa6ff62aadd5de.png?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=6a0089d93332dac7d4b021dbefabc919',
      rating: 5,
    ),
    LaptopProduct(
      modelName: 'Laptop 5',
      price: '\RP.20.000.000',
      imageUrl:
          'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RW16TLP?ver=5c8b&q=90&m=6&h=705&w=1253&b=%23FFFFFFFF&f=jpg&o=f&p=140&aim=true',
      rating: 3,
    ),
    LaptopProduct(
      modelName: 'Laptop 6',
      price: '\RP.7.000.000',
      imageUrl:
          'https://consumer.huawei.com/content/dam/huawei-cbg-site/south-pacific/my/mkt/plp/new-laptops/img-0625/matebook-d14-2023.jpg',
      rating: 5,
    ),
  ];

  late List<HandphoneProduct> phoneProducts = [
    HandphoneProduct(
      modelName: 'Handphone 1',
      price: '\Rp.4.500.000',
      imageUrl:
          'https://img.lazcdn.com/g/p/7c4caeb3eb7c84e0c8ee5248cbf10dc6.jpg_720x720q80.jpg',
      rating: 3,
    ),
    HandphoneProduct(
      modelName: 'Handphone 2',
      price: '\Rp.6.000.000',
      imageUrl:
          'https://static.bmdstatic.com/pk/product/medium/61b3598e198e4.jpg',
      rating: 4,
    ),
    HandphoneProduct(
      modelName: 'Handphone 3',
      price: '\Rp.3.500.000',
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2024/1/5/99d72cfa-2170-4332-ab72-a1116b78bc2e.jpg',
      rating: 4,
    ),
    HandphoneProduct(
      modelName: 'Handphone 4',
      price: '\Rp.8.000.000',
      imageUrl:
          'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/12/28/27ff604d-6267-4504-9660-f0e16bd2562a.jpg',
      rating: 5,
    ),
   HandphoneProduct(
      modelName: 'Handphone 5',
      price: '\Rp.9.300.000',
      imageUrl:
          'https://static.bmdstatic.com/pk/product/medium/618baf7f17673.jpg',
      rating: 4,
       ),
    HandphoneProduct(
      modelName: 'Handphone 6',
      price: '\RP.1.000.000',
      imageUrl:
          'https://i01.appmifile.com/webfile/globalimg/id/cms/6F67FCF0-D2BB-894D-1616-539F99A2E5EA!800x800!85.jpg',
      rating: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
         appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://tattooicon.com/cdn/shop/products/KazutoraHanemiyaTattooCostume_1024x1024.jpg?v=1642071646'),
              ),
              SizedBox(width:5),
              Text(
                'ToraTechnology',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('Laptop'),
              ),
              Tab(
                child: Text('Handphone'),
              ),
            ],
          ),
        ),
       backgroundColor: Colors.purple[900],
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://tattooicon.com/cdn/shop/products/KazutoraHanemiyaTattooCostume_1024x1024.jpg?v=1642071646'), 
                ),
                accountName: Text('Tora Technology'),
                accountEmail: Text('toratech@example.com'),
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
              ),
            ListTile(
              leading: Icon(Icons.api),
              title: Text('Latihan Get Data API'),
              onTap: () {
                Navigator.pushNamed(context, '/api');
              },
            ),
            ListTile(
              leading: Icon(Icons.api),
              title: Text('Latihan CRUD Sqlite'),
              onTap: () {
                Navigator.pushNamed(context, '/crud');
              },
            ),
            ListTile(
              leading: Icon(Icons.api),
              title: Text('Latihan Database petani'),
              onTap: () {
                Navigator.pushNamed(context, '/petani_page');
              },
            ),ListTile(
              leading: Icon(Icons.api),
              title: Text('Latihan Input Data Petani'),
              onTap: () {
                Navigator.pushNamed(context, '/input petani');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/page1');
              },
            ),
             ListTile(
              leading: Icon(Icons.help),
              title: Text('Help and Feedback'),
              onTap: () {
                Navigator.pushNamed(context, '/help');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/page2');
              },
            ),
          ],
        ),
      ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: laptopProducts.length,
              itemBuilder: (context, index) {
                return buildProductCard(context, laptopProducts[index]);
              },
            ),
            ListView.builder(
              itemCount: phoneProducts.length,
              itemBuilder: (context, index) {
                return buildProductCard2(context, phoneProducts[index]);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(laptopProducts: [], phoneProducts: [],)),
          );
        },
        child: Icon(Icons.shop_rounded),
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      )
    );
  }
}


Widget buildProductCard(BuildContext context, LaptopProduct laptopProducts) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
         laptopProducts.imageUrl,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                laptopProducts.modelName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                laptopProducts.price,
                style: TextStyle(fontSize: 14, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(laptopProducts.rating, (index) {
                  return Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Star_icon_stylized.svg/2153px-Star_icon_stylized.svg.png',
                    height: 16,
                    width: 16,
                    color: Colors.pink,
                  );
                }),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SamplePage()),
                    );
                  },
                  child: Text('Lihat Detail'),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
Widget buildProductCard2(BuildContext context, HandphoneProduct phoneProducts) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          phoneProducts.imageUrl,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                phoneProducts.modelName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                phoneProducts.price,
                style: TextStyle(fontSize: 14, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(phoneProducts.rating, (index) {
                  return Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Star_icon_stylized.svg/2153px-Star_icon_stylized.svg.png',
                    height: 16,
                    width: 16,
                    color: Colors.pink,
                  );
                }),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SamplePage2()),
                    );
                  },
                  child: Text('Lihat Detail'),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}