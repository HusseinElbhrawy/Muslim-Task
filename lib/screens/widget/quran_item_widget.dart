import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_task/screens/cubit/quran_cubit.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/constant.dart';
import '../../core/utils/style_manager.dart';

class QuranItemWidget extends StatefulWidget {
  const QuranItemWidget({
    super.key,
  });

  @override
  State<QuranItemWidget> createState() => _QuranItemWidgetState();
}

class _QuranItemWidgetState extends State<QuranItemWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        bool isSearch = state.searchQuranList.isNotEmpty;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                color: Colors.white,
                elevation: 0.0,
                child: ListTile(
                  leading: Container(
                    height: 56.h,
                    width: 56.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffDDE9EB),
                    ),
                    padding: EdgeInsets.all(8.spMin),
                    child: SvgPicture.asset(AppSvgAssets.quran),
                  ),
                  title: Row(
                    children: [
                      Text(
                        isSearch
                            ? state.searchQuranList[index]['name']
                            : listOfSurahInfo[index]['name'],
                        style: getMediumStyle(),
                      ),
                      const Spacer(),
                      Text(
                        isSearch
                            ? state.searchQuranList[index]['name']
                            : listOfSurahInfo[index]['type'],
                        style: getMediumStyle(
                          color: Theme.of(context).appBarTheme.backgroundColor!,
                        ),
                      )
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        isSearch
                            ? state.searchQuranList[index]['name']
                            : 'رقم السورة : ${index + 1}',
                        style: getRegularStyle(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        isSearch
                            ? state.searchQuranList[index]['name']
                            : "عدد آياتها : ${listOfSurahInfo[index]['ayah']}",
                        style: getRegularStyle(
                          color: Theme.of(context).hintColor,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            childCount: state.searchQuranList.isNotEmpty
                ? state.searchQuranList.length
                : listOfSurahInfo.length,
          ),
        );
      },
    );
  }
}

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({Key? key, required this.i}) : super(key: key);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Text(
      "${"\uFD3E${(i + 1).toString().toArabicNumbers}"}\uFD3F",
      style: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'me_quran',
        fontSize: 20,
        shadows: [
          Shadow(
            offset: Offset(.5, .5),
            blurRadius: 1.0,
            color: Colors.amberAccent,
          ),
        ],
      ),
    );
  }
}

class _ArabicNumbers {
  static String convert(Object value) {
    assert(
      value is int || value is String,
      "The value object must be of type 'int' or 'String'.",
    );

    if (value is int) {
      return _toArabicNumbers(value.toString());
    } else {
      return _toArabicNumbers(value as String);
    }
  }

  static String _toArabicNumbers(String value) {
    return value
        .replaceAll('0', '٠')
        .replaceAll('1', '١')
        .replaceAll('2', '٢')
        .replaceAll('3', '٣')
        .replaceAll('4', '٤')
        .replaceAll('5', '٥')
        .replaceAll('6', '٦')
        .replaceAll('7', '٧')
        .replaceAll('8', '٨')
        .replaceAll('9', '٩');
  }
}

extension IntExtensions on int {
  /// Converts English numbers to the Arabic numbers format
  ///
  ///
  /// Example:
  /// ```dart
  /// final arabicNumbers = 0123456789.toArabicNumbers;
  /// // result: ٠١٢٣٤٥٦٧٨٩
  /// ```
  String get toArabicNumbers {
    return _ArabicNumbers.convert(this);
  }
}

extension StringExtensions on String {
  /// Converts English numbers to the Arabic numbers format
  ///
  ///
  /// Example:
  /// ```dart
  /// final arabicNumbers = '0123456789'.toArabicNumbers;
  /// // result: ٠١٢٣٤٥٦٧٨٩
  /// ```
  String get toArabicNumbers {
    return _ArabicNumbers.convert(this);
  }
}
