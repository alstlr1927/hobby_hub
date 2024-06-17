import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hobby_hub_app/common/components/custom_button/custom_button.dart';
import 'package:hobby_hub_app/common/components/custom_chip/hobby_chip.dart';
import 'package:hobby_hub_app/common/components/title_text_field/title_text_field.dart';
import 'package:hobby_hub_app/common/layout/default_layout.dart';
import 'package:hobby_hub_app/common/utils/hobby_style.dart';
import 'package:hobby_hub_app/common/utils/hobby_utils.dart';
import 'package:hobby_hub_app/login/view/login_landing_screen.dart';
import 'package:hobby_hub_app/user/types/type.dart';
import 'package:hobby_hub_app/user/view_model/input_regist_user_info_view_model.dart';
import 'package:provider/provider.dart';

import '../../common/utils/validator.dart';

class InputRegistUserInfo extends StatefulWidget {
  static String get routeName => 'input_user_info';

  const InputRegistUserInfo({super.key});

  @override
  State<InputRegistUserInfo> createState() => _InputRegistUserInfoState();
}

class _InputRegistUserInfoState extends State<InputRegistUserInfo> {
  late InputRegistUserInfoViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = InputRegistUserInfoViewModel(this);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InputRegistUserInfoViewModel>.value(
      value: viewModel,
      builder: (context, _) {
        return DefaultLayout(
          title: '${tr('regist_title')}',
          leading: _leading(),
          onPressed: () => viewModel.focusoutAll(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.toWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _InputNicknameArea(),
                const _SelectGenderArea(),
                Spacer(),
                const _RegistButtonArea(),
                SizedBox(
                    height: HobbyStyle.defaultBottomPadding() + 14.toWidth),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _leading() {
    return CupertinoButton(
      child: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
      onPressed: () {
        FirebaseAuth.instance.signOut();
        context.goNamed(LoginLandingScreen.routeName);
      },
    );
  }
}

class _InputNicknameArea extends StatelessWidget {
  const _InputNicknameArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputRegistUserInfoViewModel viewModel =
        Provider.of<InputRegistUserInfoViewModel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.toWidth),
        Text(
          '${tr('inpu_info_nickname_title')}',
          style: HobbyStyle.body1(weight: FontWeight.w500),
        ),
        SizedBox(height: 16.toWidth),
        TitleTextField(
          controller: viewModel.nicknameController,
          title: '${tr('nickname_title')}',
          hintText: '${tr('nickname_title')}',
          keyboardType: TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.deny(Validator().kWhiteSpaceRegex)
          ],
          autofillHints: const [AutofillHints.nickname],
          maxLength: 16,
          onChanged: viewModel.validateNickname,
          onSubmitted: (val) => viewModel.focusoutAll(),
        ),
      ],
    );
  }
}

class _SelectGenderArea extends StatelessWidget {
  const _SelectGenderArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputRegistUserInfoViewModel viewModel =
        Provider.of<InputRegistUserInfoViewModel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 36.toWidth),
        Text(
          '${tr('input_info_gender_title')}',
          style: HobbyStyle.body1(weight: FontWeight.w500),
        ),
        SizedBox(height: 16.toWidth),
        Selector<InputRegistUserInfoViewModel, GenderType>(
          selector: (_, prov) => prov.selectGender,
          builder: (_, selectGender, __) {
            return Row(
              children: List.generate(
                2,
                (index) {
                  final item = GenderType.values[index];
                  final isSelect = selectGender.idx == item.idx;
                  return SizedBox(
                    child: HobbyChip(
                      onPressed: () => viewModel.onClickGenderChip(item),
                      text: '${item.name}',
                      isSelect: isSelect,
                    ),
                  );
                },
              ).superJoin(SizedBox(width: 10.toWidth)).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _RegistButtonArea extends StatelessWidget {
  const _RegistButtonArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputRegistUserInfoViewModel viewModel =
        Provider.of<InputRegistUserInfoViewModel>(context, listen: false);
    return Selector<InputRegistUserInfoViewModel, String>(
      selector: (_, prov) => prov.nickname,
      builder: (_, nickname, __) {
        final isValid = viewModel.nicknameValidate(nickname);
        return HobbyButton(
          onPressed: isValid ? viewModel.onClickRegistBtn : null,
          option: HobbyButtonOption.fill(
            text: '${tr('regist_btn_title')}',
            theme: HobbyButtonFillTheme.magenta,
            style: HobbyButtonFillStyle.fullRegular,
          ),
        );
      },
    );
  }
}
