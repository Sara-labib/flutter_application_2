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
  Dio dio = Dio(BaseOptions(
    baseUrl: 'https://gorest.co.in/public/v2/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      requestBody: true,
      logPrint: (object) {
        print('Dio Log: $object');
      }));

  return dio;
}
