import 'package:flutter/material.dart';
import 'package:greengrocer/src/custom/custom_logo_text.dart';
import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          image: const DecorationImage(
              image: ExactAssetImage(
                'assets/images/background.png',
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: const [
            Center(
              child: CustomLogoText(
                firtText: 'Green',
                lastText: 'grocer',
                sizeText: 46,
                firtTextColorIsWhite: true,
              ),
            ),
            Positioned.fill(
                bottom: 20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
