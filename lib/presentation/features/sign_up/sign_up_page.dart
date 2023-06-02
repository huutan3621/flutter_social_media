// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/home/home_page.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input%20password.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_default.dart';
import 'package:flutter_social_media/presentation/shared_ui/date_picker/date_picker.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

const List<String> genderList = <String>['Male', 'Female', 'Other'];

class SignUpPage extends StatefulWidget {
  static const nameRoute = 'SignUpPage';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pswController = TextEditingController();
  final TextEditingController _isPswTrue = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();

  String _dropDownValue = genderList.first;
  //show and hide password
  bool _hidePw = false;
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColor.colorPink,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Sign Up",
          style: tStyle.display24().w600().copyWith(
                color: AppColor.colorPink,
              ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              ctrl: _nameController,
              labelText: "Name",
            ),
            Container(
              decoration: const BoxDecoration(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: InputDecorator(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  floatingLabelStyle: tStyle.display16().w500().copyWith(
                        color: AppColor.colorPink,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: DropdownButton<String>(
                  value: _dropDownValue,
                  icon: const Icon(
                    Icons.expand_more,
                  ),
                  underline: const SizedBox(),
                  onChanged: (String? value) {
                    setState(() {
                      _dropDownValue = value ?? "";
                    });
                  },
                  items: genderList.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    },
                  ).toList(),
                  // menuMaxHeight: 50,
                  isExpanded: true,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
              ),
            ),
            const DatePickerDefault(),
            BaseInput(
              ctrl: _infoController,
              labelText: "About you",
            ),
            BaseInput(
              ctrl: _emailController,
              labelText: "Email",
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
            BaseInputPassword(
              ctrl: _isPswTrue,
              hidePW: _hidePw,
              labelText: "Confirm Password",
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
                // await FirAuthRepo.createUserWithEmailAndPassword(
                //   email: _usernameController.text,
                //   password: _pswController.text,
                //   onFailure: (p0) {
                //     setState(() {
                //       passwordFeedbackType = FeedbackType.error;
                //       feedbackMessage = p0;
                //     });
                //   },
                //   onSuccess: (p0) async {
                //     final ref = AppConfig.shared.database$
                //         .ref("users/${p0.data?.user?.uid}");

                //     await ref.set(UserModel(
                //       email: _usernameController.text,
                //       username: _usernameController.text,
                //       createTime: DateTime.now(),
                //     ).toJson());

                //     await Navigator.of(context).pushAndRemoveUntil(
                //         MaterialPageRoute(
                //             builder: (_) => HomePage(
                //                   id: p0.data?.user?.uid ?? "",
                //                 )),
                //         (route) => false);
                //   },
                // );
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const HomePage()));
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Sign in',
                    style: tStyle.display16().w500().copyWith(
                          color: AppColor.colorPink,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
