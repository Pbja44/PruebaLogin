import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:pruebatecnica/controllers/login_controller.dart';
import 'package:pruebatecnica/screens/auth/widgets/gallerycropper.dart';
import 'package:pruebatecnica/screens/loadScreen/load_screen.dart';
import 'package:pruebatecnica/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../screens/congrats.dart';
import '../utils/app_variables.dart';

class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController countryRegionController = TextEditingController();
  TextEditingController numberPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repetPasswordController = TextEditingController();
  final cropperKey = GlobalKey(debugLabel: 'cropperKey');
  String avatarPath = '';
  RxString pathimage = "".obs;
  RxBool isImage = false.obs;
  File? fileImage;
  RxBool isLoading = false.obs;

  LoginController loginController = LoginController();

  Future<void> saveData() async {
    registerName = nameController.text;
    registerLastName = lastNameController.text;
    registerBirthDay = birthDayController.text;
    registerRegion = countryRegionController.text;
    registerPhone = numberPhoneController.text;
    registerEmail = emailController.text;
    registerPassword = passwordController.text;
    registerRepeatPassword = repetPasswordController.text;
  }

  Future<void> registerWithEmail() async {
    isLoading.value = true;
    try {
      var headers = {
        'Content-Type': ApiEndPoints.contentType,
        'Authorization': ApiEndPoints.auth
      };
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      var request = http.MultipartRequest(
        "POST",
        url,
      );
      log(url.toString());

      request.fields['name'] = registerName;
      request.fields['last_name'] = registerLastName;
      request.fields['birthdate'] = registerBirthDay;
      request.fields['id_country'] = '1';
      request.fields['phone'] = registerPhone;
      request.fields['phone_code'] = '34';
      request.fields['email'] = registerEmail;
      request.fields['password'] = registerPassword;
      request.fields['password_confirmation'] = registerRepeatPassword;
      request.fields['type'] = 'guest';
      request.fields['language'] = 'es';
      request.fields['os'] = 'android';
      if (avatarPath != '') {
        var addImage = await http.MultipartFile.fromPath(
          "image",
          avatarPath,
        );
        request.files.add(addImage);
      }

      request.headers.addAll(headers);
      log(request.fields.entries.toString());
      request.fields.entries;

      var response = await request.send();
      var res = await http.Response.fromStream(response);
      log(res.body.toString());

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        if (json['status'] == "success") {
          emailLogin = registerEmail;
          password = registerPassword;
          Get.offAll(const LoadScreen(ruta: CongratsScreen()));

          nameController.clear();
          lastNameController.clear();
          birthDayController.clear();
          countryRegionController.clear();
          repetPasswordController.clear();
          numberPhoneController.clear();
          emailController.clear();
          passwordController.clear();
          registerName = '';
          registerLastName = '';
          registerBirthDay = '';
          registerRegion = '';
          registerPhone = '';
          registerEmail = '';
          registerPassword = '';
        } else {
          throw jsonDecode(res.body)["message"] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(res.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerWithGoogle() async {
    try {
      var headers = {
        'Content-Type': ApiEndPoints.contentType,
        'Authorization': ApiEndPoints.auth
      };
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      var request = http.MultipartRequest(
        "POST",
        url,
      );
      request.fields['name'] = nameController.text;
      request.fields['last_name'] = lastNameController.text;
      request.fields['birthdate'] = birthDayController.text;
      request.fields['id_country'] = '';
      request.fields['phone'] = numberPhoneController.text;
      request.fields['phone_code'] = '';
      request.fields['email'] = emailController.text;
      request.fields['password'] = passwordController.text;
      request.fields['password_confirmation'] = repetPasswordController.text;
      request.fields['type'] = 'guest';
      request.fields['language'] = 'es';
      var addImage = await http.MultipartFile.fromPath(
        "image",
        '',
      );
      request.files.add(addImage);

      request.headers.addAll(headers);

      var response = await request.send();
      var res = await http.Response.fromStream(response);

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        if (json['status'] == "success") {
          loginController.emailController.text = emailController.text;
          loginController.passwordController.text = passwordController.text;
          loginController.loginWithEmail();

          nameController.clear();
          lastNameController.clear();
          birthDayController.clear();
          countryRegionController.clear();
          repetPasswordController.clear();
          numberPhoneController.clear();
          emailController.clear();
          passwordController.clear();
        } else {
          throw jsonDecode(res.body)["message"] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(res.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }

  getImageGalery(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();

    final pickedImage = await imagePicker.pickImage(
        source: source, maxHeight: 800, maxWidth: 800, imageQuality: 100);
    pathimage.value = pickedImage!.path;

    fileImage = File(pickedImage.path);
    isImage.value = true;

    avatarPath = pathimage.value;

    Get.bottomSheet(const GalleryCroper(),
        enableDrag: false, isScrollControlled: true);
  }
}
