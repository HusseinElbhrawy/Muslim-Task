import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_task/core/utils/constant.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(const QuranState());

  void searchQuranSurah(String text) async {
    emit(state.copyWith());

    final result = listOfSurahInfo.where(
      (element) {
        return element['name'].toLowerCase().contains(text.toLowerCase());
      },
    );

    emit(state.copyWith(searchQuranList: result.toList()));
    log('searchQuranSurah: ${state.searchQuranList}');
  }
}
