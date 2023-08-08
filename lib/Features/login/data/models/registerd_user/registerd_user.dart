import 'package:equatable/equatable.dart';

import 'data.dart';

class RegisterdUser extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;

  const RegisterdUser({this.status, this.message, this.data});

  factory RegisterdUser.fromJson(Map<String, dynamic> json) => RegisterdUser(
        status: json['status']?.toString().contains("true"),
        message: json['message']?.toString(),
        data: json['data'] == null
            ? null
            : Data.fromJson(Map<String, dynamic>.from(json['data'])),
      );

  Map<String, dynamic> toJson() => {
        if (status != null) 'status': status,
        if (message != null) 'message': message,
        if (data != null) 'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, data];
}
