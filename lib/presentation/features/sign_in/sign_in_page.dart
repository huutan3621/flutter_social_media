import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media/presentation/features/home/home_page.dart';
import 'package:flutter_social_media/presentation/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_default.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

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
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final _bloc = context.read<SignInBloc>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pswController = TextEditingController();
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
                    BaseInput(
                      labelText: "Password",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //btn sign in
                    BtnDefault(
                      title: "Sign In",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const HomePage()));
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
