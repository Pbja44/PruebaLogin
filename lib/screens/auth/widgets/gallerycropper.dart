// ignore_for_file: prefer_const_constructors

import 'package:cropperx/cropperx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/controllers/registeration_controller.dart';

import '../../../utils/image_asset.dart';
import '../auth_screen.dart';

class GalleryCroper extends StatefulWidget {
  const GalleryCroper({
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryCroper> createState() => _GalleryCroperState();
}

class _GalleryCroperState extends State<GalleryCroper>
    with TickerProviderStateMixin {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            height: 100,
          ),
          Cropper(
            overlayType: OverlayType.circle,
            cropperKey: registerationController.cropperKey,
            image: Image.file(registerationController.fileImage!),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 50.00,
                  height: 50.00,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.20000000298023224),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        registerationController.fileImage = null;
                        Get.back();
                      },
                      child: Image.asset(AppImages.cancelar)),
                ),
                Spacer(),
                Container(
                  width: 50.00,
                  height: 50.00,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.20000000298023224),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.bottomSheet(
                            isScrollControlled: true, const AuthScreen());
                      },
                      child: Image.asset(AppImages.aceptar)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
