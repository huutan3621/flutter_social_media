import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_social_media/presentation/features/home/home_page.dart';
import 'package:flutter_social_media/presentation/features/onboarding/pages/onboarding_page.dart';
import 'package:flutter_social_media/presentation/features/sign_in/sign_in_page.dart';
import 'package:flutter_social_media/presentation/features/sign_up/sign_up_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(
              // builder: (_) => const HomePage(
              //       id: "",
              //     ));
              builder: (_) => const OnBoardingPage());
        }

        if (settings.name == SignInPage.nameRoute) {
          return MaterialPageRoute(builder: (_) => const SignInPage());
        }

        if (settings.name == HomePage.nameRoute) {
          final String id = settings.arguments as String;
          return MaterialPageRoute<String>(
            builder: (_) => const HomePage(
                // id: id,
                ),
          );
        }

        if (settings.name == SignUpPage.nameRoute) {
          return MaterialPageRoute<String>(builder: (_) => const SignUpPage());
        }
        return null;

        // if (settings.name == ChangePasswordPage.nameRoute) {
        //   return MaterialPageRoute<String>(
        //       builder: (_) => const ChangePasswordPage());
        // }

        // if (settings.name == ForceChangePasswordPage.nameRoute) {
        //   return MaterialPageRoute<String>(
        //       builder: (_) => const ForceChangePasswordPage());
        // }

        // if (settings.name == ChangeUserProfilePage.nameRoute) {
        //   final Map<String, dynamic> argument =
        //       settings.arguments as Map<String, dynamic>;
        //   return MaterialPageRoute<String>(
        //       builder: (_) => ChangeUserProfilePage(null, argument["user"]));
        // }
        // return null;
      },
      initialRoute: '/',
      builder: EasyLoading.init(),
    );
  }
}
