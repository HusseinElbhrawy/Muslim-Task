import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_task/views/home/widgets/app_bar_bg_widget.dart';
import 'package:muslim_task/views/home/widgets/book_mark_screen.dart';
import 'package:muslim_task/views/home/widgets/quran_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const AppBarBGWidget(),
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
            BookMarkScreen(),
          ],
        ),
      ),
    );
  }
}
