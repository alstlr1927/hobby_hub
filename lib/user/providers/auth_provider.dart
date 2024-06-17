import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hobby_hub_app/common/view/root_screen.dart';
import 'package:hobby_hub_app/login/view/email_login_screen.dart';
import 'package:hobby_hub_app/login/view/email_regist_screen.dart';
import 'package:hobby_hub_app/user/view/input_regist_user_info.dart';

import '../../common/view/splash_screen.dart';
import '../../login/view/login_landing_screen.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;
  AuthProvider({required this.ref}) {
    // ref.listen<UserModelBase?>(userMeProvider, (previous, next) {
    //   if (previous != next) {
    //     notifyListeners();
    //   }
    // });
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: RootScreen.routeName,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const RootScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
        GoRoute(
          path: '/splash',
          name: SplashScreen.routeName,
          builder: (_, __) => SplashScreen(),
        ),
        GoRoute(
          path: '/login_landing',
          name: LoginLandingScreen.routeName,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const LoginLandingScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          routes: [
            GoRoute(
              path: 'email_login',
              name: EmailLoginScreen.routeName,
              builder: (_, __) => EmailLoginScreen(),
            ),
            GoRoute(
              path: 'email_regist',
              name: EmailRegistScreen.routeName,
              builder: (_, __) => EmailRegistScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/input_user_info',
          name: InputRegistUserInfo.routeName,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const InputRegistUserInfo(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      ];

  Future<String?> redirectLogic(
      BuildContext context, GoRouterState state) async {
    // 로그인 정보가 있는지 없는지를 따져서 home으로 보낼지 login 으로 보낼지
    await Future.delayed(const Duration(milliseconds: 1200));
    return '/login_landing';
  }
}
