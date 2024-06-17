import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hobby_hub_app/common/components/base_button/base_button.dart';
import 'package:hobby_hub_app/common/layout/default_layout.dart';
import 'package:hobby_hub_app/common/utils/hobby_style.dart';
import 'package:hobby_hub_app/common/utils/hobby_utils.dart';
import 'package:hobby_hub_app/login/components/login_fill_button.dart';
import 'package:hobby_hub_app/login/view/email_login_screen.dart';
import 'package:hobby_hub_app/login/view/email_regist_screen.dart';
import 'package:hobby_hub_app/login/view_model/login_landing_view_model.dart';
import 'package:provider/provider.dart';

import '../../common/utils/images.dart';

class LoginLandingScreen extends StatefulWidget {
  static String get routeName => 'login_landing';

  const LoginLandingScreen({super.key});

  @override
  State<LoginLandingScreen> createState() => _LoginLandingScreenState();
}

class _LoginLandingScreenState extends State<LoginLandingScreen> {
  late LoginLandingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoginLandingViewModel(this);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginLandingViewModel>.value(
      value: viewModel,
      builder: (ctx, _) {
        return DefaultLayout(
          backgroundColor: HobbyStyle.white,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(ctx).padding.top + 60.toWidth),
              Image.asset(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenWidth,
                appLogo,
              ),
              Spacer(),
              _BottomLoginButton(),
            ],
          ),
        );
      },
    );
  }
}

class _BottomLoginButton extends StatelessWidget {
  const _BottomLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.toWidth),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoginFillButton(
            onPressed: () {},
            title: '${tr('kakao_regist_btn_text')}',
            image: AssetImage(kakaoLogo),
            backgroundColor: const Color(0xffFEE500),
          ),
          SizedBox(height: 12.toWidth),
          if (Platform.isIOS)
            LoginFillButton(
              onPressed: () {},
              title: '${tr('apple_regist_btn_text')}',
              image: AssetImage(appleLogo),
              backgroundColor: HobbyStyle.black,
              textColor: Colors.white,
            )
          else
            LoginFillButton(
              onPressed: () {},
              title: '${tr('google_regist_btn_text')}',
              image: AssetImage(googleLogo),
              backgroundColor: HobbyStyle.white,
            ),
          SizedBox(height: 16.toWidth),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLoginTextButton(
                onPressed: () async {
                  context.pushNamed(EmailLoginScreen.routeName);
                },
                title: '${tr('email_login_btn_text')}',
              ),
              Container(
                width: 1,
                height: 20.toWidth,
                margin: EdgeInsets.symmetric(horizontal: 14.toWidth),
                color: HobbyStyle.gray050,
              ),
              _buildLoginTextButton(
                onPressed: () {
                  context.pushNamed(EmailRegistScreen.routeName);
                },
                title: '${tr('email_regist_btn_text')}',
              ),
            ],
          ),
          SizedBox(height: HobbyStyle.defaultBottomPadding() + 20.toWidth),
        ],
      ),
    );
  }

  Widget _buildLoginTextButton({
    required VoidCallback onPressed,
    required String title,
  }) {
    return BaseButton(
      onPressed: onPressed,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 10.toWidth, horizontal: 16.toWidth),
        child: Text(
          '$title',
          style: HobbyStyle.body2(
            color: HobbyStyle.gray070,
            weight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
