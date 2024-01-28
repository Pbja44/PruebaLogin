// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/controllers/registeration_controller.dart';
import 'package:pruebatecnica/utils/colors.dart';

import '../../../controllers/login_controller.dart';
import '../../../utils/app_variables.dart';
import '../../congrats.dart';
import '../../loadScreen/load_screen.dart';
import '../auth_screen.dart';
import '../register_screen.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const SubmitButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    RegisterationController registerController =
        Get.put(RegisterationController());
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
        onPressed: onPressed,
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
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
        ),
      ),
    );
  }
}

class SkipSaveButton extends StatelessWidget {
  const SkipSaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterationController registerController =
        Get.put(RegisterationController());
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            child: const Text('Skip'),
            onPressed: () {
              Get.offAll(
                LoadScreen(
                  ruta: CongratsScreen(),
                ),
              );
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
                Get.offAll(
                  LoadScreen(
                    ruta: CongratsScreen(),
                  ),
                );
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
                          fontFamily: 'inter',
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
