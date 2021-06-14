import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:employee_directory/core/constants/db_constants.dart';
import 'package:hive/hive.dart';

import '../../../../core/config/newtwork_config.dart';
import '../../../../core/errors/error.dart';
import '../../domain/repo/employee_repo.dart';
import '../model/employee_model.dart';
import '../source/employee_local.dart';
import '../source/employee_remote.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeRemote employeeRemote;
  final EmployeeLocal employeeLocal;
  final NetworkConfig networkConfig;
  EmployeeRepositoryImpl({
    this.employeeRemote,
    this.employeeLocal,
    this.networkConfig,
  });
  @override
  Future<Either<Errors, List<EmployeeModel>>> getEmployee() async {
    Errors errors;
    List<EmployeeModel> employee = [];

    if (await networkConfig.isConnected) {
      if (Hive.box<EmployeeModel>(EMPLOYEE).values.length == 0) {
        var s = await employeeRemote.getEmployee();
        s.fold(
          (l) => errors = l,
          (r) {
            for (var item in r) {
              if (item["company"] != null) {
                EmployeeModel type = EmployeeModel.fromJson(item);
                employee.add(type);
              }
            }
            return employee;
          },
        );

        log(employee.toString());
        if (errors != null) return Left(errors);

        print("Chat User Len:\t${employee.length}");

        var value = await employeeLocal.addEmployee(
          employee,
        );
        return Right(value);
      } else {
        var value = await employeeLocal.getEmployee();
        return Right(value);
      }
    } else {
      var value = await employeeLocal.getEmployee();
      return Right(value);
    }
  }
}
