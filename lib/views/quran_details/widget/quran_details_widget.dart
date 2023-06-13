import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_task/core/utils/constant.dart';
import 'package:muslim_task/views/cubit/quran_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/utils/enums.dart';
import 'mushaf_reading_mode.dart';
import 'normal_reading_mode_widget.dart';

class QuranDetailsWidget extends StatefulWidget {
  const QuranDetailsWidget({super.key, required this.id});
  final int id;
  @override
  State<QuranDetailsWidget> createState() => _QuranDetailsWidgetState();
}

class _QuranDetailsWidgetState extends State<QuranDetailsWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  int previousVerses = 0;
  String fullSura = '';

  @override
  void initState() {
    if (widget.id + 1 != 1) {
      for (int i = widget.id - 1; i >= 0; i--) {
        previousVerses = previousVerses + int.parse(listOfSurahInfo[i]['ayah']);
      }
    }
    for (int i = 0; i < int.parse(listOfSurahInfo[widget.id]['ayah']); i++) {
      fullSura += (arabic[i + previousVerses]['aya_text']) + ' ';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen: (previous, current) {
        return previous.readerMode != current.readerMode ||
            previous.fontSize != current.fontSize;
      },
      builder: (context, state) {
        if (state.readerMode == ReaderMode.normal) {
          return NormalReadingModeWidget(
            id: widget.id,
            fullSura: fullSura,
            state: state,
          );
        } else {
          return MushafReadingMode(
            previousVerses: previousVerses,
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            state: state,
            id: widget.id,
          );
        }
      },
    );
  }
}
