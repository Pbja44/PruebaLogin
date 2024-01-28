import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/image_asset.dart';
import 'package:pruebatecnica/screens/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.bottomSheet(isScrollControlled: true, AuthScreen());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: Get.height / 6.1,
          child: GestureDetector(
            onTap: () {
              Get.bottomSheet(isScrollControlled: true, AuthScreen());
            },
            child: Image.asset(
              AppImages.splashLogo,
              width: 150.0,
            ),
          ),
        ),
      ),
    );
  }
}
