import 'dart:convert';
import 'dart:developer';

import 'package:pruebatecnica/controllers/registeration_controller.dart';
import 'package:pruebatecnica/screens/auth/register_screen.dart';
import 'package:pruebatecnica/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/screens/loadScreen/load_screen.dart';
import 'package:pruebatecnica/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:pruebatecnica/utils/app_variables.dart';
import '../screens/auth/auth_screen.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    late RegisterationController registerationController =
      Get.put(RegisterationController());
  RxBool isLoading = false.obs;
  RxBool isUser = false.obs;

  Future<void> loginWithEmail() async {
    var headers = {
      'Content-Type': ApiEndPoints.contentType,
      'Authorization': ApiEndPoints.auth
    };
    isLoading.value = true;
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      log(url.toString());
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'os': 'android',
        'type': 'guest',
        'fcm_token': 'DFGKNODFIJO34U89FGKNO',
        'language': 'es',
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['status'] == 'success') {
          emailController.clear();
          passwordController.clear();
          userLastName = json['data']['customer']['last_name']??'';
          avatar =json['data']['customer']['avatar']?? '';
          userName = json['data']['customer']['name']?? '';
          await Get.off(const LoadScreen(ruta: HomeScreen(),));
         
        } else if (json['status'] == "failure") {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkEmail() async {
    var headers = {
      'Content-Type': ApiEndPoints.contentType,
      'Authorization': ApiEndPoints.auth
    };
    isLoading.value = true;
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.checkEmail);
      log(url.toString());
      Map body = {
        'email': emailController.text.trim(),
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['status'] == 'success') {
          registerationController.emailController.text = emailController.text;
          emailController.clear();
          passwordController.clear();
          authOption = const RegisterScreen();
          Get.back();
          Get.bottomSheet(isScrollControlled: true, AuthScreen());
        }
      } else {
        final json = jsonDecode(response.body);
        if (json['status'] == "failure" &&
            json['data']['errors']['email'][0] ==
                'The email address has already been taken.') {
          isUser.value = true;
        } else {
          throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
        }
      }
    } catch (error) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    } finally {
      isLoading.value = false;
    }
  }
}
