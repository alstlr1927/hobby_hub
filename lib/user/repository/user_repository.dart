import 'package:flutter/material.dart';

import '../../common/utils/logger.dart';
import '../../helper/firestore_helper.dart';

class UserRepository {
  final userRef = FirestoreHelper().firestore.collection('user');

  /// [checkDuplicatedNickname] 닉네임이 겹치는지 체크 (존재하면 true)
  Future<bool> checkDuplicatedNickname({required String nickname}) async {
    debugPrint('==================================================');
    debugPrint('checkDuplicatedNickname\n');
    debugPrint('nickname : $nickname');
    debugPrint('==================================================');
    try {
      var res = await userRef.where('nickname', isEqualTo: nickname).get();
      if (res.size != 0) {
        HobbyLog().i('size not zero');
        return true;
      }
      HobbyLog().i('size zero');
      return false;
    } catch (e, trace) {
      HobbyLog().e('checkDuplicatedNickname Error : $e');
      HobbyLog().e('$trace');
      return false;
    }
  }

  /// [createUserByEmail]
  Future<bool> createUserByEmail({
    required String uid,
    required String nickname,
    required String email,
    required String gender,
    String profileImageUrl = '',
    String backgroundImageUrl = '',
  }) async {
    debugPrint('==================================================');
    debugPrint('createUserByEmail\n');
    debugPrint('uid : $uid\t');
    debugPrint('nickname : $nickname\t');
    debugPrint('email : $email\t');
    debugPrint('gender : $gender\t');
    debugPrint('profileImageUrl : $profileImageUrl\t');
    debugPrint('backgroundImageUrl : $backgroundImageUrl');
    debugPrint('==================================================');

    try {
      Map<String, dynamic> data = {
        'uid': uid,
        'nickname': nickname,
        'email': email,
        'gender': gender,
        'profileImageUrl': profileImageUrl,
        'backgroundImageUrl': backgroundImageUrl,
      };
      await userRef.doc(uid).set(data);
      return true;
    } catch (e, trace) {
      HobbyLog().e('createUserByEmail error : ${e}');
      HobbyLog().e('$trace');
      return false;
    }
  }
}
