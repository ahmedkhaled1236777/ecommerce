import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final num? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final num? points;
  final num? credit;
  final String? token;

  const Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        email: json['email']?.toString(),
        phone: json['phone']?.toString(),
        image: json['image']?.toString(),
        points: num.tryParse(json['points'].toString()),
        credit: num.tryParse(json['credit'].toString()),
        token: json['token']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phone != null) 'phone': phone,
        if (image != null) 'image': image,
        if (points != null) 'points': points,
        if (credit != null) 'credit': credit,
        if (token != null) 'token': token,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      image,
      points,
      credit,
      token,
    ];
  }
}
