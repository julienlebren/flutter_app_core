library flutter_app_core;

//import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'ad_manager/ad_manager.dart';
export 'extensions/extensions.dart';
export 'firebase_auth_service/firebase_auth_service.dart';
export 'firebase_storage_service/firebase_storage_service.dart';
export 'firestore_service/firestore_service.dart';
export 'layout_builder/layout_builder.dart';
export 'localization/localization.dart';
export 'notifications/notifications.dart';
export 'purchases/purchases.dart';
export 'settings/settings.dart';
export 'sign_in/sign_in.dart';

export 'package:go_router/go_router.dart';

/*
class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  final AppTheme theme;
  final Purc

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<User?>(userProvider, (_, user) {
      if (user != null) {
        FirebaseCrashlytics.instance.setUserIdentifier(user.id!);
      }
    });

    return ProviderScope(
      overrides: [
        appThemeProvider.overrideWith(mcjTheme),
        purchasesSettingsProvider.overrideWith(mcjPurchasesSettings),
        authSettingsProvider.overrideWith(mcjAuthSettings),
        fcmTokenHandlerProvider.overrideWith(mcjTokenHandler),
        messageHandlerProvider.overrideWith(mcjMessageHandler),
        adSettingsProvider.overrideWith(mcjAdSettings),
        intersticialAdDisplayProvider.overrideWith(mcjIntersticialAdDisplay),
        signInThemeProvider.overrideWith(mcjSignInTheme),
        signInCustomRouterProvider.overrideWithValue(
          SignInCustomRouter.onGenerateRoute,
        ),
      ],
      child: PlatformApp(
        navigatorKey: NavigatorKeys.main,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings, ref),
        builder: (context, child) {
          return ProviderScope(
            overrides: [
              localizationProvider
                  .overrideWithValue(AppLocalizations.of(context)!),
              networkSettingsProvider.overrideWith(mcjNetworkSettings),
            ],
            child: child!,
          );
        },
        initialRoute: AppRoutes.splashPage,
        //home: const SplashPage(),
      ),
    );
  }
}
*/