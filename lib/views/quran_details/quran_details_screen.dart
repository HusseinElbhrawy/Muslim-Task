import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_task/views/cubit/quran_cubit.dart';
import 'package:muslim_task/views/quran_details/widget/font_size_slider_widget.dart';
import 'package:muslim_task/views/quran_details/widget/quran_details_widget.dart';

import '../home/widgets/app_bar_bg_widget.dart';

class QuranDetailsScreen extends StatefulWidget {
  const QuranDetailsScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Tooltip(
            message: 'Reading Mode',
            child: TextButton(
              child: Icon(
                Icons.chrome_reader_mode,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                context.read<QuranCubit>().changeReaderMode();
              },
            ),
          )
        ],
        flexibleSpace: const AppBarBGWidget(),
        title: const Text('القرآن الكريم'),
      ),
      body: Column(
        children: [
          const FontSizeSliderWidget(),
          Expanded(child: QuranDetailsWidget(id: widget.id)),
        ],
      ),
    );
  }
}
