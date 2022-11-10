import 'package:flutter/material.dart';
import 'package:greengrocer/src/custom/custom_button_outlined.dart';
import 'package:greengrocer/src/custom/custom_elevated_button.dart';
import 'package:greengrocer/src/custom/custom_row_divider.dart';
import 'package:greengrocer/src/custom/custom_text_field_form.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:greengrocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengrocer/src/shared/app_data.dart' as appData;

import '../../config/custom_colors.dart';
import '../../custom/custom_logo_text.dart';
import '../base/base_screen.dart';

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
                    const CustomLogoText(
                      firtText: 'Green',
                      lastText: 'grocer',
                      sizeText: 40,
                      firtTextColorIsWhite: true,
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(fontSize: 20),
                      child: SizedBox(
                        height: 30,
                        child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          animatedTexts: appData.categories
                              .map((c) => FadeAnimatedText(c))
                              .toList(),
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
                    CustomElevetadButton(
                      textButton: 'Acessar Perfil',
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const BaseSreen(),
                        ));
                      },
                    ),
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
                    CustomButtonOutlined(
                      textButton: 'Criar minha conta',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                      },
                    ),
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
