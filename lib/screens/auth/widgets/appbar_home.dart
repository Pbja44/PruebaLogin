import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/utils/colors.dart';

import '../../../controllers/login_controller.dart';

class AppBarHome extends StatelessWidget {
  final String image;
  final String name;
  AppBarHome({Key? key, required this.image, required this.name})
      : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: AppColor.black,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Hi ',
                      style: TextStyle(
                        color: Color(0xFF4F4F4F),
                        fontSize: 20.76,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.83,
                      ),
                    ),
                    TextSpan(
                      text: name,
                      style: const TextStyle(
                        color: Color(0xFF4F4F4F),
                        fontSize: 20.76,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.83,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Good Morning!',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 12,
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
