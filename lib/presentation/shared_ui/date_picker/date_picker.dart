import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/text_style.dart';

class DatePickerDefault extends StatefulWidget {
  const DatePickerDefault({super.key});

  @override
  State<DatePickerDefault> createState() => _DatePickerDefaultState();
}

class _DatePickerDefaultState extends State<DatePickerDefault> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime.now(),
        builder: (
          BuildContext context,
          Widget? child,
        ) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColor.colorPink,
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
              colorScheme: const ColorScheme.light(
                primary: AppColor.colorPink,
              ).copyWith(
                secondary: AppColor.colorPink,
              ),
            ),
            child: child!,
          );
        },
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          floatingLabelStyle: tStyle.display16().w500().copyWith(
                color: AppColor.colorPink,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: const [Text("data")],
        ),
      ),
    );
  }
}
