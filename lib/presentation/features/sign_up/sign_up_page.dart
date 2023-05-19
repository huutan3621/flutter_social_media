import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/home/home_page.dart';
import 'package:flutter_social_media/presentation/features/user/data/model/user_model.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input%20password.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_default.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';
import 'package:flutter_social_media/services/firebase/auth/fir_auth_repo.dart';
import 'package:flutter_social_media/shared/constants.dart';

class SignUpPage extends StatefulWidget {
  static const nameRoute = 'SignUpPage';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pswController = TextEditingController();
  final TextEditingController _isPswTrue = TextEditingController();
  //show and hide password
  bool _hidePw = true;
  void _showHidePw() {
    setState(() {
      _hidePw = !_hidePw;
    });
  }

  FeedbackType passwordFeedbackType = FeedbackType.none;
  String? feedbackMessage;

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
              BaseInputPassword(
                ctrl: _pswController,
                hidePW: _hidePw,
                labelText: "Password",
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: _showHidePw,
                    child: Icon(
                      _hidePw ? Icons.visibility_off : Icons.visibility,
                      color: AppColor.colorGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BaseInputPassword(
                ctrl: _isPswTrue,
                hidePW: _hidePw,
                labelText: "Password",
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: _showHidePw,
                    child: Icon(
                      _hidePw ? Icons.visibility_off : Icons.visibility,
                      color: AppColor.colorGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //btn sign in
              BtnDefault(
                title: "Sign Up",
                onTap: () async {
                  await FirAuthRepo.createUserWithEmailAndPassword(
                    email: _usernameController.text,
                    password: _pswController.text,
                    onFailure: (p0) {
                      setState(() {
                        passwordFeedbackType = FeedbackType.error;
                        feedbackMessage = p0;
                      });
                    },
                    onSuccess: (p0) async {
                      final ref = AppConfig.shared.database$
                          .ref("users/${p0.data?.user?.uid}");

                      await ref.set(UserModel(
                        email: _usernameController.text,
                        username: _usernameController.text,
                        createTime: DateTime.now(),
                      ).toJson());

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (_) => HomePage(
                                    id: p0.data?.user?.uid ?? "",
                                  )),
                          (route) => false);
                    },
                  );
                },
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
                    width: 5,
                  ),
                  Text(
                    'Sign in',
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
