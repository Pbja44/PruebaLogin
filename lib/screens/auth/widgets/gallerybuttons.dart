import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pruebatecnica/controllers/registeration_controller.dart';
import 'package:pruebatecnica/utils/colors.dart';

class GalleryButton extends StatefulWidget {
  const GalleryButton({
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryButton> createState() => _GalleryButtonState();
}

class _GalleryButtonState extends State<GalleryButton>
    with TickerProviderStateMixin {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: 412,
            height: 132,
            decoration: ShapeDecoration(
              color: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton(
                      child: const Text(
                        'Choose from photo library',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      onPressed: () {
                        Get.back();

                        registerationController
                            .getImageGalery(ImageSource.gallery);
                      }),
                  const Divider(),
                  CupertinoButton(
                      child: const Text(
                        'Take a photo',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        registerationController
                            .getImageGalery(ImageSource.camera);
                      })
                ]),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 412,
            height: 66,
            decoration: ShapeDecoration(
              color: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: CupertinoButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: AppColor.red,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                onPressed: () {
                  Get.back();
                }),
          )
        ],
      ),
    );
  }
}
