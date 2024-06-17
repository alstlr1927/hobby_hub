import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hobby_hub_app/common/components/base_button/base_button.dart';
import 'package:hobby_hub_app/common/components/custom_button/custom_button.dart';
import 'package:hobby_hub_app/common/components/title_text_field/title_text_field.dart';
import 'package:hobby_hub_app/common/layout/default_layout.dart';
import 'package:hobby_hub_app/common/utils/hobby_style.dart';
import 'package:hobby_hub_app/common/utils/hobby_utils.dart';
import 'package:hobby_hub_app/common/utils/images.dart';
import 'package:hobby_hub_app/login/components/login_fill_button.dart';
import 'package:hobby_hub_app/login/view_model/email_login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

import '../../common/utils/validator.dart';

class EmailLoginScreen extends StatefulWidget {
  static String get routeName => 'email_login';
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  late EmailLoginViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = EmailLoginViewModel(this);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmailLoginViewModel>.value(
      value: viewModel,
      builder: (context, _) {
        return DefaultLayout(
          title: '${tr('login_text')}',
          onPressed: viewModel.focusoutAll,
          resizeToAvoidBottomInset: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.toWidth),
            child: Column(
              children: [
                SizedBox(height: 32.toWidth),
                const _EmailPwInputWrapper(),
                SizedBox(height: 25.toWidth),
                const _EmailLoginButtonWrapper(),
                const Spacer(),
                const _SocialLoginButtonWrapper(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmailPwInputWrapper extends StatelessWidget {
  const _EmailPwInputWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmailLoginViewModel viewModel =
        Provider.of<EmailLoginViewModel>(context, listen: false);
    return Column(
      children: [
        TitleTextField(
          controller: viewModel.emailController,
          title: '${tr('input_email_title')}',
          hintText: '${tr('input_email_title')}',
          keyboardType: TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.deny(Validator().kWhiteSpaceRegex)
          ],
          autofillHints: const [AutofillHints.email],
          onChanged: viewModel.validateEmail,
          onSubmitted: (value) => viewModel.focusoutAll(),
        ),
        SizedBox(height: 6.toWidth),
        TitleTextField(
          controller: viewModel.pwController,
          title: '${tr('input_pw_title')}',
          hintText: '${tr('input_pw_title')}',
          isObscure: true,
          keyboardType: TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.deny(Validator().kWhiteSpaceRegex)
          ],
          autofillHints: const [AutofillHints.password],
          onChanged: viewModel.validatePassword,
          onSubmitted: (value) => viewModel.focusoutAll(),
        ),
        SizedBox(height: 12.toWidth),
        Selector<EmailLoginViewModel, bool>(
          selector: (_, prov) => prov.isRememberEmail,
          builder: (_, isRemember, __) {
            return GestureDetector(
              onTap: () => viewModel.setRememberEmail(!isRemember),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.toWidth),
                    width: 24.toWidth,
                    height: 24.toWidth,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          isRemember ? Colors.transparent : HobbyStyle.gray050,
                          BlendMode.srcATop),
                      child: Image.asset(checkCircle),
                    ),
                  ),
                  SizedBox(width: 4.toWidth),
                  Text(
                    '${tr('remember_email_btn')}',
                    style: HobbyStyle.body2(
                      color: HobbyStyle.gray080,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _EmailLoginButtonWrapper extends StatelessWidget {
  const _EmailLoginButtonWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmailLoginViewModel viewModel =
        Provider.of<EmailLoginViewModel>(context, listen: false);

    return StreamBuilder<bool>(
      initialData: false,
      stream: Rx.combineLatest2(
          viewModel.emailController.statusStream!,
          viewModel.pwController.statusStream!,
          (a, b) => (a.isValid && b.isValid)),
      builder: (context, snapshot) {
        bool isChecked = snapshot.data!;
        return HobbyButton(
          onPressed: isChecked ? viewModel.onClickLoginButton : null,
          option: HobbyButtonOption.fill(
            text: '${tr('login_btn_title')}',
            theme: HobbyButtonFillTheme.magenta,
            style: HobbyButtonFillStyle.fullRegular,
          ),
        );
      },
    );
  }
}

class _SocialLoginButtonWrapper extends StatelessWidget {
  const _SocialLoginButtonWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (Platform.isIOS) ...{
          LoginFillButton(
            onPressed: () {},
            title: '${tr('apple_login_btn_text')}',
            image: AssetImage(appleLogo),
            textColor: Colors.white,
          ),
          SizedBox(height: 12.toWidth),
          LoginFillButton(
            onPressed: () {},
            title: '${tr('google_login_btn_text')}',
            image: AssetImage(googleLogo),
            backgroundColor: Colors.white,
          ),
        } else ...{
          LoginFillButton(
            onPressed: () {},
            title: '${tr('google_login_btn_text')}',
            image: AssetImage(googleLogo),
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 12.toWidth),
          LoginFillButton(
            onPressed: () {},
            title: '${tr('apple_login_btn_text')}',
            image: AssetImage(appleLogo),
            textColor: Colors.white,
          ),
        },
        SizedBox(height: 10.toWidth),
        _buildRowText(),
        SizedBox(height: 10.toWidth),
        _buildKakaoBtn(),
        SizedBox(height: HobbyStyle.defaultBottomPadding() + 22.toWidth),
      ],
    );
  }

  Widget _buildKakaoBtn() {
    return BaseButton(
      onPressed: () {},
      child: Container(
        width: 42.toWidth,
        height: 42.toWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFFEE500),
        ),
        child: Image.asset(kakaoLogo, width: 16.toWidth),
      ),
    );
  }

  Widget _buildRowText() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: 1,
            color: HobbyStyle.gray030,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.toWidth),
          child: Text(
            '${tr('or_text')}',
            style: HobbyStyle.body2(color: HobbyStyle.gray060),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: 1,
            color: HobbyStyle.gray030,
          ),
        ),
      ],
    );
  }
}
