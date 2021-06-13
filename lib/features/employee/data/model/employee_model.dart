import 'dart:convert';

import 'package:hive/hive.dart';

import '../../data/model/address_model.dart';
import '../../data/model/company_model.dart';

part 'employee_model.g.dart';

EmployeeModel employeeFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeToJson(EmployeeModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class EmployeeModel {
  EmployeeModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profileImage,
    this.address,
    this.phone,
    this.website,
    this.company,
  });
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String username;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String profileImage;
  @HiveField(5)
  final AddressModel address;
  @HiveField(6)
  final dynamic phone;
  @HiveField(7)
  final String website;
  @HiveField(8)
  CompanyModel company;
  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        profileImage: json["profile_image"] ?? "",
        address: AddressModel.fromJson(json["address"]) ?? "",
        phone: json["phone"] ?? "",
        website: json["website"] ?? "",
        company: CompanyModel.fromJson(json["company"]) ?? "nill",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "name": name ?? "",
        "username": username ?? "",
        "email": email ?? "",
        "profile_image": profileImage ?? "",
        "address": address.toJson() ?? "",
        "phone": phone ?? "",
        "website": website ?? "",
        "company": company.toJson() ?? "",
      };
}
