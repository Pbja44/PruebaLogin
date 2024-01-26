import 'package:flutter/cupertino.dart';
import 'package:pruebatecnica/controllers/login_controller.dart';
import 'package:pruebatecnica/controllers/registeration_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pruebatecnica/utils/app_variables.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());
  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return  authOption;
  }
}
