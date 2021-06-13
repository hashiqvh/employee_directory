import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/employee_model.dart';
import 'employee_details.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    Key key,
    this.employeeModel,
  }) : super(key: key);
  final EmployeeModel employeeModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmployeeDetailPage(
            employeeModel: employeeModel,
          ),
        ),
      ),
      leading: Container(
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(72.0),
          child: employeeModel.profileImage.isEmpty
              ? Image.asset("assets/image/user.jpg")
              : CachedNetworkImage(
                  imageUrl: employeeModel.profileImage,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
        ),
      ),
      title: Text(
        employeeModel.name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(employeeModel.company.name ?? ""),
    );
  }
}
