import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobby_hub_app/common/components/title_text_field/field_controller.dart';
import 'package:hobby_hub_app/common/utils/logger.dart';
import 'package:hobby_hub_app/common/view/root_screen.dart';
import 'package:hobby_hub_app/user/repository/user_repository.dart';
import 'package:hobby_hub_app/user/types/type.dart';

import '../../common/components/custom_dialog/hobby_dialog.dart';

class InputRegistUserInfoViewModel extends ChangeNotifier {
  State state;

  FieldController nicknameController = FieldController();
  String nickname = '';

  GenderType selectGender = GenderType.NONE;

  bool isLoad = false;

  void focusoutAll() {
    nicknameController.unfocus();
  }

  void setLoad(bool flag) {
    isLoad = flag;
    notifyListeners();
  }

  void onClickGenderChip(GenderType type) {
    if (selectGender == type) {
      selectGender = GenderType.NONE;
    } else {
      selectGender = type;
    }
    notifyListeners();
  }

  void validateNickname(String text) async {
    nicknameController.resetStatus();
    if (text.isEmpty) {
      return;
    }

    if (nicknameValidate(text)) {
      nicknameController.setHasError(false);
      nicknameController.setIsEnable(true);
      nicknameController.setIsValid(true);
    } else {
      nicknameController.setErrorText('${tr('input_nickname_error_text')}');
      nicknameController.setHasError(true);
      nicknameController.setIsValid(false);
    }
    nickname = text;
    notifyListeners();
  }

  bool nicknameValidate(String val) {
    return val.length > 1 && val.length < 17;
  }

  Future<void> onClickRegistBtn() async {
    if (isLoad) return;
    setLoad(true);
    await emailUserRegist();
    setLoad(false);
  }

  Future<void> emailUserRegist() async {
    final isExist =
        await UserRepository().checkDuplicatedNickname(nickname: nickname);
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    final email = FirebaseAuth.instance.currentUser?.email ?? '';

    if (uid.isEmpty || email.isEmpty) {
      return;
    }

    if (isExist) {
      _showDuplicatedDialog();
      return;
    }

    final res = await UserRepository().createUserByEmail(
      uid: uid,
      nickname: nickname,
      email: email,
      gender: selectGender.code,
    );

    if (res) {
      state.context.goNamed(RootScreen.routeName);
    } else {
      // server error
    }
  }

  Future _showDuplicatedDialog() async {
    await showDialog(
      context: state.context,
      builder: (context) {
        return HobbyDialog(
          title: '${tr('app_en_title')}',
          content: '${tr('duplicated_nickname_dialog_text')}',
          itemList: [
            HobbyDialogBtnItem(
              title: '${tr('btn_confirm')}',
              onPressed: () {
                state.context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void notifyListeners() {
    if (state.mounted) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  InputRegistUserInfoViewModel(this.state);
}
