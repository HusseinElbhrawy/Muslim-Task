import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/style_manager.dart';

class QuranItemWidget extends StatefulWidget {
  const QuranItemWidget({
    super.key,
  });

  @override
  State<QuranItemWidget> createState() => _QuranItemWidgetState();
}

class _QuranItemWidgetState extends State<QuranItemWidget> {
  //! We can also replace Map with Model class
  final List<Map<String, dynamic>> _quranList = [
    {
      'name': 'سورة الفاتحة',
      'number': 1,
      'ayah': 7,
      'type': 'مكية',
    },
    {
      'name': 'سورة البقرة',
      'number': 2,
      'ayah': 286,
      'type': 'مدنية',
    },
    {
      'name': 'سورة آل عمران',
      'number': 3,
      'ayah': 200,
      'type': 'مدنية',
    },
    {
      'name': 'سورة النساء',
      'number': 4,
      'ayah': 176,
      'type': 'مدنية',
    },
    {
      'name': 'سورة المائدة',
      'number': 5,
      'ayah': 120,
      'type': 'مدنية',
    },
  ];

  searchQuran(String text) {
    final List<Map<String, dynamic>> searchList = [];
    for (var element in _quranList) {
      if (element['name'].toString().contains(text)) {
        searchList.add(element);
      }
    }
    setState(() {
      _quranList.clear();
      _quranList.addAll(searchList);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    '${_quranList[index]['name']}',
                    style: getMediumStyle(),
                  ),
                  const Spacer(),
                  Text(
                    _quranList[index]['type'],
                    style: getMediumStyle(
                      color: Theme.of(context).appBarTheme.backgroundColor!,
                    ),
                  )
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
                    'رقم السورة : ${index + 1}',
                    style: getRegularStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "عدد آياتها : ${_quranList[index]['ayah']}",
                    style: getRegularStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: _quranList.length,
      ),
    );
  }
}
