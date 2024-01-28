import 'package:flutter/cupertino.dart';
import 'package:pruebatecnica/controllers/login_controller.dart';
import 'package:pruebatecnica/controllers/registeration_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pruebatecnica/utils/app_variables.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({
    Key? key,
  }) : super(key: key);
  final RegisterationController registerationController =
      Get.put(RegisterationController());

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return authOption;
  }
}
