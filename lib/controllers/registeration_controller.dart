import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:pruebatecnica/controllers/login_controller.dart';
import 'package:pruebatecnica/screens/auth/widgets/gallerycropper.dart';

import 'package:pruebatecnica/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/auth/profile_photo_screen.dart';
import '../utils/app_variables.dart';

class RegisterationController extends GetxController {
  final nameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final birthDayController = TextEditingController().obs;
  final countryRegionController = TextEditingController().obs;
  final numberPhoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final repetPasswordController = TextEditingController().obs;
  final cropperKey = GlobalKey(debugLabel: 'cropperKey');
  final formKey = GlobalKey<FormState>();
  RxString avatarPath = ''.obs;
  RxString pathimage = "".obs;
  RxBool isImage = false.obs;
  RxBool isValidator = false.obs;
  File? fileImage;
  RxBool isLoading = false.obs;
  final obscureText = true.obs;
  final obscureText2 = true.obs;

  RxString validApiName = "success".obs;
  RxString validApiLastName = "success".obs;
  RxString validApiBirthday = "success".obs;
  RxString validApiRegion = "success".obs;
  RxString validApiPhone = "success".obs;
  RxString validApiEmail = "success".obs;
  RxString validApiPassword = "success".obs;
  RxString validApiRepeatPassword = "success".obs;

  LoginController loginController = LoginController();

  Future<void> resetValidator() async {
    validApiName.value = "success";
    validApiLastName.value = "success";
    validApiBirthday.value = "success";
    validApiRegion.value = "success";
    validApiPhone.value = "success";
    validApiEmail.value = "success";
    validApiPassword.value = "success";
    validApiRepeatPassword.value = "success";
  }

  Future<void> registerWithEmail() async {
    isLoading.value = true;
    isValidator.value = false;
    try {
      formKey.currentState!.reset();

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
      request.fields['name'] = nameController.value.text;
      // request.fields['last_name'] = registerLastName;
      // request.fields['birthdate'] = registerBirthDay;
      // request.fields['id_country'] = '1';
      // request.fields['phone'] = registerPhone;
      // request.fields['phone_code'] = '34';
      request.fields['email'] = emailController.value.text;
      // request.fields['password'] = registerPassword;
      // request.fields['password_confirmation'] = registerRepeatPassword;
      // request.fields['type'] = 'guest';
      // request.fields['language'] = 'es';
      // request.fields['os'] = 'android';

      if (avatarPath != '') {
        var addImage = await http.MultipartFile.fromPath(
          "image",
          avatarPath.value,
        );
        request.files.add(addImage);
      }

      request.headers.addAll(headers);
      request.fields.entries;

      var response = await request.send();
      var res = await http.Response.fromStream(response);
      log(res.body);

      final json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        if (json['status'] == "success") {
          emailLogin = emailController.value.text;
          password = passwordController.value.text;
          nameController.value.clear();
          lastNameController.value.clear();
          birthDayController.value.clear();
          countryRegionController.value.clear();
          repetPasswordController.value.clear();
          numberPhoneController.value.clear();
          emailController.value.clear();
          passwordController.value.clear();
          validApiName.value = "success";
          validApiLastName.value = "success";
          validApiBirthday.value = "success";
          validApiRegion.value = "success";
          validApiPhone.value = "success";
          validApiEmail.value = "success";
          validApiPassword.value = "success";
          validApiRepeatPassword.value = "success";
          authOption = ProfilePhotoScreen();
          Get.back();
          Get.bottomSheet(isScrollControlled: true, AuthScreen());
        } else {
          throw jsonDecode(res.body)["message"] ?? "Unknown Error Occured";
        }
      } else {
        resetValidator();
        if (json['data']['errors'] != null) {
          if (json['data']['errors']['name'] != null) {
            validApiName.value = json['data']['errors']['name'][0] ?? '';
          }
          if (json['data']['errors']['last_name'] != null) {
            validApiLastName.value =
                json['data']['errors']['last_name'][0] ?? '';
          }
          if (json['data']['errors']['birthdate'] != null) {
            validApiBirthday.value =
                json['data']['errors']['birthdate'][0] ?? '';
          }
          if (json['data']['errors']['id_country'] != null) {
            validApiRegion.value =
                json['data']['errors']['id_country'][0] ?? '';
          }
          if (json['data']['errors']['phone'] != null) {
            validApiPhone.value = json['data']['errors']['phone'][0] ?? '';
          }
          if (json['data']['errors']['email'] != null) {
            validApiEmail.value = json['data']['errors']['email'][0] ?? '';
          }

          if (json['data']['errors']['password'] != null) {
            validApiPassword.value =
                json['data']['errors']['password'][0] ?? '';
            validApiRepeatPassword.value =
                json['data']['errors']['password'][0] ?? '';
          }

          update();
          formKey.currentState!.validate();
        } else {
          throw jsonDecode(res.body)["Message"] ?? "Unknown Error Occured";
        }
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
      isValidator.value = true;
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
      request.fields['name'] = nameController.value.text;
      request.fields['last_name'] = lastNameController.value.text;
      request.fields['birthdate'] = birthDayController.value.text;
      request.fields['id_country'] = '';
      request.fields['phone'] = numberPhoneController.value.text;
      request.fields['phone_code'] = '';
      request.fields['email'] = emailController.value.value.text;
      request.fields['password'] = passwordController.value.text;
      request.fields['password_confirmation'] =
          repetPasswordController.value.text;
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
          loginController.emailController.value.text =
              emailController.value.text;
          loginController.passwordController.value.text =
              passwordController.value.text;
          loginController.loginWithEmail();

          nameController.value.clear();
          lastNameController.value.clear();
          birthDayController.value.clear();
          countryRegionController.value.clear();
          repetPasswordController.value.clear();
          numberPhoneController.value.clear();
          emailController.value.clear();
          passwordController.value.clear();
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

    avatarPath = pathimage;

    Get.bottomSheet(GalleryCroper(),
        enableDrag: false, isScrollControlled: true);
  }
}
