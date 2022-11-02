import 'package:flutter/material.dart';

class CustomButtonOutlined extends StatelessWidget {
  final String textButton;
  const CustomButtonOutlined({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1, color: Colors.green),
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
