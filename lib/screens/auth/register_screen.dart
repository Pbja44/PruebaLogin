import 'package:pruebatecnica/controllers/registeration_controller.dart';
import 'package:pruebatecnica/screens/auth/profile_photo_screen.dart';
import 'package:pruebatecnica/screens/auth/widgets/input_fields.dart';
import 'package:pruebatecnica/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/utils/app_variables.dart';

import '../../utils/colors.dart';
import 'auth_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  RegisterationController registerationController =
      Get.put(RegisterationController());
  final _formKey = GlobalKey<FormState>();

  var isLogin = false.obs;
  var obscureText = true.obs;
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
        child: Form(
          key: _formKey,
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
                  textEditingController: registerationController.nameController,
                  type: 'name',
                  hintText: 'Name'),
              const SizedBox(
                height: 23,
              ),
              InputTextFieldWidget(
                  textEditingController:
                      registerationController.lastNameController,
                  type: 'name',
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
                  textEditingController:
                      registerationController.countryRegionController,
                  type: 'region',
                  hintText: 'Country/Region'),
              const SizedBox(
                height: 23,
              ),
              InputTextFieldWidget(
                  textEditingController:
                      registerationController.numberPhoneController,
                  type: 'phone',
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
                  textEditingController:
                      registerationController.emailController,
                  type: 'email',
                  hintText: 'Email'),
              const SizedBox(
                height: 23,
              ),
          InputTextFieldWidget(
                  textEditingController:
                      registerationController.passwordController,
                  type: 'password',
                  obscureText: true,
                  hintText: 'Password',
                  iconData: IconButton(
                    onPressed: () {
                      obscureText.value = !obscureText.value;
                    },
                    icon: const Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
             
              const SizedBox(
                height: 23,
              ),
            InputTextFieldWidget(
                  textEditingController:
                      registerationController.repetPasswordController,
                  type: 'repeatpassword',
                  obscureText: true,
                  hintText: 'Repeat password',
                  iconData: IconButton(
                    onPressed: () {
                      obscureText.value = !obscureText.value;
                    },
                    icon: const Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
              
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By clicking continue you are agreeing to our  ',
                        style: TextStyle(
                          color: Color(0xFF4F4F4F),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: Color(0xFF4F4F4F),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          color: Color(0xFF4F4F4F),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms & Conditions.',
                        style: TextStyle(
                          color: Color(0xFF4F4F4F),
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
                  if (_formKey.currentState!.validate()) {
                    registerationController.saveData();

                    authOption = const ProfilePhotoScreen();
                    Get.back();
                    Get.bottomSheet(
                        isScrollControlled: true, const AuthScreen());
                  }
                },
                title: 'Agree and continue',
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
