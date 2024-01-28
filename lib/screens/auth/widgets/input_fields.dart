// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pruebatecnica/utils/colors.dart';
import 'package:pruebatecnica/utils/image_asset.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Widget? iconData;
  final bool obscureText;
  final RxString validator;
  final String type;

  const InputTextFieldWidget(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      required this.type,
      required this.validator,
      this.iconData,
      this.obscureText = false});

  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        obscureText: obscureText,
        controller: textEditingController,
        keyboardType:
            type == 'phone' ? TextInputType.phone : TextInputType.name,
        decoration: InputDecoration(
          suffixIcon: iconData,
          labelStyle: TextStyle(
            color: AppColor.dividerColor,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.dividerColor,
            ),
          ),
        ),
        validator: (value) {
          if (type == 'email') {
            // if (value.toString().isEmpty) {
            //   return 'Email is empty';
            // }
            // if (!_emailRegex.hasMatch(value.toString())) {
            //   return 'Email address is not valid';
            // }
            if (validator.value != 'success') {
              return validator.value;
            }
          }
          if (type == 'name') {
            // if (value.toString().isEmpty) {
            //   return 'Name is empty';
            // }
            if (validator.value != 'success') {
              return validator.value;
            }
          }
          if (type == 'lastname') {
            // if (value.toString().isEmpty) {
            //   return 'Name is empty';
            // }
            if (validator.value != 'success') {
              return validator.value;
            }
          }
          if (type == 'birthday') {
            // if (value.toString().isEmpty) {
            //   return 'Name is empty';
            // }
            if (validator.value != 'success') {
              return validator.value;
            }
          }
          if (type == 'region') {
            // if (value.toString().isEmpty) {
            //   return 'Region is empty';
            // }
            if (validator.value != 'success') {
              return validator.value;
            }
          }
          if (type == 'phone') {
            // if (value.toString().isEmpty) {
            //   return 'Number Phone is empty';
            // }
            if (validator.value != 'success') {
              return validator.value;
            }
          }

          if (type == 'password') {
            // if (value.toString().isEmpty) {
            //   return passwordValidator(value.toString());
            // }
            if (validator.value != 'success') {
              return validator.value;
            }
          }
          if (type == 'repeatpassword') {
            // if (value.toString().isEmpty) {
            //   return passwordValidator(value.toString());
            // }
            if (validator.value != 'success') {
              return validator.value;
            }
          }

          return null;
        },
      ),
    );
  }

  passwordValidator(String password) {
    if (password.isEmpty) {
      return 'Password empty';
    } else if (password.length < 3) {
      return 'PasswordShort';
    }
    return null;
  }
}

class InputTextFielDatePickerdWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final RxString validator;

  const InputTextFielDatePickerdWidget({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        onTap: () {
          cupertino.showCupertinoModalPopup(
              context: context,
              builder: (_) => Container(
                    height: 320,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60,
                            height: 6,
                            decoration: ShapeDecoration(
                              color: Color(0x33001227),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            cupertino.CupertinoButton(
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(0xFF007AFF),
                                  fontSize: 14,
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            Material(
                              child: Text(
                                'Date of birth',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            cupertino.CupertinoButton(
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                  color: Color(0xFF007AFF),
                                  fontSize: 14,
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 2,
                          color: AppColor.dividerColor,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 200,
                          child: cupertino.CupertinoDatePicker(
                              mode: cupertino.CupertinoDatePickerMode.date,
                              dateOrder: cupertino.DatePickerDateOrder.dmy,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (val) {
                                textEditingController.text =
                                    DateFormat.yMd().format(val).toString();
                              }),
                        ),

                        // Close the modal
                      ],
                    ),
                  ));
        },
        readOnly: true,
        validator: (value) {
          if (validator.value != 'success') {
            return validator.value;
          }
          return null;
        },
        controller: textEditingController,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: AppColor.dividerColor,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelText: hintText,
          suffixIcon: Icon(
            Icons.calendar_month_outlined,
            color: validator.value == 'success' ? AppColor.green : AppColor.red,
          ),
          errorStyle: TextStyle(color: AppColor.red),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: AppColor.dividerColor,
            ),
          ),
        ),
      ),
    );
  }
}
