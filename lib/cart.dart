import 'package:flutter/material.dart';
import 'home_page.dart';

class CartPage extends StatefulWidget {
  final List<LaptopProduct> laptopProducts;
  final List<HandphoneProduct> phoneProducts;

  CartPage({required this.laptopProducts, required this.phoneProducts});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<LaptopProduct> cartLaptopProducts = [];
  List<HandphoneProduct> cartPhoneProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView(
        children: [
          _buildProductList(widget.laptopProducts, cartLaptopProducts),
          _buildProductList(widget.phoneProducts, cartPhoneProducts),
        ],
      ),
    );
  }

  Widget _buildProductList(List<dynamic> products, List<dynamic> cartProducts) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: cartProducts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                cartProducts[index].imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(cartProducts[index].modelName),
              subtitle: Text(cartProducts[index].price),
            );
          },
        ),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
        Text(
          'Available Products',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                products[index].imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(products[index].modelName),
              subtitle: Text(products[index].price),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    cartProducts.add(products[index]);
                  });
                },
                child: Text('Add to Cart'),
              ),
            );
          },
        ),
      ],
    );
  }
}