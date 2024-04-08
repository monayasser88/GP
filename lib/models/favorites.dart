class WishListItem {
  final String id;
  final String title;
  final String description;
  final String imgCover;

  WishListItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imgCover,
  });

  factory WishListItem.fromJson(Map<String, dynamic> json) {
    return WishListItem(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      imgCover: json['imgCover'],
    );
  }
}

