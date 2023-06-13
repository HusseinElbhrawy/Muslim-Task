import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_task/core/utils/constant.dart';
import 'package:muslim_task/core/utils/fonts_manager.dart';
import 'package:muslim_task/core/utils/style_manager.dart';
import 'package:muslim_task/views/cubit/quran_cubit.dart';
import 'package:muslim_task/views/quran_details/widget/besmala_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MushafReadingMode extends StatelessWidget {
  const MushafReadingMode({
    super.key,
    required this.id,
    required this.previousVerses,
    required this.itemScrollController,
    required this.itemPositionsListener,
    required this.state,
  });

  final int id;
  final QuranState state;
  final int previousVerses;
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (index != 0) || (id == 0) || (id == 8)
                ? const SizedBox.shrink()
                : const BesmalaWidget(),
            InkWell(
              onLongPress: () async {
                context.read<QuranCubit>().saveSelectedAya(
                  context,
                  (index + previousVerses).toString(),
                  {
                    'surah': id,
                    'aya_number': index + previousVerses,
                    'aya': arabic[index + previousVerses]['aya_text'],
                    'name': listOfSurahInfo[id]['name'],
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(8.0.sp),
                child: Text(
                  arabic[index + previousVerses]['aya_text'],
                  textAlign: TextAlign.justify,
                  style: getMediumStyle(
                    color: Colors.black,
                    fontSize: state.fontSize,
                  ).copyWith(
                    fontFamily: AppFonts.hafsSmart,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
      itemCount: int.parse(listOfSurahInfo[id]['ayah']),
    );
  }
}
