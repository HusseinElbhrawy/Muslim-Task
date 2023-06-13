// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muslim_task/core/utils/app_colors.dart';
import 'package:muslim_task/core/utils/fonts_manager.dart';

import '../screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Muslim Task',
          theme: ThemeData(
            useMaterial3: true,
            hintColor: AppColors.hintColor,
            // indicatorColor: Colors.white,
            scaffoldBackgroundColor: AppColors.scaffoldBgColor,
            tabBarTheme: TabBarTheme(
              labelColor: AppColors.white,
              // indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.white,
              unselectedLabelColor: AppColors.white,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              unselectedLabelStyle: TextStyle(
                fontSize: 15.0.spMin,
                fontWeight: AppFontsWeight.semiBold,
              ),
              labelStyle: TextStyle(
                fontSize: 15.0.spMin,
                fontWeight: AppFontsWeight.semiBold,
              ),
            ),
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              // backgroundColor: AppColors.appBarBGColor,
              color: AppColors.appBarBGColor,
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: AppColors.white,
                fontSize: 18.spMin,
                fontWeight: AppFontsWeight.semiBold,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.spMin,
                vertical: 12.spMin,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.spMin),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.spMin),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.spMin),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.spMin),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(
                // color: AppColors.hintColor,
                fontSize: 15.spMin,
                fontWeight: AppFontsWeight.regular,
              ),
            ),

            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('ar')],
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        );
      },
    );
  }
}
