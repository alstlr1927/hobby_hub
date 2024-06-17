import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobby_hub_app/common/layout/default_layout.dart';
import 'package:hobby_hub_app/common/utils/logger.dart';
import 'package:hobby_hub_app/common/view/root_screen.dart';
import 'package:hobby_hub_app/login/repository/login_repository.dart';
import 'package:hobby_hub_app/login/view/login_landing_screen.dart';
import 'package:hobby_hub_app/user/view/input_regist_user_info.dart';

class SplashScreen extends StatefulWidget {
  static String get routeName => 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _userLoginStateCheck();
  }

  Future<void> _userLoginStateCheck() async {
    await Future.delayed(const Duration(milliseconds: 1400));
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      goNamed(LoginLandingScreen.routeName);
      HobbyLog().i('user is null');
    } else {
      if (user.emailVerified) {
        HobbyLog().i('verified');
        final res = await LoginRepository().getUserByUid(uid: user.uid);
        if (res != null && res.exists) {
          goNamed(RootScreen.routeName);
        } else {
          goNamed(InputRegistUserInfo.routeName);
        }
      } else {
        HobbyLog().i('not verified');
        FirebaseAuth.instance.signOut();
        goNamed(LoginLandingScreen.routeName);
      }
    }
  }

  void streamListener(User? user) async {}

  void goNamed(String routeName) {
    if (mounted) {
      context.goNamed(routeName);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.black,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
