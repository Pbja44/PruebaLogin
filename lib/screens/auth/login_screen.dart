import 'package:pruebatecnica/controllers/login_controller.dart';
import 'package:pruebatecnica/screens/auth/account_exists_screen.dart';
import 'package:pruebatecnica/screens/auth/auth_screen.dart';
import 'package:pruebatecnica/screens/auth/widgets/google_sign_button.dart';
import 'package:pruebatecnica/screens/auth/widgets/input_fields.dart';
import 'package:pruebatecnica/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/utils/app_variables.dart';
import '../../utils/colors.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

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
          Form(
            key: controller.formKey,
            child: Column(
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
                        'Log in or sign up',
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
                Divider(
                  height: 2,
                  color: AppColor.dividerColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextFieldWidget(
                    validator: 'success'.obs,
                    textEditingController: controller.emailController.value,
                    type: 'email',
                    hintText: 'Email'),
                const SizedBox(
                  height: 23,
                ),
                Obx(
                  () => (controller.isUser.value)
                      ? InputTextFieldWidget(
                          validator: 'success'.obs,
                          type: 'password',
                          textEditingController:
                              controller.passwordController.value,
                          obscureText: controller.obscureText.value,
                          hintText: 'Password',
                          iconData: IconButton(
                            onPressed: () {
                              controller.obscureText.value =
                                  !controller.obscureText.value;
                            },
                            icon: const Icon(Icons.remove_red_eye_outlined),
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => (controller.isUser.value)
                      ? const SizedBox(
                          height: 20,
                        )
                      : Container(),
                ),
                Obx(
                  () => (controller.isUser.value)
                      ? Container(
                          width: Get.width,
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: const Text(
                            'Forgot password?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF4F4F4F),
                              fontSize: 14,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => (controller.isUser.value)
                      ? const SizedBox(
                          height: 20,
                        )
                      : Container(),
                ),
                SubmitButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.isUser.value
                          ? controller.loginWithEmail()
                          : controller.checkEmail();
                    }
                  },
                  title: 'Continue',
                ),
              ],
            ),
          ),
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
                        color: AppColor.dividerColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Or',
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
                        color: AppColor.dividerColor,
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
                  authOption = AccountExistsScreen();
                  Get.back();
                  Get.bottomSheet(
                    AuthScreen(),
                    isScrollControlled: true,
                    enableDrag: false,
                  );
                },
                isGoogle: true,
                title: 'Continue with Google',
              ),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
