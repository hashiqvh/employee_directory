import 'package:dartz/dartz.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/errors/error.dart';

abstract class EmployeeRemote {
  Future<Either<Errors, dynamic>> getEmployee();
}

class EmployeeRemoteImpl extends EmployeeRemote {
  final ApiConfig apiConfig;

  EmployeeRemoteImpl(this.apiConfig);
  @override
  Future<Either<Errors, dynamic>> getEmployee() async {
    return apiConfig.getListData(
      endpoint: "http://www.mocky.io/v2/5d565297300000680030a986",
    );
  }
}
