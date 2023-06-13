part of 'quran_cubit.dart';

class QuranState extends Equatable {
  final List searchQuranList;

  const QuranState({
    this.searchQuranList = const [],
  });

  @override
  List<Object?> get props => [
        searchQuranList,
      ];

  QuranState copyWith({
    List? searchQuranList,
  }) {
    return QuranState(
      searchQuranList: searchQuranList ?? this.searchQuranList,
    );
  }
}
