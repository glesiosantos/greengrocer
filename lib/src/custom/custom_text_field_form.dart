import 'package:flutter/material.dart';

class CustomTextFieldForm extends StatefulWidget {
  final IconData iconInput;
  final String labelInput;
  final bool isSecret;

  const CustomTextFieldForm(
      {super.key,
      required this.iconInput,
      required this.labelInput,
      this.isSecret = false});

  @override
  State<CustomTextFieldForm> createState() => _CustomTextFieldFormState();
}

class _CustomTextFieldFormState extends State<CustomTextFieldForm> {
  bool isObscureText = false;

  @override
  void initState() {
    isObscureText = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        obscureText: isObscureText,
        decoration: InputDecoration(
          labelText: widget.labelInput,
          prefixIcon: Icon(widget.iconInput),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  icon: Icon(
                      isObscureText ? Icons.visibility : Icons.visibility_off))
              : null,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
