import 'package:isar/isar.dart';
import 'package:user_api/src/models/models.dart';

part 'user.g.dart';

/// {@template user}
/// User model
/// {@endtemplate}
@collection
class User {
  /// {@macro user}
  const User({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
  });

  /// {@macro user}
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as Id?,
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
}
