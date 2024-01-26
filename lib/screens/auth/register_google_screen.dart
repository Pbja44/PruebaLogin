import 'package:pruebatecnica/controllers/registeration_controller.dart';
import 'package:pruebatecnica/screens/auth/widgets/input_fields.dart';
import 'package:pruebatecnica/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class RegisterGoogleScreen extends StatefulWidget {
  const RegisterGoogleScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<RegisterGoogleScreen> createState() => _RegisterGoogleScreenState();
}

class _RegisterGoogleScreenState extends State<RegisterGoogleScreen>
    with TickerProviderStateMixin {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  var isLogin = false.obs;
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 25.0),
                  Text(
                    'Complete sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(width: 25.0),
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
                type: 'name',
                textEditingController: registerationController.nameController,
                hintText: 'Name'),
            const SizedBox(
              height: 23,
            ),
            InputTextFieldWidget(
                type: 'name',
                textEditingController:
                    registerationController.lastNameController,
                hintText: 'Last name'),
            const SizedBox(
              height: 23,
            ),
            InputTextFielDatePickerdWidget(
                textEditingController:
                    registerationController.birthDayController,
                hintText: 'Birthday'),
            const SizedBox(
              height: 23,
            ),
            InputTextFieldWidget(
                type: 'region',
                textEditingController:
                    registerationController.countryRegionController,
                hintText: 'Country/Region'),
            const SizedBox(
              height: 23,
            ),
            InputTextFieldWidget(
                type: 'phone',
                textEditingController:
                    registerationController.numberPhoneController,
                hintText: 'Number Phone'),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                height: 2,
                color: AppColor.dividerColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InputTextFieldWidget(
                type: 'email',
                textEditingController: registerationController.emailController,
                hintText: 'Email'),
            const SizedBox(
              height: 50,
            ),
             Padding(
              padding:const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By clicking continue you are agreeing to our  ',
                      style: TextStyle(
                        color: AppColor.termConditionText,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: AppColor.termConditionText,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        color: AppColor.termConditionText,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms & Conditions.',
                      style: TextStyle(
                        color: AppColor.termConditionText,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SubmitButton(
              onPressed: () {
                // loginController.isUser.value?null :  loginController.loginWithEmail();
              },
              title: 'Agree and continue',
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
