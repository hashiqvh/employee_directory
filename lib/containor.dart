import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import 'core/config/api_config.dart';
import 'core/config/newtwork_config.dart';
import 'features/employee/data/repo_impl/employee_repo_impl.dart';
import 'features/employee/data/source/employee_local.dart';
import 'features/employee/data/source/employee_remote.dart';
import 'features/employee/domain/repo/employee_repo.dart';

GetIt sl = GetIt.instance;
Future init() async {
  // package inits
  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );
  sl.registerLazySingleton<Logger>(
    () => Logger(),
  );

  sl.registerLazySingleton<DataConnectionChecker>(
    () => DataConnectionChecker(),
  );
  sl.registerLazySingleton<NetworkConfig>(
    () => NetworkConfigImpl(dataConnectionChecker: sl()),
  );
  sl.registerLazySingleton<HiveInterface>(() => Hive);

  sl.registerLazySingleton<ApiConfig>(
    () => ApiConfig(
      client: sl(),
      logger: sl(),
    ),
  );
  sl.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(
      employeeLocal: sl(),
      employeeRemote: sl(),
      networkConfig: sl(),
    ),
  );
  sl.registerLazySingleton<EmployeeLocal>(
    () => EmployeeLocalImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton<EmployeeRemote>(() => EmployeeRemoteImpl(
        sl(),
      ));
}
