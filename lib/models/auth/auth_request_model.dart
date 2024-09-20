import 'package:asset_tracker/models/request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_request_model.g.dart';

@JsonSerializable(createFactory: false)
final class AuthRequestModel extends RequestModel {
  const AuthRequestModel({required this.email, required this.password});

  final String email;
  final String password;

  @override
  Map<String, dynamic> toJson() => _$AuthRequestModelToJson(this);
}
