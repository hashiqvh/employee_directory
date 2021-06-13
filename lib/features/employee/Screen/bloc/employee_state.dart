part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeStarted extends EmployeeState {}

class EmployeeSucess extends EmployeeState {
  final List<EmployeeModel> employee;

  EmployeeSucess({this.employee});
  @override
  List<Object> get props => [employee];
}

class EmployeeError extends EmployeeState {
  final Errors errors;

  EmployeeError(this.errors);
  @override
  List<Object> get props => [errors];
}
