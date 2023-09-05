import 'package:expense_app/core/constants/colors.dart';
import 'package:expense_app/core/widgets/default_text.dart';
import 'package:expense_app/pages/categories/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String name = 'Splash Screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToUserLogin();
  }

  navigateToUserLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const CategoryScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color:primaryColor,
        width: double.infinity,
        height: double.infinity,
        child:DefaultText(
          text: 'Money',
          fontColor: whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 32.sp,
        ),
      ),
    );

  }
}