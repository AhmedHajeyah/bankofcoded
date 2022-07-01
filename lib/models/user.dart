import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String username;
  String password;
  String? image;
  int? id;
  int? balance;

  User({required this.username, required this.password, this.image});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

//flutter pub run build_runner build
