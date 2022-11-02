import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class CustomButtonOutlined extends StatelessWidget {
  final String textButton;
  const CustomButtonOutlined({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(
                width: 1,
                color: CustomColors.customSwatchColor,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
          onPressed: () {},
          child: Text(
            textButton,
            style: const TextStyle(fontSize: 15),
          )),
    );
  }
}
