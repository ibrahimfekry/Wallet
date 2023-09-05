import 'package:expense_app/core/widgets/default_button.dart';
import 'package:expense_app/core/widgets/default_text.dart';
import 'package:expense_app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/constants/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String name = 'Register Page';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultText(
          text: 'Sign Up',
          fontColor: blackColor,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding:  EdgeInsets.all(20.0.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.h,),
                DefaultTextField(
                  controller: nameController,
                  textInputType: TextInputType.name,
                  color: whiteColor,
                  hintText: 'Name',

                ),
                SizedBox(
                  height: 25.h,
                ),
                DefaultTextField(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  color: whiteColor,
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 25.h,
                ),
                DefaultTextField(
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  color: whiteColor,
                  hintText: 'Password',

                  suffix: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {
                        value != value;
                      },
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    DefaultText(
                      text: 'By Signing up , you agree to the',
                      fontSize: 16.sp,
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 40.w,),
                    GestureDetector(
                      child: DefaultText(
                          text: 'Terms of Service and Privacy  ',
                          fontSize: 16.sp,
                          fontColor: primaryColor,
                          maxLines: 2),
                    ),
                  ],
                ),
                SizedBox(height: 15.h,),
                DefaultButton(
                  text: 'Sign Up',
                  backgroundColor: primaryColor,
                  onTap: () {},
                  fontColor: whiteColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/icon_google.svg',width: 30,),
                        SizedBox(width: 10.w,),
                        DefaultButton(
                          text: 'Sign Up With Google',
                          fontColor: blackColor,
                          fontWeight: FontWeight.w500,

                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultText(
                      text: 'Already have an account?',
                      fontSize: 16.sp,
                      fontColor: HexColor('#91919F'),
                    ),
                    SizedBox(width: 3.w,),
                    GestureDetector(
                      onTap: (){},
                      child: DefaultText(
                        text: 'Login',
                        fontSize: 16.sp,
                        fontColor: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
