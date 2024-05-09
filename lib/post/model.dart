class OrderModel {
  int? id;
  String? customer, total, date;

  OrderModel({this.id, this.customer, this.total, this.date});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      customer: json['customer'],
      total: json['total'],
      date: json['date'],
    );
  }
}