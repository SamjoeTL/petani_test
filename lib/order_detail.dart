import 'package:flutter/material.dart';
import 'post/model.dart';
import 'db/database_instance.dart';

class OrderDetail extends StatefulWidget {
  final OrderModel? order;
  const OrderDetail({super.key, this.order});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController customerController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  @override
  void initState() {
    databaseInstance.database();
    print(widget.order!.id);
    customerController.text = widget.order!.customer ?? '';
    totalController.text = widget.order!.total ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.order!.customer.toString()),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Form Order',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: customerController,
                decoration: InputDecoration(labelText: 'Customer'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: totalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () async {
                  await databaseInstance.update(widget.order!.id!, {
                    'customer': customerController.text,
                    'total': totalController.text,
                    'date': DateTime.now().toString(),
                  });
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF474A5C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await databaseInstance.delete(widget.order!.id!);
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}