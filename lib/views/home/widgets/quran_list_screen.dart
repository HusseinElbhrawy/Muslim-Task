import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_task/views/cubit/quran_cubit.dart';
import 'package:muslim_task/views/home/widgets/quran_item_widget.dart';

class QuranListScreen extends StatefulWidget {
  const QuranListScreen({super.key});

  @override
  State<QuranListScreen> createState() => _QuranListScreenState();
}

class _QuranListScreenState extends State<QuranListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.spMin),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: TextFormField(
              onChanged: (value) {
                context.read<QuranCubit>().searchQuranSurah(value);
              },
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
