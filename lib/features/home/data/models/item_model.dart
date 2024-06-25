
class ItemModel {
  final String category;
  final int quantity;
  final String image;

  ItemModel({
    required this.category,
    required this.quantity,
    required this.image,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      category: json['category'],
      quantity: json['quantity'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'quantity': quantity,
      'image': image,
    };
  }
}