import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldForm extends StatefulWidget {
  final IconData iconInput;
  final String labelInput;
  final List<TextInputFormatter>? inputFormatter;
  final String? initialValue;
  final bool isReadOnly;
  final bool isSecret;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFieldForm(
      {super.key,
      required this.iconInput,
      required this.labelInput,
      this.inputFormatter,
      this.initialValue,
      this.isReadOnly = false,
      this.isSecret = false,
      this.validator,
      this.controller});

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
        controller: widget.controller,
        inputFormatters: widget.inputFormatter,
        obscureText: isObscureText,
        readOnly: widget.isReadOnly,
        enabled: widget.isReadOnly ? false : true,
        initialValue: widget.initialValue,
        validator: widget.validator,
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
