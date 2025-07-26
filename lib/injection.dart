import 'package:dio/dio.dart';
import 'package:flutter_application_2/cubit/my_cubit.dart';
import 'package:flutter_application_2/my_repo.dart';
import 'package:flutter_application_2/web_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetUpDio()));
}

Dio createAndSetUpDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = 10 * 1000
    ..options.receiveTimeout = 10 * 1000;

  dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: false,
      responseHeader: false,
      responseBody: true,
      error: true,
      requestBody: true));

  return dio;
}
