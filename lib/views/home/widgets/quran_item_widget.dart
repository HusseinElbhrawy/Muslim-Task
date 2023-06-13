import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_task/views/cubit/quran_cubit.dart';
import 'package:muslim_task/views/quran_details/quran_details_screen.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/style_manager.dart';

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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return QuranDetailsScreen(
                            id: int.parse(listOfSurahInfo[index]['surah']) - 1,
                          );
                        },
                        settings: RouteSettings(
                          arguments: {
                            'index': index,
                          },
                        ),
                      ),
                    );
                  },
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
                            ? state.searchQuranList[index]['type']
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
                            ? 'رقم السورة : ${state.searchQuranList[index]['surah']}'
                            : 'رقم السورة : ${index + 1}',
                        style: getRegularStyle(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        isSearch
                            ? 'عدد آياتها : ' +
                                state.searchQuranList[index]['ayah']
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
