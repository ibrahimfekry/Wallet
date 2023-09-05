import 'package:expense_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/widgets/default_button.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  static const String name = 'first Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(30.0.r),
        child: Column(
          children: [
            SizedBox(height: 40.h,),
            SvgPicture.asset('assets/images/login_page.svg'),
            SizedBox(height: 140.h,),
            DefaultButton(
              fontColor: whiteColor,
              backgroundColor: primaryColor,
              text: 'Sign Up',
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 15.h,),
            DefaultButton(
              fontColor: primaryColor,
              backgroundColor: backGroundColor,
              text: 'Login',
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration:const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset('assets/images/icon_google.svg',),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
