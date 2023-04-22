import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input_configs.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_default.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pswController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 280,
                width: 280,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset("assets/icons/iconLogo.png"),
              ),
              Text(
                "Dating Social Media",
                style: tStyle
                    .display32()
                    .w800()
                    .copyWith(color: AppColor.colorPink),
              ),
              Text(
                "Your only dating social media",
                style: tStyle
                    .display20()
                    .w500()
                    .copyWith(color: AppColor.colorGrey),
              ),
              const SizedBox(
                height: 50,
              ),
              //input
              BaseInput(
                baseConfigs: BaseInputConfigs(
                  controller: _usernameController,
                  labelText: "Username",
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BaseInput(
                baseConfigs: BaseInputConfigs(
                  controller: _pswController,
                  labelText: "Password",
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //btn sign in
              const BtnDefault(
                title: "Sign In",
              ),
              const SizedBox(
                height: 10,
              ),
              //sign up hint
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: tStyle.display16().w500().copyWith(
                          color: AppColor.colorBlack,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign in',
                    style: tStyle.display16().w500().copyWith(
                          color: AppColor.colorPink,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              const Text("2023 huutan3621 project")
            ],
          ),
        ),
      ),
    );
  }
}
