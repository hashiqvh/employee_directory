import 'package:flutter/material.dart';

import '../../data/model/employee_model.dart';
import 'employee_card.dart';

class EmployeeSearch extends SearchDelegate<EmployeeModel> {
  final List<EmployeeModel> employeeModel;

  EmployeeSearch({
    @required this.employeeModel,
  });
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.blueGrey[100],
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchBody(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchBody(context);
  }

  Widget buildSearchBody(BuildContext context) {
    List<EmployeeModel> tempemployeeModel = [];

    if (query.isEmpty)
      tempemployeeModel = this.employeeModel;
    else {
      this.employeeModel.forEach((element) {
        if (element.name.toLowerCase().contains(query.toLowerCase()) ||
            element.email.toLowerCase().contains(query.toLowerCase()))
          tempemployeeModel.add(element);
      });
    }

    if (tempemployeeModel.isEmpty)
      return Center(
        child: Text("No results"),
      );

    return ListView.builder(
      itemCount: tempemployeeModel.length,
      itemBuilder: (context, index) {
        return EmployeeCard(
          employeeModel: tempemployeeModel[index],
        );
      },
    );
  }
}
