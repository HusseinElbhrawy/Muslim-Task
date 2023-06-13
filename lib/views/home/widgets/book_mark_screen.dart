import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_task/app/injector.dart';
import 'package:muslim_task/core/database/i_local_data_base.dart';
import 'package:muslim_task/core/utils/fonts_manager.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/style_manager.dart';
import '../../cubit/quran_cubit.dart';
import '../../quran_details/quran_details_screen.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  void reorderItems(QuranState state, int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    ILocalDataBase localDataBase = serviceLocator<ILocalDataBase>();
    String oldKey = state.savedAyah![oldIndex]['aya_number'].toString();
    var oldAyah = await localDataBase.get(oldKey);

    String newKey = state.savedAyah![newIndex]['aya_number'].toString();
    var newAyah = await localDataBase.get(newKey);

    await localDataBase.set(oldKey, newAyah);
    await localDataBase.set(newKey, oldAyah);

    final item = state.savedAyah!.removeAt(oldIndex);
    state.savedAyah!.insert(newIndex, item);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        return ReorderableListView.builder(
          itemCount: state.savedAyah?.length ?? 0,
          itemBuilder: (context, index) {
            return Card(
              key: Key('$index'),
              color: Colors.white,
              elevation: 0.0,
              child: ListTile(
                onTap: () async {
                  int surahIndex = state.savedAyah![index]['surah'];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return QuranDetailsScreen(
                          id: int.parse(listOfSurahInfo[surahIndex]['surah']) -
                              1,
                        );
                      },
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
                title: Text(
                  state.savedAyah?[index]['name'] ?? '',
                  style: getMediumStyle(),
                ),
                subtitle: Text(
                  state.savedAyah?[index]['aya'] ?? '',
                  style: getRegularStyle(
                    color: Theme.of(context).hintColor,
                  ).copyWith(
                    fontFamily: AppFonts.hafsSmart,
                  ),
                ),
              ),
            );
          },
          onReorder: (int oldIndex, int newIndex) {
            reorderItems(state, oldIndex, newIndex);
          },
        );
      },
    );
  }
}
