import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/features/settings/btn_setting/btn_setting.dart';
import 'package:flutter_social_media/presentation/features/settings/btn_setting/btn_setting_second.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Settings",
          style: tStyle.display32().w500().copyWith(color: AppColor.colorPink),
        ),
        actions: [
          GestureDetector(
            child: Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            BtnSetting(
              title: 'Change Email',
              leadingIcon: Icons.person_outline,
              onTap: () {},
            ),
            BtnSetting(
              title: 'Change Password',
              leadingIcon: Icons.security_outlined,
              onTap: () {},
            ),
            BtnSetting(
              title: 'Notification',
              leadingIcon: Icons.notifications_outlined,
              onTap: () {},
            ),
            BtnSetting(
              title: 'Message',
              leadingIcon: Icons.message_outlined,
              onTap: () {},
            ),
            BtnSetting(
              title: 'Storage',
              leadingIcon: Icons.person_outline,
              onTap: () {},
            ),
            BtnSettingSecond(
              leadingIcon: Icons.logout,
              title: 'Log out',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
