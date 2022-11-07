import 'package:flutter/material.dart';

import '../config/custom_colors.dart';

class CustomLogoText extends StatelessWidget {
  final String firtText;
  final String lastText;
  final bool firtTextColorIsWhite;
  final double sizeText;

  const CustomLogoText({
    super.key,
    required this.firtText,
    this.firtTextColorIsWhite = false,
    required this.lastText,
    required this.sizeText,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(style: TextStyle(fontSize: sizeText), children: [
        TextSpan(
            text: firtText,
            style: TextStyle(
              color: firtTextColorIsWhite
                  ? Colors.white
                  : CustomColors.customSwatchColor,
              fontWeight: FontWeight.bold,
            )),
        TextSpan(
          text: lastText,
          style: TextStyle(
            color: CustomColors.customContrastColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ]),
    );
  }
}
