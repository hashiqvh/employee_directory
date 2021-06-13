import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../containor.dart';
import 'widget/employee_card.dart';
import 'widget/loading_screen.dart';
import 'widget/search_employee.dart';
import '../data/model/employee_model.dart';
import '../domain/repo/employee_repo.dart';

import 'bloc/employee_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<EmployeeModel> employeeModel;
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text("Employee directory"),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () async {
              if (employeeModel == null) return;

              var result = await showSearch<EmployeeModel>(
                context: context,
                delegate: EmployeeSearch(
                  employeeModel: employeeModel,
                ),
              );

              if (result == null) return;
            },
          ),
        ],
      ),
      body: SafeArea(
          child: BlocProvider(
              create: (context) =>
                  EmployeeBloc(employeeRepository: sl<EmployeeRepository>())
                    ..add(EmployeeStartedEvent()),
              child: BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  if (state is EmployeeSucess) {
                    employeeModel = state.employee;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.employee.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: EmployeeCard(
                              employeeModel: state.employee[index],
                            ),
                          );
                        });
                  }
                  return LoadingWidget();
                },
              ))),
    );
  }
}
