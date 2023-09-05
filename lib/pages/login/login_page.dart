import 'package:expense_app/core/constants/colors.dart';
import 'package:expense_app/core/widgets/default_button.dart';
import 'package:expense_app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/widgets/default_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const name = 'Login Page';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultText(text: 'Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              DefaultTextField(
                textInputType: TextInputType.emailAddress,
                hintText: 'Email',
                controller:emailController ,
              ),
              SizedBox(height: 25.h,),
              DefaultTextField(
                textInputType: TextInputType.emailAddress,
                hintText: 'Password',
                controller:passwordController ,
                suffix: Icon(Icons.remove_red_eye,color: Colors.blue,),
              ),
              SizedBox(height: 40.h,),
              DefaultButton(
                fontColor: whiteColor,
                backgroundColor: primaryColor,
                text: 'Login',
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultText(
                    text: 'Forget Password?',
                    fontColor: primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              SizedBox(height: 40.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultText(
                    text: 'Don\'t have an account yet?',
                    fontColor: HexColor('#91919F'),
                    fontSize: 14.sp,
                  ),
                  SizedBox(width: 5.w,),
                  DefaultText(
                    text: 'Sign Up',
                    fontColor: primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
