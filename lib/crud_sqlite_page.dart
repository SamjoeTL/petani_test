import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_to_list_flutter/db/database_instance.dart';
import 'package:json_to_list_flutter/post/model.dart';
import 'package:json_to_list_flutter/order_detail.dart';

class SqfliteOrder extends StatefulWidget {
  const SqfliteOrder({super.key});

  @override
  State<SqfliteOrder> createState() => _SqfliteOrderState();
}

class _SqfliteOrderState extends State<SqfliteOrder> {
  DatabaseInstance? databaseInstance;
  TextEditingController customerController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  Future _refresh() async {
    setState(() {});
  }

  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();
    super.initState();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              top: 20,
              left: 20,
              right: 20),
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
                  await databaseInstance!.insert({
                    'customer': customerController.text,
                    'total': totalController.text,
                    'date': DateTime.now().toString(),
                  });
                  Navigator.pop(context);
                  setState(() {
                    customerController.text = '';
                    totalController.text = '';
                  });
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
                      'Save',
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
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sqflite Database"),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: databaseInstance != null
            ? FutureBuilder<List<OrderModel>>(
                future: databaseInstance!.all(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.length == 0) {
                      return const Center(
                        child: Text('Data Empty'),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String customerName =
                            snapshot.data![index].customer ?? 'Unknown';
                        String totalAmount =
                            snapshot.data![index].total?.toString() ??
                                'Unknown';
                        String date =
                            snapshot.data![index].date?.toString() ?? 'Unknown';
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderDetail(
                                order: snapshot.data![index],
                              ),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  customerName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF333542),
                                  ),
                                ),
                                Text(
                                  '\$$totalAmount',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF8C8FA6),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    date,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFF8C8FA6),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    print(snapshot.error);
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context);
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFF474A5C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}