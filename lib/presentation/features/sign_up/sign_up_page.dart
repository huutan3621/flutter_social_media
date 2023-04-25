import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_default.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pswController = TextEditingController();
  final TextEditingController _isPswTrue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: tStyle.display24().w500().copyWith(
                color: AppColor.colorPink,
              ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
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
              const SizedBox(
                height: 50,
              ),
              //input
              BaseInput(
                ctrl: _usernameController,
                labelText: "Username",
              ),
              const SizedBox(
                height: 10,
              ),
              BaseInput(
                ctrl: _pswController,
                labelText: "Password",
              ),
              const SizedBox(
                height: 10,
              ),
              BaseInput(
                ctrl: _isPswTrue,
                labelText: "Retype Password",
              ),
              const SizedBox(
                height: 20,
              ),
              //btn sign in
              const BtnDefault(
                title: "Sign Up",
              ),
              const SizedBox(
                height: 10,
              ),
              //sign up hint
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: tStyle.display16().w500().copyWith(
                          color: AppColor.colorBlack,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign up',
                    style: tStyle.display16().w500().copyWith(
                          color: AppColor.colorPink,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
