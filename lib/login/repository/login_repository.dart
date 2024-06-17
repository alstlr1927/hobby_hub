import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hobby_hub_app/common/utils/logger.dart';
import 'package:hobby_hub_app/helper/firestore_helper.dart';

class LoginRepository {
  final userRef = FirestoreHelper().firestore.collection('user');

  /// [getUserByUid] uid로 유저를 가져온다
  Future<DocumentSnapshot<Map<String, dynamic>>?> getUserByUid(
      {required String uid}) async {
    try {
      var res = await userRef.doc(uid).get();

      HobbyLog().i('res : ${res.data()}');

      return res;
    } catch (e, trace) {
      HobbyLog().e('getUserByUid Error : $e');
      HobbyLog().e('$trace');
      return null;
    }
  }
}
