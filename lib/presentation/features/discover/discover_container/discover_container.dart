import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

class DiscoverContainer extends StatelessWidget {
  final String? title;
  final String? imagePath;

  const DiscoverContainer({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
        image: DecorationImage(
            alignment: Alignment.center,
            fit: BoxFit.cover,
            image: AssetImage(
              imagePath ?? "",
            )),
        // color: Colors.black,
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title ?? "",
          style: tStyle.display16().w500().copyWith(color: AppColor.colorWhite),
        ),
      ),
    );
  }
}
