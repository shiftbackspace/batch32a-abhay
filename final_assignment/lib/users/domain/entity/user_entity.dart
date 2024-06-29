

import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String phone;
  final String? image;
  final String password;

  const UsersEntity({
    this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.image,
    required this.password,
  });
  
  @override
  List<Object?> get props => [id, fullName, email, phone,image, password];

  
}