import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobby_hub_app/common/components/custom_button/custom_button.dart';
import 'package:hobby_hub_app/login/view/login_landing_screen.dart';

class RootScreen extends StatelessWidget {
  static String get routeName => 'root';
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: HobbyButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              context.goNamed(LoginLandingScreen.routeName);
            },
            option: HobbyButtonOption.fill(
                text: 'LogOut',
                theme: HobbyButtonFillTheme.lightMagenta,
                style: HobbyButtonFillStyle.fullRegular),
          ),
        ),
      ),
    );
  }
}
