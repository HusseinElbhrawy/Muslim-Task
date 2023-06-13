import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_task/core/database/i_local_data_base.dart';
import 'package:muslim_task/core/database/local_data_base_with_hive.dart';
import 'package:muslim_task/core/utils/constant.dart';

import '../../core/utils/enums.dart';
import '../../core/utils/fonts_manager.dart';
import '../../core/utils/style_manager.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(const QuranState());
  ILocalDataBase localDataBase = HiveLocalDataBaseImplementation();

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

  void changeFontSize(double value) {
    emit(state.copyWith(fontSize: value));
  }

  void changeReaderMode() {
    if (state.readerMode == ReaderMode.normal) {
      emit(state.copyWith(readerMode: ReaderMode.mushaf));
    } else {
      emit(state.copyWith(readerMode: ReaderMode.normal));
    }
  }

  void getSavedAyah() async {
    emit(state.copyWith(getAllSavedAyahState: RequestState.loading));

    final result = await localDataBase.getAll();
    log(result.toString());
    emit(state.copyWith(
        savedAyah: result, getAllSavedAyahState: RequestState.loaded));
  }

  void saveSelectedAya(
      BuildContext context, String key, Map<String, dynamic> ayah) async {
    emit(state.copyWith(saveSelectedAyaState: RequestState.loading));
    await localDataBase.set(key, ayah).then((value) {
      getSavedAyah();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'تم حفظ الآية',
            style: getMediumStyle(
              color: Colors.white,
              fontSize: 12.0.sp,
            ).copyWith(
              fontFamily: AppFonts.hafsSmart,
            ),
          ),
        ),
      );
    });
    emit(state.copyWith(saveSelectedAyaState: RequestState.loaded));
  }
}
