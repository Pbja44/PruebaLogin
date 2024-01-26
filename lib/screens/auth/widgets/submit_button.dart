// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/controllers/registeration_controller.dart';
import 'package:pruebatecnica/utils/colors.dart';

import '../../../controllers/login_controller.dart';
import '../../../utils/app_variables.dart';
import '../auth_screen.dart';
import '../register_screen.dart';

class SubmitButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String title;
  const SubmitButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton>
    with TickerProviderStateMixin {
  LoginController loginController = Get.put(LoginController());
  RegisterationController registerController =
      Get.put(RegisterationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), side: BorderSide.none),
          backgroundColor: AppColor.buttonColor,
        ),
        onPressed: widget.onPressed,
        child: Obx(
          () => (loginController.isLoading.value ||
                  registerController.isLoading.value)
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: AppColor.circularProgresbackgroundColor,
                    color: AppColor.circularProgresColor,
                  ),
                )
              : Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
        ),
      ),
    );
  }
}

class SkipSaveButton extends StatefulWidget {
  const SkipSaveButton({
    Key? key,
  }) : super(key: key);

  @override
  State<SkipSaveButton> createState() => _SkipSaveButtonState();
}

class _SkipSaveButtonState extends State<SkipSaveButton>
    with TickerProviderStateMixin {
  LoginController loginController = Get.put(LoginController());
  RegisterationController registerController =
      Get.put(RegisterationController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            child: const Text('Skip'),
            onPressed: () {
              Get.back();
              authOption = const RegisterScreen();

              Get.bottomSheet(isScrollControlled: true, const AuthScreen());
            },
          ),
          Container(
            width: 150,
            height: 50,
            decoration: ShapeDecoration(
              color: AppColor.saveColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: TextButton(
              onPressed: () {
                registerController.registerWithEmail();
              },
              child: Obx(
                () => (registerController.isLoading.value)
                    ? SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          backgroundColor:
                              AppColor.circularProgresbackgroundColor,
                          color: AppColor.circularProgresColor,
                        ),
                      )
                    : const Text(
                        'Save',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
