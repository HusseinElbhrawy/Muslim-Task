import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_task/core/utils/app_assets.dart';
import 'package:muslim_task/screens/quran_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              AppImagesAssets.appBG,
              fit: BoxFit.cover,
            ),
          ),
          title: const Text('القرآن الكريم'),
          bottom: TabBar(
            enableFeedback: true,
            padding: EdgeInsets.symmetric(horizontal: 87.w),
            indicatorWeight: 3.h,
            tabs: const [
              Text('السور'),
              Text('المحفوظات'),
            ],
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            QuranListScreen(),
            SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
