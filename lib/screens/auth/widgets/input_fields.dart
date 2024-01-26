// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:intl/intl.dart';
import 'package:pruebatecnica/utils/colors.dart';
import 'package:pruebatecnica/utils/image_asset.dart';

class InputTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Widget? iconData;
  final bool obscureText;
  final String type;

  const InputTextFieldWidget(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      required this.type,
      this.iconData,
      this.obscureText = false});

  @override
  State<InputTextFieldWidget> createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        
        obscureText: widget.obscureText,
        controller: widget.textEditingController,keyboardType: widget.type == 'phone' ?TextInputType.phone: TextInputType.name ,
        decoration: InputDecoration(
          suffixIcon: widget.iconData,
          suffixIconColor: AppColor.suffixColor,
          labelStyle: TextStyle(
            color: AppColor.dividerColor,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelText: widget.hintText,
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
          if (widget.type == 'email') {
            if (!_emailRegex.hasMatch(value.toString())) {
              return 'Email address is not valid';
            }
          }
          if (widget.type == 'name') {
            if (value.toString().isEmpty) {
              return 'Name is empty';
            }
          }
          if (widget.type == 'lastname') {
            if (value.toString().isEmpty) {
              return 'Name is empty';
            }
          }
          if (widget.type == 'birthday') {
            if (value.toString().isEmpty) {
              return 'Name is empty';
            }
          }
          if (widget.type == 'region') {
            if (value.toString().isEmpty) {
              return 'Region is empty';
            }
          }
          if (widget.type == 'phone') {
            if (value.toString().isEmpty) {
              return 'Number Phone is empty';
            }
          }

          if (widget.type == 'password') {
            return passwordValidator(value.toString());
          }
          if (widget.type == 'repeatpassword') {
            return passwordValidator(value.toString());
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

class InputTextFielDatePickerdWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;

  const InputTextFielDatePickerdWidget({
    super.key,
    required this.textEditingController,
    required this.hintText,
  });

  @override
  State<InputTextFielDatePickerdWidget> createState() =>
      _InputTextFielDatePickerdWidgetState();
}

class _InputTextFielDatePickerdWidgetState
    extends State<InputTextFielDatePickerdWidget> {
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
                                  fontFamily: 'Inter',
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
                                  fontFamily: 'Inter',
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
                                  fontFamily: 'Inter',
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
                                setState(() {
                                  widget.textEditingController.text =
                                      DateFormat.yMd().format(val).toString();
                                });
                              }),
                        ),

                        // Close the modal
                      ],
                    ),
                  ));
        },
        readOnly: true,
        validator: (value) {
          
          if ( widget.textEditingController.text.isEmpty) {
            return 'Birthday is empty';
          }
          return null;
        },
        controller: widget.textEditingController,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: AppColor.dividerColor,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          labelText: widget.hintText,suffixIcon: Image.asset(AppImages.calendar),
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
