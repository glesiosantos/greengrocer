import 'package:flutter/material.dart';

class CustomElevetadButton extends StatelessWidget {
  final String textButton;
  final Function() onPressed;
  final bool isLoading;

  const CustomElevetadButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        onPressed: isLoading ? null : onPressed,
        child: !isLoading
            ? Text(
                textButton,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              )
            : const CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 10,
              ),
      ),
    );
  }
}
