import 'package:flutter/material.dart';

class CustomElevetadButton extends StatelessWidget {
  final String textButton;
  const CustomElevetadButton({super.key, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        onPressed: () {},
        child: Text(
          textButton,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
