import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/employee_model.dart';

class EmployeeDetailPage extends StatelessWidget {
  final EmployeeModel employeeModel;
  const EmployeeDetailPage({Key key, this.employeeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            employeeModel.profileImage.isEmpty
                ? Image.asset(
                    "assets/image/user.jpg",
                    height: 100,
                  )
                : CachedNetworkImage(
                    imageUrl: employeeModel.profileImage,
                  ),
            EmployeTile(
              subTitle: employeeModel.name,
              title: "Name",
            ),
            EmployeTile(
              subTitle: employeeModel.username,
              title: "Username",
            ),
            EmployeTile(
              subTitle: employeeModel.phone,
              title: "Phone Number",
            ),
            EmployeTile(
              subTitle: employeeModel.email,
              title: "Email",
            ),
            EmployeTile(
              subTitle: employeeModel.website,
              title: "Website",
            ),
            TitleCard(
              title: "Address",
            ),
            EmployeTile(
              subTitle: employeeModel.address.street,
              title: "Street",
            ),
            EmployeTile(
              subTitle: employeeModel.address.city,
              title: "City",
            ),
            EmployeTile(
              subTitle: employeeModel.address.suite,
              title: "Suite",
            ),
            EmployeTile(
              subTitle: employeeModel.address.zipcode,
              title: "Zipcode",
            ),
            EmployeTile(
              subTitle: employeeModel.name,
              title: "Name",
            ),
            TitleCard(
              title: "Company Details",
            ),
            EmployeTile(
              subTitle: employeeModel.company.name,
              title: "Company name",
            ),
          ],
        ),
      )),
    );
  }
}

class TitleCard extends StatelessWidget {
  const TitleCard({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeTile extends StatelessWidget {
  const EmployeTile({
    Key key,
    @required this.subTitle,
    this.title,
  }) : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(
        subTitle.isEmpty ? "Nill" : subTitle,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
