import 'package:flutter/material.dart';

import '../config/custom_colors.dart';

class CustomFormSearch extends StatelessWidget {
  const CustomFormSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      hintText: 'Pesquise aqui ...',
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
        fontSize: 14,
        fontStyle: FontStyle.italic,
      ),
      prefixIcon: Icon(
        Icons.search,
        size: 21,
        color: CustomColors.customContrastColor,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          )),
    ));
  }
}
