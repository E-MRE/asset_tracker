import 'package:flutter_local_storage/flutter_local_storage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
final class UserModel extends LocalStorageModel {
  const UserModel({required this.email, required this.name, required this.password});

  final String email;
  final String name;
  final String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  UserModel fromJson(Map<String, dynamic> json) => UserModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
