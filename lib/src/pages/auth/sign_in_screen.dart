import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/app_constant.dart';
import 'package:greengrocer/src/controllers/auth_controller.dart';
import 'package:greengrocer/src/custom/custom_button_outlined.dart';
import 'package:greengrocer/src/custom/custom_elevated_button.dart';
import 'package:greengrocer/src/custom/custom_row_divider.dart';
import 'package:greengrocer/src/custom/custom_text_field_form.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:greengrocer/src/shared/app_data.dart' as appData;

import '../../config/custom_colors.dart';
import '../../custom/custom_logo_text.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInScreen({super.key});

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFieldForm(
                        controller: _emailController,
                        iconInput: Icons.email,
                        labelInput: 'Email',
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'O campo e-mail é obrigatório';
                          }

                          if (!email.isEmail) {
                            return 'Informe um e-mail válido';
                          }

                          return null;
                        },
                      ),
                      CustomTextFieldForm(
                        controller: _passwordController,
                        iconInput: Icons.lock,
                        labelInput: 'Password',
                        isSecret: true,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'O campo senha é obrigatório';
                          }

                          if (password.length < 6) {
                            return 'O campo senha deverá conter no minimo 6 caracteres';
                          }

                          return null;
                        },
                      ),
                      GetX<AuthController>(
                        builder: (controller) {
                          return CustomElevetadButton(
                            isLoading: controller.isLoading.value,
                            textButton: 'Acessar Perfil',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.signIn(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                                _emailController.text = '';
                                _passwordController.text = '';
                                Get.offNamed(AppConstant.homeRoute);
                              } else {
                                print('campos não validos');
                              }
                            },
                          );
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
                        onPressed: () => Get.toNamed(AppConstant.signUpRoute),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  clearInput() {
    _emailController.text = '';
    _passwordController.text = '';
  }
}
