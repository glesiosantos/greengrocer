import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/app_constant.dart';
import 'package:greengrocer/src/custom/custom_logo_text.dart';

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
      () => Get.offNamed(AppConstant.signInRoute),
    );
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
