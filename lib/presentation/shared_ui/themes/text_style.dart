import 'package:flutter/cupertino.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';

const tStyle = TextStyle(fontFamily: "Roboto");

extension AppTextStyle on TextStyle {
  //colors
  TextStyle cBrand() => copyWith(color: AppColor.colorPink);
  TextStyle cBtn() => copyWith(color: AppColor.colorWhite);
  TextStyle cTilte() => copyWith(color: AppColor.colorGrey);
  TextStyle cContent() => copyWith(color: AppColor.colorWhite);

  //weight
  TextStyle w100() => copyWith(fontWeight: FontWeight.w100);
  TextStyle w200() => copyWith(fontWeight: FontWeight.w200);
  TextStyle w300() => copyWith(fontWeight: FontWeight.w300);
  TextStyle w400() => copyWith(fontWeight: FontWeight.w400);
  TextStyle w500() => copyWith(fontWeight: FontWeight.w500);
  TextStyle w600() => copyWith(fontWeight: FontWeight.w600);
  TextStyle w700() => copyWith(fontWeight: FontWeight.w700);
  TextStyle w800() => copyWith(fontWeight: FontWeight.w800);
  TextStyle w900() => copyWith(fontWeight: FontWeight.w900);

  //display
  TextStyle display14() => copyWith(fontSize: 14);
  TextStyle display16() => copyWith(fontSize: 16);
  TextStyle display20() => copyWith(fontSize: 20);
  TextStyle display24() => copyWith(fontSize: 24);
  TextStyle display32() => copyWith(fontSize: 32);
  TextStyle display48() => copyWith(fontSize: 48);

  //custom
  TextStyle displayCustom(double customFontSize) =>
      copyWith(fontSize: customFontSize);
}
