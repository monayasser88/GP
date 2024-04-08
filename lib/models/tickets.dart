class MyTicketItem {
  final String id;
  final String title;
  final String description;
  final int quantity;
  final double price;
  final String userId;

  MyTicketItem({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.userId,
  });

  factory MyTicketItem.fromJson(Map<String, dynamic> json) {
    return MyTicketItem(
      id: json['trip']['_id'],
      title: json['trip']['title'],
      description: json['trip']['description'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      userId: json['user_id'],
    );
  }
}

class MyTicket {
  final String id;
  final String user;
  final List<MyTicketItem> items;
  final double totalPrice;

  MyTicket({
    required this.id,
    required this.user,
    required this.items,
    required this.totalPrice,
  });

  factory MyTicket.fromJson(Map<String, dynamic> json) {
    return MyTicket(
      id: json['_id'],
      user: json['user'],
      items: List<MyTicketItem>.from(json['myTicketItems'].map((x) => MyTicketItem.fromJson(x))),
      totalPrice: json['totalPrice'].toDouble(),
    );
  }
}
