// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      backgroundImageUrl: json['backgroundImageUrl'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'email': instance.email,
      'gender': instance.gender,
      'profileImageUrl': instance.profileImageUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
    };
