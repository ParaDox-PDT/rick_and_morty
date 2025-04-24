part of 'injector_container_part.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> init() async {
  /// External
  await initHive();

  sl.registerLazySingleton(
    () =>
        Dio()
          ..options = BaseOptions(
            contentType: 'application/json',
            sendTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            connectTimeout: const Duration(seconds: 15),
            baseUrl: Constants.baseUrl,
          )
          ..interceptors.addAll([
            LogInterceptor(
              requestBody: kDebugMode,
              responseBody: kDebugMode,
              logPrint: (object) => kDebugMode ? log('dio: ${object.toString()}') : null,
            ),
          ]),
  );
  sl<Dio>().interceptors.add(
    RetryInterceptor(
      dio: sl<Dio>(),
      toNoInternetPageNavigator: () async {},
      logPrint: (String message) {
        debugPrint('Connection error:$message');
      },
    ),
  );

  sl
    ..registerSingleton<LocalSource>(LocalSource(_box))
    ..registerLazySingleton(InternetConnectionChecker.new)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// main
  mainFeature();


}

void mainFeature() {
  /// splash
  sl
    ..registerFactory(SplashBloc.new)
    ..registerLazySingleton(MainBloc.new);
}

Future<void> initHive() async {
  const boxName = 'rick_and_morty_box';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
