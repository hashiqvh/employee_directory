import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'containor.dart' as container;
import 'core/constants/db_constants.dart';
import 'features/employee/Screen/bloc/employee_bloc.dart';
import 'features/employee/Screen/home.dart';
import 'features/employee/data/model/address_model.dart';
import 'features/employee/data/model/company_model.dart';
import 'features/employee/data/model/employee_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<EmployeeModel>(EmployeeModelAdapter());
  Hive.registerAdapter<AddressModel>(AddressModelAdapter());
  Hive.registerAdapter<CompanyModel>(CompanyModelAdapter());

  await Hive.openBox<EmployeeModel>(EMPLOYEE);
  await container.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmployeeBloc(employeeRepository: container.sl())
            ..add(EmployeeStartedEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Employee directory',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: Home(),
      ),
    );
  }
}
