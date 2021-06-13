import 'package:hive/hive.dart';

part 'company_model.g.dart';

@HiveType(typeId: 2)
class CompanyModel {
  CompanyModel({
    this.name,
    this.catchPhrase,
    this.bs,
  });
  @HiveField(0)
  String name;
  @HiveField(1)
  String catchPhrase;

  @HiveField(2)
  String bs;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json["name"] ?? "nill",
        catchPhrase: json["catchPhrase"] ?? "",
        bs: json["bs"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
