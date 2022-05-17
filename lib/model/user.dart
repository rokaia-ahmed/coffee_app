class UserModel {
  late String email;
  late String name;
  late String phone;
  late String image;
  late String id;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.image,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      image: json['image'],
      id: json['id'] ?? '1',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }
}
