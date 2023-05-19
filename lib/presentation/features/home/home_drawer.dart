import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media/presentation/features/home/base_drawer_button.dart';
import 'package:flutter_social_media/presentation/features/user/data/model/user_model.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_default.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

import '../auth/auth_bloc.dart';

class HomeDrawer extends StatefulWidget {
  final String? drawerUsername;
  final String? drawerAvatarLink;
  final UserModel? user;
  // late int? pageNumber;
  // final String? pageName;
  const HomeDrawer({
    Key? key,
    this.drawerUsername,
    this.drawerAvatarLink,
    this.user,
    // this.pageNumber,
  }) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: AppColor.colorPink.withOpacity(0.1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 32,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (widget.drawerUsername) ?? "",
                        style: tStyle
                            .w500()
                            .display20()
                            .copyWith(color: AppColor.colorPink),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).pushNamed(
                            //     arguments: {"user": widget.user},
                            //     ChangeUserProfilePage.nameRoute);
                          },
                          child: Text(
                            "Cài đặt tài khoản",
                            style: tStyle.w400().display14().copyWith(
                                  color: AppColor.colorBlack,
                                ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            // height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              AppDrawerButton(
                leadingIcon: Icons.home_outlined,
                drawerTitle: "Trang chủ",
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              AppDrawerButton(
                leadingIcon: Icons.password_outlined,
                drawerTitle: "Đổi mật khẩu",
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (_) => const ForceChangePasswordPage(),
                  //   ),
                  // );
                  // Navigator.pop(context);
                },
              ),
              const Spacer(),
              InkWell(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BtnDefault(
                      onTap: () {
                        context.read<AuthBloc>().add(AuthLogoutEvent());
                      },
                      type: BtnDefaultType.secondary,
                      title: "Đăng xuất",
                    )),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
