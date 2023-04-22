import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input.dart';
import 'package:flutter_social_media/presentation/shared_ui/base_input/base_input_configs.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_default.dart';
import 'package:flutter_social_media/presentation/shared_ui/btn/base_btn/btn_second.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

class SetUpInfoPage extends StatefulWidget {
  const SetUpInfoPage({super.key});

  @override
  State<SetUpInfoPage> createState() => _SetUpInfoPageState();
}

class _SetUpInfoPageState extends State<SetUpInfoPage> {
  final TextEditingController _nameController = TextEditingController();
  final String _birthday = "Birthday";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Set Up Your Information",
          style: tStyle.display24().w500().copyWith(
                color: AppColor.colorPink,
              ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              // child: Image.asset("assets/icons/iconLogo.png"),
            ),
            const SizedBox(
              height: 50,
            ),
            //input
            BaseInput(
              baseConfigs: BaseInputConfigs(
                controller: _nameController,
                labelText: "Username",
                maxLines: 1,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            //set hbirthday
            BtnSecond(
              type: BtnSecondType.secondary,
              title: _birthday,
            ),
            // const Spacer(),
            const SizedBox(
              height: 20,
            ),
            //btn sign in
            const Spacer(),
            const BtnDefault(
              title: "Done",
            ),
          ],
        ),
      ),
    );
  }
}
