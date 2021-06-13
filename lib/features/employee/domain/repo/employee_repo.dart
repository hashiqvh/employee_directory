import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../../data/model/employee_model.dart';

abstract class EmployeeRepository {
  Future<Either<Errors, List<EmployeeModel>>> getEmployee();
}
