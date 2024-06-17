import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hobby_hub_app/common/providers/go_router.dart';
import 'package:hobby_hub_app/common/providers/loading_provider.dart';
import 'package:hobby_hub_app/common/utils/const.dart';
import 'package:hobby_hub_app/common/utils/hobby_style.dart';
import 'package:hobby_hub_app/common/utils/hobby_utils.dart';
import 'package:hobby_hub_app/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart' as prov;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routeProvider);
    return EasyLocalization(
      supportedLocales: [Locale('ko', 'KR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ko', 'KR'),
      child: prov.MultiProvider(
        providers: [
          prov.ChangeNotifierProvider(
            create: (_) => LoadingProvider(),
          ),
        ],
        child: ScreenUtilInit(
            designSize: Device.get().isTablet! && Device.get().isAndroid!
                ? HobbyStyle.tabletDesignSize
                : HobbyStyle.defaultDesignSize,
            builder: (context, _) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: Constants.theme,
                title: Constants.appName,
                routerDelegate: router.routerDelegate,
                routeInformationParser: router.routeInformationParser,
                routeInformationProvider: router.routeInformationProvider,
                builder: (context, child) {
                  final MediaQueryData data = MediaQuery.of(context);
                  bool usingDeviceSize =
                      Device.get().isTablet! && Device.get().isAndroid!;
                  if (usingDeviceSize) {
                    HobbyStyle.applyDesignSize = HobbyStyle.tabletDesignSize;
                  }
                  ScreenUtil.init(context,
                      designSize: usingDeviceSize
                          ? HobbyStyle.tabletDesignSize
                          : HobbyStyle.defaultDesignSize);

                  return MediaQuery(
                    data: data.copyWith(
                        textScaler:
                            TextScaler.linear(Platform.isAndroid ? .95 : 1)),
                    child: child!,
                  );
                },
              );
            }),
      ),
    );
  }
}
