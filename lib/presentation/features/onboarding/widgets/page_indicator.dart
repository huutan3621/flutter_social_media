import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  double? idx;
  Color? dotColor;
  PageIndicator({
    Key? key,
    required this.idx,
    required this.dotColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: idx,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        color: dotColor,
      ),
    );
  }
}
