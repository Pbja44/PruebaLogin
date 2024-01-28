import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebatecnica/utils/colors.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({Key? key, required this.ruta}) : super(key: key);

  final dynamic ruta;

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      Get.offAll(widget.ruta);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(
            backgroundColor: AppColor.circularProgresbackgroundColor,
            color: AppColor.circularProgresColor,
          ),
        ),
      ),
    );
  }
}
