import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

class BaseInput extends StatefulWidget {
  final TextEditingController? ctrl;
  final String? hintText;
  // final Widget? label;
  final String? labelText;
  final TextInputType? keyboardType;
  final Function? validator;
  FocusNode? focusNode;
  final Function? onFieldSubmitted;

  BaseInput(
      {Key? key,
      this.ctrl,
      this.hintText,
      this.labelText,
      // this.label,
      this.keyboardType,
      this.onFieldSubmitted,
      this.focusNode,
      this.validator})
      : super(key: key);

  @override
  State<BaseInput> createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.ctrl,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      onFieldSubmitted: (value) => widget.onFieldSubmitted ?? (value),
      validator: (input) => widget.validator!(input),
      decoration: InputDecoration(
          labelText: widget.labelText,
          // labelStyle: tStyle.display14().w500().copyWith(
          //     color: (widget.focusNode?.hasFocus == true)
          //         ? AppColor.colorBlack
          //         : AppColor.colorPink),
          floatingLabelStyle: tStyle.display16().w500().copyWith(
                color: AppColor.colorPink,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey))),
    );
  }
}
