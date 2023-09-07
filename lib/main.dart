import 'package:expense_app/pages/categories/all_expenses.dart';
import 'package:expense_app/pages/categories/category_page.dart';
import 'package:expense_app/pages/categories/expense_page.dart';
import 'package:expense_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import './models/database_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => DatabaseProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor:Colors.transparent,
                elevation: 0,
                titleTextStyle: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.black,size: 25.r),
                systemOverlayStyle:const  SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.transparent,
                  systemNavigationBarColor: Colors.white,
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),
              )),
          initialRoute: SplashScreen.name,
          routes: {
            SplashScreen.name: (_)=> const SplashScreen(),
            CategoryScreen.name: (_) => const CategoryScreen(),
            ExpenseScreen.name: (_) => const ExpenseScreen(),
            AllExpenses.name: (_) => const AllExpenses(),
          },
        );
      },
    );
  }
}