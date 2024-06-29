import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String fname;
  final String lname;
  final String username;
  final String password;

  const AuthEntity({
    this.id,
    required this.fname,
    required this.lname,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [ fname, lname, username, password];
}
