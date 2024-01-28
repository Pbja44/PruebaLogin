import 'package:pruebatecnica/controllers/registeration_controller.dart';
import 'package:pruebatecnica/screens/auth/widgets/input_fields.dart';
import 'package:pruebatecnica/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';

class RegisterScreen extends GetView<RegisterationController> {
  RegisterScreen({
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
      child: SingleChildScrollView(
        child: Obx(
          () => Form(
            key: controller.formKey,
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
                          fontFamily: 'inter',
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
                Obx(
                  () => InputTextFieldWidget(
                    validator: controller.validApiName,
                    textEditingController: controller.nameController.value,
                    type: 'name',
                    hintText: 'Name',
                    iconData: controller.isValidator.value
                        ? controller.validApiName.value == 'success'
                            ? const Icon(
                                Icons.check,
                                color: AppColor.green,
                              )
                            : const Icon(
                                Icons.close,
                                color: AppColor.red,
                              )
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                InputTextFieldWidget(
                  validator: controller.validApiLastName,
                  textEditingController: controller.lastNameController.value,
                  type: 'name',
                  hintText: 'Last name',
                  iconData: controller.isValidator.value
                      ? controller.validApiLastName.value == 'success'
                          ? const Icon(
                              Icons.check,
                              color: AppColor.green,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColor.red,
                            )
                      : null,
                ),
                const SizedBox(
                  height: 23,
                ),
                InputTextFielDatePickerdWidget(
                  validator: controller.validApiBirthday,
                  textEditingController: controller.birthDayController.value,
                  hintText: 'Birthday',
                ),
                const SizedBox(
                  height: 23,
                ),
                InputTextFieldWidget(
                  validator: controller.validApiRegion,
                  textEditingController:
                      controller.countryRegionController.value,
                  type: 'region',
                  hintText: 'Country/Region',
                  iconData: controller.isValidator.value
                      ? controller.validApiRegion.value == 'success'
                          ? const Icon(
                              Icons.check,
                              color: AppColor.green,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColor.red,
                            )
                      : null,
                ),
                const SizedBox(
                  height: 23,
                ),
                InputTextFieldWidget(
                  validator: controller.validApiPhone,
                  textEditingController: controller.numberPhoneController.value,
                  type: 'phone',
                  hintText: 'Number Phone',
                  iconData: controller.isValidator.value
                      ? controller.validApiPhone.value == 'success'
                          ? const Icon(
                              Icons.check,
                              color: AppColor.green,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColor.red,
                            )
                      : null,
                ),
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
                  validator: controller.validApiEmail,
                  textEditingController: controller.emailController.value,
                  type: 'email',
                  hintText: 'Email',
                  iconData: controller.isValidator.value
                      ? controller.validApiEmail.value == 'success'
                          ? const Icon(
                              Icons.check,
                              color: AppColor.green,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColor.red,
                            )
                      : null,
                ),
                const SizedBox(
                  height: 23,
                ),
                InputTextFieldWidget(
                  validator: controller.validApiPassword,
                  textEditingController: controller.passwordController.value,
                  type: 'password',
                  obscureText: controller.obscureText.value,
                  hintText: 'Password',
                  iconData: IconButton(
                    onPressed: () {
                      controller.obscureText.value =
                          !controller.obscureText.value;
                    },
                    icon: const Icon(Icons.remove_red_eye_outlined),
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                InputTextFieldWidget(
                  validator: controller.validApiRepeatPassword,
                  textEditingController:
                      controller.repetPasswordController.value,
                  type: 'repeatpassword',
                  obscureText: controller.obscureText2.value,
                  hintText: 'Repeat password',
                  iconData: IconButton(
                    onPressed: () {
                      controller.obscureText2.value =
                          !controller.obscureText2.value;
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
                          text:
                              'By clicking continue you are agreeing to our  ',
                          style: TextStyle(
                            color: Color(0xFF4F4F4F),
                            fontSize: 14,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF4F4F4F),
                            fontSize: 14,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: Color(0xFF4F4F4F),
                            fontSize: 14,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms & Conditions.',
                          style: TextStyle(
                            color: Color(0xFF4F4F4F),
                            fontSize: 14,
                            fontFamily: 'inter',
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
                  onPressed: () async {
                    await controller.registerWithEmail();
                  },

                  //  controller.isLoading.value
                  //     ? () {}
                  //     : () async {
                  //         controller.isLoading.value = true;

                  //         await controller.resetValidator();
                  //         if (_formKey.currentState!.validate()) {
                  //           isValidator.value = true;
                  //           controller.saveData();
                  //           await controller.registerWithEmail();

                  //           if (controller.isAllTrue.value) {
                  //             isValidator.value = true;
                  //             authOption = ProfilePhotoScreen();
                  //             Get.back();
                  //             Get.bottomSheet(
                  //                 isScrollControlled: true, AuthScreen());
                  //           } else {
                  //             isValidator.value = true;
                  //             controller.isLoading.value = false;

                  //             _formKey.currentState!.validate();
                  //           }
                  //         }
                  //         controller.isLoading.value = false;
                  //         isValidator.value = false;
                  // },
                  title: 'Agree and continue',
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
