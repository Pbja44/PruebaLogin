import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/screens/auth/widgets/submit_button.dart';
import 'package:pruebatecnica/utils/app_variables.dart';
import 'package:pruebatecnica/utils/colors.dart';

import '../controllers/login_controller.dart';
import '../utils/image_asset.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
    LoginController loginController = Get.put(LoginController());
  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                AppImages.congrasColor,
                width: 70.0,
                height: 70,
                fit: BoxFit.scaleDown,
              ),
              const Text(
                'Congratulations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              const SizedBox(
                width: 251,
                height: 42,
                child: Text(
                  'Thank you for completing your details now you can access the platform.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
              const Spacer(),
              SubmitButton(
                  onPressed: () {
                    
                    loginController.emailController.text =
                    emailLogin ; 
                    loginController.passwordController.text = password;
                    log(emailLogin);
                       loginController.loginWithEmail();
                   
                  },
                  title: "Continue"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.white,
    );
  }
}
