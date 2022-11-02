import 'package:flutter/material.dart';
import 'package:greengrocer/src/custom/custom_button_outlined.dart';
import 'package:greengrocer/src/custom/custom_elevated_button.dart';
import 'package:greengrocer/src/custom/custom_row_divider.dart';
import 'package:greengrocer/src/custom/custom_text_field_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomTextFieldForm(
                    iconInput: Icons.email, labelInput: 'Email'),
                const CustomTextFieldForm(
                  iconInput: Icons.lock,
                  labelInput: 'Password',
                  isSecret: true,
                ),
                const CustomElevetadButton(textButton: 'Acessar Perfil'),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const CustomRowDivider(),
                const CustomButtonOutlined(textButton: 'Criar minha conta'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
