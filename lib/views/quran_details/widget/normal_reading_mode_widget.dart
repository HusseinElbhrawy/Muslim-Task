import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/fonts_manager.dart';
import '../../../core/utils/style_manager.dart';
import '../../cubit/quran_cubit.dart';
import 'besmala_widget.dart';

class NormalReadingModeWidget extends StatelessWidget {
  const NormalReadingModeWidget({
    super.key,
    required this.id,
    required this.fullSura,
    required this.state,
  });

  final int id;
  final String fullSura;
  final QuranState state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          id + 1 != 1 && id + 1 != 9
              ? const BesmalaWidget()
              : const SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.all(12.spMin),
            child: Text(
              fullSura,
              textAlign: TextAlign.justify,
              style: getMediumStyle(
                color: Colors.black,
                fontSize: state.fontSize,
              ).copyWith(
                fontFamily: AppFonts.hafsSmart,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
