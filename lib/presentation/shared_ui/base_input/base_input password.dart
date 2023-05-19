import 'package:flutter/material.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/colors.dart';
import 'package:flutter_social_media/presentation/shared_ui/themes/text_style.dart';

class BaseInputPassword extends StatefulWidget {
  final TextEditingController? ctrl;
  final String? hintText;
  // final Widget? label;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? hidePW;
  final Function? validator;
  FocusNode? focusNode;
  final Function? onFieldSubmitted;
  final Widget? clearButton;
  final InputDecoration? decoration;

  BaseInputPassword({
    Key? key,
    this.ctrl,
    this.hintText,
    this.labelText,
    // this.label,
    this.keyboardType,
    this.hidePW,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    this.clearButton,
    this.decoration,
  }) : super(key: key);

  @override
  State<BaseInputPassword> createState() => _BaseInputPasswordState();
}

class _BaseInputPasswordState extends State<BaseInputPassword> {
  @override
  TextEditingController? get controller => widget.ctrl;
  @override
  InputDecoration? get decoration => widget.decoration;
  //override the input
  @override
  void initState() {
    widget.ctrl?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.ctrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildSuffixIcon() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.ctrl?.text != null && widget.ctrl!.text.isNotEmpty)
            InkWell(
              onTap: () {
                setState(() {
                  (widget.ctrl)?.clear();
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: widget.clearButton,
              ),
            ),
          decoration?.suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: decoration?.suffixIcon,
                )
              : const SizedBox(),
        ],
      );
    }

    return TextFormField(
        controller: widget.ctrl,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        obscureText: widget.hidePW ?? false,
        onFieldSubmitted: (value) => widget.onFieldSubmitted ?? (value),
        validator: (input) => widget.validator!(input),
        decoration: decoration?.copyWith(
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
            borderSide: const BorderSide(color: Colors.grey),
          ),
          suffixIcon: buildSuffixIcon(),
        ));
  }
}

enum FeedbackType {
  error,
  warning,
  success,
  none,
}
