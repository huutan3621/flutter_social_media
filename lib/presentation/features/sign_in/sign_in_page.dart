import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/home/home_page.dart';
import 'package:flutter_social_media/presentation/features/sign_up/sign_up_page.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input%20password.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_default.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class SignInProvider extends StatelessWidget {
//   static const nameRoute = 'SignInProvider';
//   const SignInProvider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<SignInBloc>(
//           create: (BuildContext context) => SignInBloc(),
//         ),
//         BlocProvider<AuthBloc>(
//           create: (BuildContext context) => AuthBloc(),
//         )
//       ],
//       child: const SignInPage(),
//     );
//   }
// }

class SignInPage extends StatefulWidget {
  static const nameRoute = 'SignInPage';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // late final _bloc = context.read<SignInBloc>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pswController = TextEditingController();
  // late final _bloc = context.read<LoginBloc>();
  //input controller
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  String _username = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _loadAccount();
  }

  // Loading account value on start
  void _loadAccount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = (prefs.getString('_username') ?? "");
      _password = (prefs.getString('_password') ?? "");
    });
  }

  void saveAccountToLocaldb() async {
// Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
    await prefs.setString('_username', _usernameController.text);
    await prefs.setString('_password', _pswController.text);
  }

  //hide and show password
  late bool _hidePw = false;
  final bool _isChecked = false;
//checked the store account checkbox
  // bool isChecked = false;

  void _showHidePw() {
    setState(() {
      _hidePw = !_hidePw;
    });
    // _bloc.add(ToggleHidePwValue());
  }

  @override
  void dispose() {
    super.dispose();
  }

  FeedbackType feedbackType = FeedbackType.none;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  String? feedbackMessage;
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
                labelText: "Username",
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
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  }
                  // onTap: () async {
                  //   print(_pswController.text.toString());
                  //   // Navigator.of(context).push(MaterialPageRoute(
                  //   //     builder: (_) => const HomePage()));
                  // await context.read<AuthBloc>().add(
                  //       AuthLoginEvent(
                  //         email: _usernameController.text,
                  //         password: _pswController.text,
                  //       ),
                  //     );
                  // await FirAuthRepo.signInWithEmailAndPassword(
                  //   email: _usernameController.text,
                  //   password: _pswController.text,
                  //   onFailure: (p0) {
                  //     setState(() {
                  //       feedbackType = FeedbackType.error;
                  //       feedbackMessage = p0;
                  //     });
                  //   },
                  //   onSuccess: (p0) {
                  //     final id = p0.data?.user?.uid;
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => HomePage(
                  //                 id: _usernameController.text)));
                  //   },
                  // );
                  // },
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
                      // _bloc.add(
                      //     NavigateToSignUpPage(context: context));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const SignUpPage()));
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
  }
}
