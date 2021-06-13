import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../../core/constants/db_constants.dart';
import '../model/employee_model.dart';

abstract class EmployeeLocal {
  Future<List<EmployeeModel>> addEmployee(List<EmployeeModel> employee);
  Future<List<EmployeeModel>> getEmployee();
}

class EmployeeLocalImpl extends EmployeeLocal {
  final HiveInterface hive;

  EmployeeLocalImpl(
    this.hive,
  );
  @override
  Future<List<EmployeeModel>> addEmployee(List<EmployeeModel> employee) async {
    if (!hive.isBoxOpen(EMPLOYEE)) await hive.openBox<EmployeeModel>(EMPLOYEE);

    Box box = hive.box<EmployeeModel>(EMPLOYEE);

    employee.forEach((element) {
      box.put(element.id, element);
    });

    List<EmployeeModel> list = box.values.toList();
    log(list.length.toString());
    return list;
  }

  @override
  Future<List<EmployeeModel>> getEmployee() async {
    if (!hive.isBoxOpen(EMPLOYEE)) await hive.openBox<EmployeeModel>(EMPLOYEE);

    Box box = hive.box<EmployeeModel>(EMPLOYEE);

    List<EmployeeModel> list = box.values.toList();
    log(list.length.toString());
    return list;
  }
}
