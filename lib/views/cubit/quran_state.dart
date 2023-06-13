part of 'quran_cubit.dart';

class QuranState extends Equatable {
  final List searchQuranList;
  final double fontSize;
  final ReaderMode readerMode;
  final List? savedAyah;
  final RequestState getAllSavedAyahState;
  final RequestState saveSelectedAyaState;

  const QuranState({
    this.searchQuranList = const [],
    this.fontSize = 23,
    this.readerMode = ReaderMode.normal,
    this.getAllSavedAyahState = RequestState.initial,
    this.saveSelectedAyaState = RequestState.initial,
    this.savedAyah,
  });

  @override
  List<Object?> get props => [
        searchQuranList,
        fontSize,
        readerMode,
        savedAyah,
        getAllSavedAyahState,
        saveSelectedAyaState,
      ];

  QuranState copyWith({
    List? searchQuranList,
    List? savedAyah,
    double? fontSize,
    ReaderMode? readerMode,
    RequestState? getAllSavedAyahState,
    RequestState? saveSelectedAyaState,
  }) {
    return QuranState(
      searchQuranList: searchQuranList ?? this.searchQuranList,
      savedAyah: savedAyah ?? this.savedAyah,
      fontSize: fontSize ?? this.fontSize,
      readerMode: readerMode ?? this.readerMode,
      getAllSavedAyahState: getAllSavedAyahState ?? this.getAllSavedAyahState,
      saveSelectedAyaState: saveSelectedAyaState ?? this.saveSelectedAyaState,
    );
  }
}
