// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:user_api/src/models/models.dart';

part 'user.g.dart';

/// {@template user}
/// User model
/// {@endtemplate}
@collection
class User extends Equatable {
  /// {@macro user}
  const User({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
  });

  /// {@macro user}
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: (json['id'] as Id?) ?? Isar.autoIncrement,
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        address: Address.fromJson(json['address'] as Map<String, dynamic>),
        phone: json['phone'] as String,
      );

  ///
  final Id? id;

  /// User name
  final String name;

  /// Username
  final String username;

  /// Email address
  final String email;

  /// Address information
  final Address address;

  /// Phone number
  final String phone;

  @override
  List<Object?> get props => [id, name, username, email, address, phone];

  User copyWith({
    Id? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }
}
