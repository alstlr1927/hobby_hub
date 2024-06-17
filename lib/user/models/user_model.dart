import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String nickname;
  final String email;
  final String gender;
  final String profileImageUrl;
  final String backgroundImageUrl;

  UserModel({
    required this.uid,
    required this.nickname,
    required this.email,
    required this.gender,
    required this.profileImageUrl,
    required this.backgroundImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? uid,
    String? nickname,
    String? email,
    String? gender,
    String? profileImageUrl,
    String? backgroundImageUrl,
  }) =>
      UserModel(
        uid: uid ?? this.uid,
        nickname: nickname ?? this.nickname,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
      );
}
