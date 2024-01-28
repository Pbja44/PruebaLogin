import 'package:pruebatecnica/controllers/login_controller.dart';
import 'package:pruebatecnica/controllers/registeration_controller.dart';
import 'package:pruebatecnica/screens/auth/login_screen.dart';
import 'package:pruebatecnica/screens/auth/widgets/google_sign_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_variables.dart';
import '../../utils/colors.dart';
import '../../utils/image_asset.dart';
import 'auth_screen.dart';

class AccountExistsScreen extends StatelessWidget {
  AccountExistsScreen({
    Key? key,
  }) : super(key: key);
  final RegisterationController registerationController =
      Get.put(RegisterationController());

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.1,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(
            20,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.close,
                      color: AppColor.black,
                      size: 25,
                    ),
                    const Text(
                      'Account already exists',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const SizedBox(width: 25.0),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 2,
                color: Color(0xFFAEB4C2),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 321,
                child: Text(
                  'This account has already been registered with a social network, log in with another method',
                  style: TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 14,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 220,
                  child: Image.asset(
                    AppImages.profileIcon,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Luis Ordoñez',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'user@brokr.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GoogleSignButton(
                onPressed: () {},
                isGoogle: true,
                title: 'Continue with Google',
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color(0xFFAEB4C2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Start with a different account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 14,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: const Color(0xFFAEB4C2),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GoogleSignButton(
                onPressed: () {
                  authOption = LoginScreen();
                  Get.back();
                  Get.bottomSheet(
                    AuthScreen(),
                    isScrollControlled: true,
                    enableDrag: false,
                  );
                },
                title: 'Back',
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
