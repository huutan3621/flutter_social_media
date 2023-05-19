import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

class BtnSetting extends StatelessWidget {
  final String? title;
  final IconData? leadingIcon;
  final void Function()? onTap;
  const BtnSetting({
    Key? key,
    this.title,
    this.leadingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
        title: Text(
          (title) ?? "",
          style: tStyle.display20().w400().copyWith(color: AppColor.colorBlack),
        ),
        leading: Icon(
          leadingIcon,
          color: AppColor.colorPink.withOpacity(0.7),
          size: 26,
        ),
        trailing: Icon(
          Icons.navigate_next_rounded,
          color: AppColor.colorPink.withOpacity(0.7),
        ),
        onTap: onTap,
      ),
    );
  }
}
