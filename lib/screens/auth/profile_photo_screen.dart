import 'package:flutter/cupertino.dart';
import 'package:pruebatecnica/controllers/registeration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/screens/auth/widgets/gallerybuttons.dart';
import '../../utils/colors.dart';
import '../../utils/image_asset.dart';
import 'widgets/submit_button.dart';

class ProfilePhotoScreen extends StatelessWidget {
  ProfilePhotoScreen({
    Key? key,
  }) : super(key: key);
  final RegisterationController registerationController =
      Get.put(RegisterationController());

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
        children: [
          Column(
            children: [
              const SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const SizedBox(width: 25.0),
                    Text(
                      'Profile photo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.black,
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
            ],
          ),
          Center(
            child: SizedBox(
              height: 220,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Obx(
                    () => registerationController.isImage.value
                        ? Container(
                            width: 190.0,
                            height: 190.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                    registerationController.fileImage!),
                              ),
                            ),
                          )
                        : Image.asset(
                            AppImages.profileIcon,
                            width: 200,
                            height: 200,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: AppColor.buttonPhotoColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Get.bottomSheet(
                            isScrollControlled: false,
                            GalleryButton(),
                          );
                        },
                        icon: Icon(
                          CupertinoIcons.camera,
                          color: AppColor.cameraColor,
                        ),
                        label: Text(
                          'Upload',
                          style: TextStyle(
                            color: AppColor.cameraColor,
                            fontSize: 18,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SkipSaveButton(),
        ],
      ),
    );
  }
}
