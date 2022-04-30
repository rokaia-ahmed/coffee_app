class ProductModel {
  String? name;
  String? categoryId;
  String? id;
  String? image;
  String? description;
  String? price;
  String? size;
  String? ingredients;
  bool special;
  ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.size,
    required this.price,
    required this.image,
    required this.description,
    required this.ingredients,
    required this.special,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        categoryId: json['category_id'],
        price: json['price'],
        name: json['name'],
        description: json['description'],
        id: json['id'],
        image: json['image'],
        size: json['size'],
        ingredients: json['ingredients'],
        special: json['special'] ?? false);
  }
}
