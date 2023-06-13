import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/fonts_manager.dart';
import '../../cubit/quran_cubit.dart';

class BesmalaWidget extends StatelessWidget {
  const BesmalaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<QuranCubit, QuranState>(
        buildWhen: (previous, current) {
          return previous.fontSize != current.fontSize;
        },
        builder: (context, state) {
          return Text(
            'بسم الله الرحمن الرحيم',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppFonts.quran,
              fontWeight: FontWeight.bold,
              fontSize: state.fontSize,
            ),
          );
        },
      ),
    );
  }
}
