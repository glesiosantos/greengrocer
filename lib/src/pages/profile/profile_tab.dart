import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/custom/custom_button_outlined.dart';
import 'package:greengrocer/src/custom/custom_elevated_button.dart';
import 'package:greengrocer/src/custom/custom_text_field_form.dart';
import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';

import '../../shared/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  )),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextFieldForm(
            iconInput: Icons.email,
            initialValue: appData.user.email,
            labelInput: 'Email',
            isReadOnly: true,
          ),
          CustomTextFieldForm(
            iconInput: Icons.person,
            labelInput: 'Nome Completo',
            initialValue: appData.user.name,
            isReadOnly: true,
          ),
          CustomTextFieldForm(
            iconInput: Icons.phone,
            labelInput: 'Phone',
            initialValue: appData.user.phone,
            isReadOnly: true,
          ),
          CustomButtonOutlined(
              textButton: 'atualizar senha'.toUpperCase(),
              onPressed: () => updatePassword())
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.security,
                        color: CustomColors.customSwatchColor,
                        size: 50,
                      ),
                    ),
                    const CustomTextFieldForm(
                      iconInput: Icons.password,
                      labelInput: 'Senha Atual',
                      isSecret: true,
                    ),
                    const CustomTextFieldForm(
                      iconInput: Icons.password,
                      labelInput: 'Senha',
                      isSecret: true,
                    ),
                    const CustomTextFieldForm(
                      iconInput: Icons.password,
                      labelInput: 'Confirmar Senha',
                      isSecret: true,
                    ),
                    CustomElevetadButton(
                        textButton: 'Atualizar'.toUpperCase(), onPressed: () {})
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  icon: const Icon(Icons.close),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
