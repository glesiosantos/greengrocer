import 'package:flutter/material.dart';
import 'package:greengrocer/src/custom/custom_button_outlined.dart';
import 'package:greengrocer/src/custom/custom_elevated_button.dart';
import 'package:greengrocer/src/custom/custom_row_divider.dart';
import 'package:greengrocer/src/custom/custom_text_field_form.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(style: const TextStyle(fontSize: 40), children: [
                        const TextSpan(
                            text: 'Green',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                          text: 'grocer',
                          style: TextStyle(
                            color: CustomColors.customContrastColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(fontSize: 20),
                      child: SizedBox(
                        height: 30,
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45))),
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
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                              color: CustomColors.customContrastColor,
                              fontWeight: FontWeight.normal),
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
        ),
      ),
    );
  }
}
