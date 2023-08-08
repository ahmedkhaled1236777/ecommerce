import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? name;
  final String? email;
  final String? phone;
  final num? id;
  final String? image;
  final String? token;

  const Data({
    this.name,
    this.email,
    this.phone,
    this.id,
    this.image,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json['name']?.toString(),
        email: json['email']?.toString(),
        phone: json['phone']?.toString(),
        id: num.tryParse(json['id'].toString()),
        image: json['image']?.toString(),
        token: json['token']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (id != null) 'id': id,
        if (image != null) 'image': image,
        if (token != null) 'token': token,
      };

  @override
  List<Object?> get props => [name, email, phone, id, image, token];
}
