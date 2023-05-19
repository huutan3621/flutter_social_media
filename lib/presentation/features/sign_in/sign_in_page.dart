import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media/presentation/features/home/home_page.dart';
import 'package:flutter_social_media/presentation/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_social_media/presentation/features/user/data/model/user_model.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input%20password.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_default.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';
import 'package:flutter_social_media/services/firebase/auth/fir_auth_repo.dart';
import 'package:flutter_social_media/shared/constants.dart';

class SignInProvider extends StatelessWidget {
  const SignInProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: const SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  static const nameRoute = 'SignInPage';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final _bloc = context.read<SignInBloc>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pswController = TextEditingController();
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
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        if (state is SignInInitial) {
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
                      height: 20,
                    ),
                    //btn sign in
                    BtnDefault(
                      title: "Sign In",
                      onTap: () async {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (_) => const HomePage()));
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
                          "Don't have an account?",
                          style: tStyle.display16().w500().copyWith(
                                color: AppColor.colorBlack,
                              ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            _bloc.add(NavigateToSignUpPage(context: context));
                          },
                          child: Text(
                            'Sign up',
                            style: tStyle.display16().w500().copyWith(
                                  color: AppColor.colorPink,
                                ),
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
        } else {
          return Container();
        }
      },
    );
  }
}
