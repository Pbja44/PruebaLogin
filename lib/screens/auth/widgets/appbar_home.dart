import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/utils/colors.dart';

import '../../../controllers/login_controller.dart';

class AppBarHome extends StatefulWidget {
  final String image;
  final String name;
  const AppBarHome({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> with TickerProviderStateMixin {
  LoginController loginController = Get.put(LoginController());

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
                                image: NetworkImage(
                                    widget.image),
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
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: 0.83,
                      ),
                    ),
                    TextSpan(
                      text: widget.name,
                      style: const TextStyle(
                        color: Color(0xFF4F4F4F),
                        fontSize: 20.76,
                        fontFamily: 'Inter',
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
                  fontFamily: 'Inter',
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
