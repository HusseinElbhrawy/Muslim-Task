import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:muslim_task/views/cubit/quran_cubit.dart';
import 'package:path_provider/path_provider.dart';

import '../core/database/i_local_data_base.dart';
import '../core/database/local_data_base_with_hive.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  //! Bloc
  await _setUpBloc();
  //! Utils
  await _setUpUtils();
  //!External
  await _setUpExternal();
}

Future<void> _setUpBloc() async {
  serviceLocator.registerLazySingleton(
    () => QuranCubit(),
  );
}

Future<void> _setUpUtils() async {
  serviceLocator.registerLazySingleton<ILocalDataBase>(
    () => HiveLocalDataBaseImplementation(),
  );
}

Future<void> _setUpExternal() async {
  final path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);

  await Hive.openBox(
    'bookmarks',
    compactionStrategy: (entries, deletedEntries) => deletedEntries > 10,
  );

  serviceLocator.registerLazySingleton<HiveInterface>(() => Hive);
}
