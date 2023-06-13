import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/style_manager.dart';
import '../../cubit/quran_cubit.dart';

class FontSizeSliderWidget extends StatelessWidget {
  const FontSizeSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.spMin),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'A',
                style: getMediumStyle(
                  color: Theme.of(context).primaryColor,
                ).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                'حجم الخط',
                style: getMediumStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          BlocBuilder<QuranCubit, QuranState>(
            buildWhen: (previous, current) {
              return previous.fontSize != current.fontSize;
            },
            builder: (context, state) {
              return Slider(
                value: state.fontSize,
                min: 10,
                max: 40,
                onChanged: (value) {
                  context.read<QuranCubit>().changeFontSize(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
