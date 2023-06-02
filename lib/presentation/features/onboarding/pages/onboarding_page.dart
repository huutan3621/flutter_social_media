import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/sign_in/sign_in_page.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared_ui/btn/base_btn/btn_default.dart';
import '../../../shared_ui/themes/colors.dart';
import '../../../shared_ui/themes/text_style.dart';
import '../widgets/onboarding_contents.dart';
import '../widgets/page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  static const nameRoute = 'OnBoardingPage';
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // final List<OnBoardingContent> _contents = new Li
  late int _currentIdx = 0;
  PageController? _controller;
  // List<OnBoardingContent> getOnboardingContent() {
  //   return _contents;
  // }
  List<OnBoardingContent> contents = [
    OnBoardingContent(
        imagePath: "assets/images/photo.svg",
        title: "Find a match",
        description: "Plenty of people waiting for you"),
    OnBoardingContent(
        imagePath: "assets/images/dialog.svg",
        title: "Send a message",
        description: "Show your love through the screen"),
    OnBoardingContent(
        imagePath: "assets/images/ring.svg",
        title: "Soulmates",
        description: "They're waiting for you. Let's get started!"),
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIdx = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        contents[index].imagePath ?? "",
                        height: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        contents[index].title ?? "",
                        style: tStyle
                            .display30()
                            .w700()
                            .copyWith(color: AppColor.colorBlack),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        contents[index].description ?? "",
                        style: tStyle
                            .display16()
                            .w400()
                            .copyWith(color: AppColor.colorGrey),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),

                      // Container(
                      //   height: 60,
                      //   decoration: const BoxDecoration(
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(14),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => PageIndicator(
                  idx: (_currentIdx == index) ? 25 : 10,
                  dotColor: (_currentIdx == index)
                      ? AppColor.colorPink
                      : AppColor.colorPink.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: BtnDefault(
              title: (_currentIdx == contents.length - 1) ? "Continue" : "Next",
              onTap: () {
                // _currentIdx = contents.length;
                // const int pages = contents.length - 1;
                switch (_currentIdx) {
                  case 2:
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SignInPage(),
                      ),
                    );
                    break;
                  default:
                    {
                      setState(() {
                        _controller?.nextPage(
                            duration: const Duration(microseconds: 100),
                            curve: Curves.bounceIn);
                      });
                    }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
