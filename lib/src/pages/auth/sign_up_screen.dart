import 'package:flutter/material.dart';
import 'package:greengrocer/src/custom/custom_elevated_button.dart';
import 'package:greengrocer/src/custom/custom_text_field_form.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  final cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {
    '#': RegExp(r'[0-9]'),
  });
  final phoneFormatter =
      MaskTextInputFormatter(mask: '(##) #.####.#####', filter: {
    '#': RegExp(r'[0-9]'),
  });

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text.rich(
                          TextSpan(style: TextStyle(fontSize: 35), children: [
                            TextSpan(
                                text: 'Cadastro',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFieldForm(
                          iconInput: Icons.file_copy,
                          labelInput: 'CPF',
                          inputFormatter: [cpfFormatter],
                        ),
                        const CustomTextFieldForm(
                            iconInput: Icons.person, labelInput: 'Name'),
                        const CustomTextFieldForm(
                            iconInput: Icons.email, labelInput: 'Email'),
                        CustomTextFieldForm(
                          iconInput: Icons.phone,
                          labelInput: 'Phone',
                          inputFormatter: [phoneFormatter],
                        ),
                        const CustomTextFieldForm(
                          iconInput: Icons.lock,
                          labelInput: 'Password',
                          isSecret: true,
                        ),
                        // CustomTextFieldForm(
                        //   iconInput: Icons.lock,
                        //   labelInput: 'Password Confirmation',
                        //   isSecret: true,
                        // ),
                        CustomElevetadButton(
                          textButton: 'CRIAR CONTA',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
