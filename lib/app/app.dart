// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muslim_task/core/utils/app_colors.dart';
import 'package:muslim_task/core/utils/fonts_manager.dart';
import 'package:muslim_task/views/cubit/quran_cubit.dart';

import '../core/utils/constant.dart';
import '../views/home/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit()..getSavedAyah(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Muslim Task',
            theme: ThemeData(
              useMaterial3: true,

              primaryColor: AppColors.primaryColor,
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
              iconTheme: const IconThemeData(
                color: AppColors.white,
              ),
              appBarTheme: AppBarTheme(
                actionsIconTheme: const IconThemeData(
                  color: AppColors.white,
                ),
                iconTheme: const IconThemeData(
                  color: AppColors.white,
                ),
                elevation: 0.0,
                // backgroundColor: AppColors.appBarBGColor,
                color: AppColors.primaryColor,
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
              sliderTheme: const SliderThemeData(
                thumbColor: AppColors.sliderColor,
                activeTrackColor: AppColors.sliderColor,
              ),
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
      ),
    );
  }
}
