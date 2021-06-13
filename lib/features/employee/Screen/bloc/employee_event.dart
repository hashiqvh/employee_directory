part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class EmployeeStartedEvent extends EmployeeEvent {}

class EmployeeSuccessEvent extends EmployeeEvent {
  final List<EmployeeModel> employee;

  EmployeeSuccessEvent({this.employee});
  @override
  List<Object> get props => [
        this.employee,
      ];
}

class EmployeeErrorEvent extends EmployeeEvent {
  final Errors errors;

  EmployeeErrorEvent({this.errors});
  @override
  List<Object> get props => [errors];
}
