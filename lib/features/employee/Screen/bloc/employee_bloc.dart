import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/error.dart';
import '../../data/model/employee_model.dart';
import '../../domain/repo/employee_repo.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc({
    this.employeeRepository,
  }) : super(EmployeeInitial());
  final EmployeeRepository employeeRepository;

  @override
  Stream<EmployeeState> mapEventToState(
    EmployeeEvent event,
  ) async* {
    if (event is EmployeeStartedEvent) {
      yield EmployeeStarted();
      var s = await employeeRepository.getEmployee();
      yield s.fold(
          (l) => EmployeeError(l),
          (r) => EmployeeSucess(
                employee: r,
              ));
    } else if (event is EmployeeSuccessEvent) {
      log(event.employee.toString());
      yield EmployeeSucess(employee: event.employee);
    } else if (event is EmployeeErrorEvent) {
      yield EmployeeError(event.errors);
    }
  }
}
