// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/utils/colors.dart';

import '../../../utils/image_asset.dart';

class GoogleSignButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool isGoogle;
  const GoogleSignButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.isGoogle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColor.white,
            side: BorderSide(width: 1, color: AppColor.black)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isGoogle
                ? Image.asset(
                    AppImages.googleLogo,
                    width: 25.0,
                  )
                : SizedBox(
                    width: 25,
                  ),
            Text(
              title,
              style: TextStyle(
                color: AppColor.black,
                fontSize: 16,
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
    );
  }
}
