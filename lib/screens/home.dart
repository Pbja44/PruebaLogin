import 'package:flutter/material.dart';
import 'package:pruebatecnica/screens/auth/widgets/appbar_home.dart';
import 'package:pruebatecnica/utils/app_variables.dart';
import 'package:pruebatecnica/utils/colors.dart';

import '../utils/image_asset.dart';
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        leadingWidth: 300,
        leading: AppBarHome(
          image:avatar,
          name:  "$userName $userLastName",
        ),
    
      ),
      body: Center(
        child: SizedBox(
          height: 250,
          child: Image.asset(
            AppImages.emptyVerified,
            width: 330.0,
            height: 220,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      backgroundColor: AppColor.white,
    );
  }
}
