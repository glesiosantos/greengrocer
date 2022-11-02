import 'package:flutter/material.dart';
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
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    onPressed: () {},
                    child: const Text(
                      'Acessar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 10,
                          color: Colors.grey.shade300,
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text('OU')),
                      Expanded(
                        child: Divider(
                          height: 10,
                          color: Colors.grey.shade300,
                          thickness: 2,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.green),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      onPressed: () {},
                      child: const Text(
                        'Criar Conta',
                        style: TextStyle(fontSize: 15),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
