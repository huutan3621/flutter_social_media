import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';

class AppDrawerButton extends StatelessWidget {
  final String? drawerTitle;
  final IconData? leadingIcon;
  final void Function()? onTap;
  const AppDrawerButton({
    Key? key,
    this.drawerTitle,
    this.leadingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
      title: Text(
        (drawerTitle) ?? "",
        style: const TextStyle(color: AppColor.colorBlack),
      ),
      leading: Icon(
        leadingIcon,
        color: AppColor.colorPink.withOpacity(0.5),
      ),
      trailing: const Icon(
        Icons.navigate_next_rounded,
        color: AppColor.colorPink,
      ),
      onTap: onTap,
    );
  }
}
