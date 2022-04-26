class ProductModel {
  late String name;
  late String id ;
  late String image ;
 late String description ;
 late String price ;
 late String size ;
 late String ingredients;
 late bool special;
   ProductModel({
   required this.id,
   required this.name,
   required this.size,
    required this.price,
   required this.image,
   required this.description,
   required this.ingredients,
   required this.special,
});
  factory ProductModel.
      fromJson(Map<String,dynamic>json){
    print('model : '+json.toString());
     return ProductModel
       (
       price: json['price'],
       name: json['name'],
       description: json['description'],
       id: json['id'],
       image:json ['image'],
       size: json['size'],
       ingredients: json['ingredients'],
       special : json['special']
     );
   }
}