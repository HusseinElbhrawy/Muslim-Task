import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_task/screens/widget/quran_item_widget.dart';

class QuranListScreen extends StatelessWidget {
  const QuranListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.spMin),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'ابحث عما تريد...',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const QuranItemWidget(),
        ],
      ),
    );
  }
}
