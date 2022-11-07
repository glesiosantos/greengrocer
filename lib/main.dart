import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

import 'src/auth/sign_in_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: CustomColors.customSwatchColor,
          scaffoldBackgroundColor: CustomColors.customBackgroundScaffoldColor),
      home: const SignInScreen(),
    );
  }
}
